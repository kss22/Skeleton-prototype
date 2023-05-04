import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/components/patient_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/components/prescription_body.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/prescription_screen.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class PharmacyPatientsList extends StatefulWidget {
  const PharmacyPatientsList({Key? key}) : super(key: key);

  @override
  _PharmacyPatientsListState createState() => _PharmacyPatientsListState();
}

class _PharmacyPatientsListState extends State<PharmacyPatientsList> {
  List<Map<dynamic, dynamic>> usersList = [];
  List<Map<dynamic, dynamic>> filteredList = [];
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  bool _isLoading = true;

  void initState() {
    super.initState();
    databaseReference.child('users').onValue.listen((event) {
      setState(() {
        _isLoading = false;
        usersList = [];
        Map<dynamic, dynamic> values = event.snapshot.value;
        values.forEach((key, value) {
          usersList.add(value);
        });
        filteredList = List.from(usersList);
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterList(String query) {
    setState(() {
      filteredList = usersList
          .where(
              (user) => user['name'].toString().toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Patients"),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showSearchBar = !showSearchBar;
                if (!showSearchBar) {
                  searchController.clear();
                  filterList('');
                }
              });
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route) {
                  if (route.settings.name=='/'){
                    return true;
                  }else{
                    return false;
                  }
                });
              },
              icon: Icon(Icons.exit_to_app)),
        ],
        bottom: showSearchBar
            ? PreferredSize(
                preferredSize: Size.fromHeight(kToolbarHeight),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: filterList,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search by patient name',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              )
            : null,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetails(
                          user: filteredList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        filteredList[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        filteredList[index]['phone'],
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class UserDetails extends StatefulWidget {
  final Map<dynamic, dynamic> user;

  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  List<Map<dynamic, dynamic>> prescriptionsList = [];
  List<Map<dynamic, dynamic>> filteredList = [];
  List<String> prescriptionsKeyList = [];
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    final DatabaseReference prescriptionsRef = databaseReference
        .child('users')
        .child(widget.user['uid'])
        .child("prescriptions");
    prescriptionsRef
        .orderByChild('state')
        .equalTo('pending')
        .onValue
        .listen((event) {
      setState(() {
        _isLoading = false;
        prescriptionsList = [];
        prescriptionsKeyList = [];
        Map<dynamic, dynamic> values = event.snapshot.value;
        values.forEach((key, value) {
          prescriptionsList.add(value);
          prescriptionsKeyList.add(key);
        });
        filteredList = List.from(prescriptionsList);
        print(prescriptionsKeyList);
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterList(String query) {
    setState(() {
      filteredList = prescriptionsList
          .where(
              (prescription) => prescription['name'].toString().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Pending Prescriptions"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            User? user = FirebaseAuth.instance.currentUser;

            String uid = user?.uid ?? "";
            final databaseReference = FirebaseDatabase.instance.reference();
            DatabaseReference prescriptionsRef = databaseReference
                .child('pharmacies')
                .child(uid)
                .child('loyal_customers');
            prescriptionsRef.push().set(widget.user);
          }, icon: Icon(Icons.favorite_border))
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrescriptionDetails(
                          prescription: filteredList[index],
                          uid: widget.user['uid'],
                          keys: prescriptionsKeyList[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        filteredList[index]['medication'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        filteredList[index]['dosage'],
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class PrescriptionDetails extends StatefulWidget {
  final Map<dynamic, dynamic> prescription;
  final String uid;
  final String keys;

  const PrescriptionDetails(
      {Key? key, required this.prescription, required this.uid, required this.keys})
      : super(key: key);

  @override
  _PrescriptionDetailsState createState() => _PrescriptionDetailsState();
}

class _PrescriptionDetailsState extends State<PrescriptionDetails> {
  String oldQuantity="";
  String medKey="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.prescription['medication']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 26.0,
            ),
            Container(
              width: double.infinity,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Prescription Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      UserInfoRow(
                          title: 'Medicine',
                          value: widget.prescription['medication']),
                      UserInfoRow(
                          title: 'Dose', value: widget.prescription['dosage']),
                      UserInfoRow(
                          title: 'Frequency',
                          value: widget.prescription['frequency']),
                      UserInfoRow(
                          title: 'Doctor Name',
                          value: widget.prescription['doctor']),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            RoundedButton(
                text: "Confirm Purchase",
                press: () {
                  setState(() {
                    final DatabaseReference prescriptionRef = FirebaseDatabase.instance
                        .reference()
                        .child('users')
                        .child(widget.uid)
                        .child('prescriptions')
                        .child(widget.keys);
                    prescriptionRef.onValue.listen((event1) {
                      print(event1.snapshot.value);
                      User? user = FirebaseAuth.instance.currentUser;
                      String uid = user?.uid ?? "";
                      final DatabaseReference medRef = FirebaseDatabase.instance
                          .reference()
                          .child('pharmacies')
                          .child(uid)
                          .child('meds');
                      medRef.onValue.listen((event2) {
                        print(event2.snapshot.value);
                        Map<dynamic, dynamic> meds = event2.snapshot.value;
                        print(meds);
                        String medName = event1.snapshot.value['medication'];
                        print(medName);
                        for (var key in meds.keys) {
                          if (meds[key]['medication'] == medName) {
                            medKey = key;
                            oldQuantity = meds[key]['quantity'];
                            print(oldQuantity);
                            break;
                          }
                        }
                        //
                      });
                      medRef.child(medKey).update({'quantity': "${int.parse(oldQuantity) - 1}"});
                      prescriptionRef.update({'state': 'done'}).then((_) {
                        Navigator.pop(context);
                      }).catchError((error) {
                        // Handle the error
                        print(error);
                      });
                    });
                  });

                }),
          ],
        ),
      ),
    );
  }
}

class UserInfoRow extends StatelessWidget {
  final String title;
  final String value;

  UserInfoRow({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
