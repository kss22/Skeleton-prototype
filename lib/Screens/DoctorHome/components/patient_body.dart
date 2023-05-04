import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen_individual.dart';
import 'package:skeleton_prototype/Screens/List/pharmacies_screen.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

class PatientBody extends StatefulWidget {
  const PatientBody({Key? key}) : super(key: key);

  @override
  _PatientBodyState createState() => _PatientBodyState();
}

class _PatientBodyState extends State<PatientBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Karim"),
        actions: [
          IconButton(onPressed: () {Navigator.pushNamed(context, '/chat_page');}, icon: Icon(Icons.message)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 250.0,
            child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/images.png",
                      ),
                    ))),
          ),
          Text(
            "Karim",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          SizedBox(
            height: 26.0,
          ),
          // FlatButton(
          //   onPressed: () {
          //     //TODO add function for alternatives
          //     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Alternative()));
          //   },
          //   child: Text(
          //     "ORDER",
          //     style: TextStyle(
          //       color: kPrimaryLightColor,
          //     ),
          //   ),
          //   color: kPrimaryColor,
          // ),
          RoundedButton(
            text: "Write Prescription",
            color: kPrimaryLightColor,
            textColor: kPrimaryColor,
            press: () {
              Navigator.pushNamed(context, '/prescription');
            },
          ),
          // FlatButton(
          //   onPressed: () {
          //     //TODO add function for alternatives
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapScreen()));
          //   },
          //   child: Text(
          //     "Location",
          //     style: TextStyle(
          //       color: kPrimaryLightColor,
          //     ),
          //   ),
          //   color: kPrimaryColor,
          // ),
          RoundedButton(
            text: "Recommend Pharmacy",
            color: kPrimaryLightColor,
            textColor: kPrimaryColor,
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Pharmacies()));
            },
          ),
          // FlatButton(
          //   onPressed: () {
          //     //TODO add function for alternatives
          //     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Alternative()));
          //   },
          //   child: Text(
          //     "Message",
          //     style: TextStyle(
          //       color: kPrimaryLightColor,
          //     ),
          //   ),
          //   color: kPrimaryColor,
          // ),
          RoundedButton(
            text: "Message",
            color: kPrimaryLightColor,
            textColor: kPrimaryColor,
            press: () {
              Navigator.pushNamed(context, '/chat');
            },
          ),
          SizedBox(height: 40,),
          Text(
            "Scan to follow",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          SizedBox(height: 40,),
          Container(
            height: 120,
            width: 120,
            child: Image.asset("assets/icons/qr.png"),
          )
        ],
      ),
      // CircleAvatar(
      //   radius: 60.0,
      //   child: Container(
      //       margin: EdgeInsets.all(18),
      //       child: Image.asset("assets/icons/mazen.jpeg")),
      // ),
    );
  }
}
