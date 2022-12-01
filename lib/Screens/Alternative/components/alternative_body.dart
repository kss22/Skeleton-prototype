import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/model/adol.dart';
import 'package:skeleton_prototype/Screens/model/panadol.dart';
import 'package:skeleton_prototype/constants.dart';

class AlternativeBody extends StatefulWidget {
  const AlternativeBody({Key? key}) : super(key: key);

  @override
  _AlternativeBodyState createState() => _AlternativeBodyState();
}

class _AlternativeBodyState extends State<AlternativeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Alternatives"),
      ),
      body: GridView(
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
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Adol()));
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
              child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Panadol()));
                },
                child: Image.asset('assets/icons/panadol.jpg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
