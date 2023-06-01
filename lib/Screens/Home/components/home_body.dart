import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/MedicineList.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen.dart';
import 'package:skeleton_prototype/Screens/Home/components/map_screen.dart';
import 'package:skeleton_prototype/Screens/Home/components/search.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/List/pharmacies_screen.dart';
import 'package:skeleton_prototype/Screens/UserProfile/user_profile_screen.dart';
import 'package:skeleton_prototype/Screens/model/adol.dart';
import 'package:skeleton_prototype/Screens/model/advil.dart';
import 'package:skeleton_prototype/Screens/model/panadol.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class HomeBody extends StatefulWidget {

  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  List<Map<dynamic, dynamic>> medicinesList = [];

  void createMedicineNode(MedicineList medicine) {
    DatabaseReference medicinesRef = databaseReference.child('medicines');

    DatabaseReference newMedicineRef = medicinesRef.push();
    newMedicineRef.set(medicine.toMap()).then((value) {
      // Medicine node added successfully
    }).catchError((error) {
      // Handle error
    });
  }
  void initState() {

    // MedicineList medicine = MedicineList(
    //   medication: 'Advil',
    //   dosage: '50',
    //   price: '300000',
    // );
    //
    // createMedicineNode(medicine);
    final DatabaseReference medsRef = databaseReference.child("medicines");
    medsRef.once().then((DataSnapshot snapshot) {
      setState(() {
        medicinesList = [];
        Map<dynamic, dynamic> values = snapshot.value;
        values.forEach((key, value) {
          medicinesList.add(value);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Medicalife"),
        actions: [
          IconButton(
            onPressed: () {
              //TODO add map
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MapScreen()));
            },
            icon: Icon(Icons.location_on),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Chat()));
            },
            icon: Icon(Icons.chat),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: medicinesList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetails(
                    medicine: medicinesList[index],
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
                  medicinesList[index]['medication'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  medicinesList[index]['dosage'],
                  style: TextStyle(fontSize: 14),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 75,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegates(medicinesList: medicinesList));
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.pushNamed(context, "/notification");
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Pharmacies()));
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 65.0,
        width: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UserProfileScreen()));
            },
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}

class UserDetails extends StatefulWidget {
  final Map<dynamic, dynamic> medicine;

  const UserDetails({Key? key, required this.medicine}) : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(widget.medicine['medication']),
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
                        'Medicine Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      UserInfoRow(title: 'Medicine', value: widget.medicine['medication']),
                      UserInfoRow(title: 'Dose', value: widget.medicine['dosage']),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.0,
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

  UserInfoRow({Key? key, required this.title, required this.value}) : super(key: key);

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

class CustomSearchDelegates extends SearchDelegate<String> {
  final List<Map<dynamic, dynamic>> medicinesList;

  CustomSearchDelegates({required this.medicinesList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = medicinesList.where((medicine) {
      final medication = medicine['medication'].toLowerCase();
      return medication.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]['medication']),
          subtitle: Text(results[index]['dosage']),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetails(medicine: results[index]),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = medicinesList.where((medicine) {
      final medication = medicine['medication'].toLowerCase();
      return medication.contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]['medication']),
          subtitle: Text(suggestions[index]['dosage']),
          onTap: () {
            query = suggestions[index]['medication'];
            showResults(context);
          },
        );
      },
    );
  }
}