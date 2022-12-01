import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Home/components/search.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/Screens/List/pharmacies_screen.dart';
import 'package:skeleton_prototype/Screens/Pharmacy/pharmacy_screen.dart';
import 'package:skeleton_prototype/constants.dart';

class PharmaciesList extends StatefulWidget {
  const PharmaciesList({Key? key}) : super(key: key);

  @override
  _PharmaciesListState createState() => _PharmaciesListState();
}

class _PharmaciesListState extends State<PharmaciesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Your Pharmacies"),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                child:
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(29.0)
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CircleAvatar(
                              radius: 25.0,
                              child: Image.asset("assets/icons/img_3.png"),
                            ),
                          ),
                          Text("Pharmacy " + index.toString(), style: TextStyle(fontSize: 24.0),),
                        ],
                      )),
                ),
                // onTap: () => Scaffold
                //     .of(context)
                //     .showSnackBar(SnackBar(content: Text("Chat Username" + index.toString()))),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Pharmacy()));
                },
              );
            },
            itemCount: 20),
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
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
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
                onPressed: () {},
              ),
              IconButton(
                iconSize: 30.0,
                padding: EdgeInsets.only(right: 28.0),
                icon: Icon(Icons.list),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Pharmacies()));
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
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            // elevation: 5.0,
          ),
        ),
      ),
    );
  }
}
