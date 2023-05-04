import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Camera/components/camera_body.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen.dart';
import 'package:skeleton_prototype/Screens/Chat/contents/doctor_chat_screen.dart';
import 'package:skeleton_prototype/Screens/Form/form_screen.dart';
import 'package:skeleton_prototype/Screens/Home/components/map_screen.dart';
import 'package:skeleton_prototype/Screens/Home/components/search.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/List/pharmacies_screen.dart';
import 'package:skeleton_prototype/Screens/Notification/notification_screen.dart';
import 'package:skeleton_prototype/Screens/PharmacistHome/components/patients_list_pharmacy.dart';
import 'package:skeleton_prototype/Screens/PharmacistProfile/pharmacist_profile.dart';
import 'package:skeleton_prototype/Screens/model/adol.dart';
import 'package:skeleton_prototype/Screens/model/advil.dart';
import 'package:skeleton_prototype/Screens/model/panadol.dart';
import 'package:skeleton_prototype/constants.dart';

import '../pharmacist_home_screen.dart';

class PharmacistHomeBody extends StatefulWidget {
  const PharmacistHomeBody({Key? key}) : super(key: key);

  @override
  _PharmacistHomeBodyState createState() => _PharmacistHomeBodyState();
}

class _PharmacistHomeBodyState extends State<PharmacistHomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60.0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Pharmacist Medicalife"),
        leading: IconButton(
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
          icon: Icon(Icons.exit_to_app),
        ),
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
                  .push(MaterialPageRoute(builder: (context) => DoctorChat()));
            },
            icon: Icon(Icons.chat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 8.0),
            //     child: Container(
            //       color: kPrimaryLightColor,
            //       padding: EdgeInsets.all(5.0),
            //       margin: EdgeInsets.symmetric(vertical: 0),
            //       height: 80,
            //       child: Row(
            //         children: [
            //           CircleAvatar(
            //             radius: 40,
            //             child: Padding(
            //               padding: const EdgeInsets.all(12.0),
            //               child: Image.asset("assets/icons/img_3.png"),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //           SizedBox(
            //             height: 5.0,
            //             width: 5.0,
            //           ),
            //           CircleAvatar(
            //             radius: 40,
            //             child: Image.asset("assets/icons/img_3.png"),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Panadol()));
                      },
                      child: Image.asset('assets/icons/panadol.jpg'),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/profinal.jpeg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/augmontin.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/cataflam.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/flagyl.png'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/advil.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/amoxicillin.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/tylenol.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/motilium.jpeg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Adol()));
                      },
                      child: Image.asset('assets/icons/adol.jpg'),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/augmontin.jpg'),
                  ),
                ),
                // Image.asset('assets/icons/panadol.jpg'),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/cataflam.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/tylenol.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/amoxicillin.jpg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Advil()));
                      },
                      child: Image.asset('assets/icons/advil.jpg'),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/flagyl.png'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/motilium.jpeg'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/muscerol.png'),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryColor),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/icons/adol.jpg'),
                  ),
                ),

                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
                // Image.asset('assets/icons/img_3.png'),
              ],
            ),
          ],
        ),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => PharmacistHomeScreen()));
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
                      delegate: CustomSearchDelegate());
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(left: 28.0),
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NotificationScreen()));
                },
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.account_circle_rounded),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PharmacistProfilePage()));
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PharmacyPatientsList()),
              );
            },
            child: Icon(
              Icons.check_box,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}
