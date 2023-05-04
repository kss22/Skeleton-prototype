import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Login_entity/components/background.dart';
import 'package:skeleton_prototype/components/rounded_button.dart';
import 'package:skeleton_prototype/constants.dart';

class BodyEntity extends StatefulWidget {
  const BodyEntity({Key? key}) : super(key: key);

  @override
  _BodyEntityState createState() => _BodyEntityState();
}

class _BodyEntityState extends State<BodyEntity> {
  String dropdownvalue = 'Choose here';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          Text(
            "Welcome to medicalife",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          ),
          Image.asset(
            "assets/icons/img_3.png",
            height: size.height*0.45,
            width: size.width*0.45,
          ),
          Text(
            "Who Are You?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 32.0,
            ),
          ),
          SizedBox(height: 30),
          DecoratedBox(
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
              borderRadius: BorderRadius.circular(29),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 60, right: 60),
              child: DropdownButton(
                style: Theme.of(context).textTheme.headline6,
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: entities.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                  });
                },
              ),
            ),
          ),
          SizedBox(height: 30,),
          if (dropdownvalue == "User")
            RoundedButton(
              text: "Continue",
              color: kPrimaryColor,
              press: () {
                //TODO change signup page
                Navigator.pushNamed(context, '/login');
              },
            ),
          if (dropdownvalue == "Pharmacist")
            RoundedButton(
              text: "Continue",
              color: kPrimaryColor,
              press: () {
                //TODO change signup page
                Navigator.pushNamed(context, '/login_pharmacist');
              },
            ),
          if (dropdownvalue == "Doctor")
            RoundedButton(
              text: "Continue",
              color: kPrimaryColor,
              press: () {
                //TODO change signup page
                Navigator.pushNamed(context, '/login_doctor');
              },
            ),
        ],
      ),
    );
  }
}

// class Body extends StatelessWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Background(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(height: 80),
//             Text(
//               "Welcome to medicalife",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
//             ),
//             Image.asset(
//               "assets/icons/img_3.png",
//               height: size.height*0.45,
//               width: size.width*0.45,
//             ),
//             Text(
//               "Who Are You?",
//               style: TextStyle(
//                 fontWeight: FontWeight.w600,
//                 fontSize: 32.0,
//               ),
//             ),
//             DropdownButton(
//                 value: "Choose here",
//                 icon: const Icon(Icons.keyboard_arrow_down),
//                 items: entities.map((String entities) {
//                   return DropdownMenuItem(
//                   value: entities,
//                   child: Text(entities),
//     );
//                 }).toList(),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     dropdownvalue = newValue!;
//                   });
//                   },
//             ),
//           ],
//         ),
//     );
//   }
// }
