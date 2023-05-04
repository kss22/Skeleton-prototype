import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/DoctorHome/components/patient_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/components/prescription_body.dart';
import 'package:skeleton_prototype/Screens/Prescriptions/prescription_screen.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

final databaseReference = FirebaseDatabase.instance.reference();

class PharmaciesList extends StatefulWidget {
  const PharmaciesList({Key? key}) : super(key: key);

  @override
  _PharmaciesListState createState() => _PharmaciesListState();
}

class _PharmaciesListState extends State<PharmaciesList> {
  List<Map<dynamic, dynamic>> usersList = [];
  List<Map<dynamic, dynamic>> filteredList = [];
  TextEditingController searchController = TextEditingController();
  bool showSearchBar = false;
  bool _isLoading = true;

  void initState() {
    super.initState();
    databaseReference.child('pharmacies').onValue.listen((event) {
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
        title: Text("Pharmacies"),
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
                hintText: 'Search by pharmacy name',
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
  late DatabaseReference _medRef;
  bool _isShow = false;
  List<dynamic> _medsList = [];

  @override
  void initState() {
    super.initState();
    _medRef = FirebaseDatabase.instance
        .reference()
        .child('pharmacies')
        .child(widget.user['uid'])
        .child('meds');
  }

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
                        'Pharmacy Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      UserInfoRow(title: 'Email', value: widget.user['email']),
                      UserInfoRow(title: 'Name', value: widget.user['name']),
                      UserInfoRow(title: 'Phone Number', value: widget.user['phone']),
                      UserInfoRow(title: 'City', value: widget.user['city']),
                      UserInfoRow(title: 'Country', value: widget.user['country']),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26.0,
            ),
            RoundedButton(
              text: "Check Availability",
              press: () {
                _isShow = !_isShow;
                _medRef.onValue.listen((event) {
                  Map<dynamic, dynamic> meds = event.snapshot.value;
                  setState(() {
                    _medsList = meds.values.toList();
                  });
                });
              },
            ),
            if(_isShow)
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
                        'Available Medicines',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      _medsList.isEmpty
                          ? Center(child: Text('No medicines available'))
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: _medsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                                _medsList[index]['medication'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  ),
                                ),
                                subtitle: Text("${_medsList[index]['dosage']} mg",
                                  style: TextStyle(fontSize: 14),
                                ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
