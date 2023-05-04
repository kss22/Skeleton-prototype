import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/components/patient_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/components/prescription_body.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/prescription_screen.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

import '../doctor_home_screen.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class PatientsList extends StatefulWidget {
  const PatientsList({Key? key}) : super(key: key);

  @override
  _PatientsListState createState() => _PatientsListState();
}

class _PatientsListState extends State<PatientsList> {
  List<Map<dynamic, dynamic>> prescriptionsList = [];
  List<Map<dynamic, dynamic>> filteredList = [];
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  bool _isLoading = true;

  void initState() {
    super.initState();
    databaseReference.child('users').onValue.listen((event) {
      setState(() {
        _isLoading = false;
        prescriptionsList = [];
        Map<dynamic, dynamic> values = event.snapshot.value;
        values.forEach((key, value) {
          prescriptionsList.add(value);
        });
        filteredList = List.from(prescriptionsList);
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
          .where((user) => user['name'].toString().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Patients"),
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
                  if (route.settings.name == '/') {
                    return true;
                  } else {
                    return false;
                  }
                });
              },
              icon: Icon(Icons.exit_to_app))
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
  String? _doctorNameController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.user['name']),
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
                        'Patient Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      UserInfoRow(title: 'Email', value: widget.user['email']),
                      UserInfoRow(title: 'Name', value: widget.user['name']),
                      UserInfoRow(
                          title: 'Phone Number', value: widget.user['phone']),
                      UserInfoRow(
                          title: 'Medical conditions',
                          value: widget.user['meds']),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            RoundedButton(
              text: "Write prescription",
              press: () async {
                User? users = FirebaseAuth.instance.currentUser;
                String uid = users?.uid ?? "";

                final databaseReference = FirebaseDatabase.instance.reference();
                DataSnapshot snapshot =
                    await databaseReference.child('doctors').child(uid).once();
                setState(() {
                  _doctorNameController = snapshot.value['name'];
                });
                print(_doctorNameController);
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => PrescriptionScreen(
                    name: widget.user['name'],
                    uid: widget.user['uid'],
                    doctor: _doctorNameController,
                  ),
                ));
              },
            ),
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
