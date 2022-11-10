import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/Chat/chat_screen.dart';
import 'package:skeleton_prototype/Screens/Home/components/search.dart';
import 'package:skeleton_prototype/Screens/Home/home_screen.dart';
import 'package:skeleton_prototype/constants.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
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
            },
            icon: Icon(Icons.location_on),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chat()));
            },
            icon: Icon(Icons.chat),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Container(
                  color: kPrimaryLightColor,
                  padding: EdgeInsets.all(5.0),
                  margin: EdgeInsets.symmetric(vertical: 0),
                  height: 80,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                      SizedBox(
                        height: 5.0,
                        width: 5.0,
                      ),
                      CircleAvatar(
                        radius: 40,
                        child: Image.asset("assets/icons/img_3.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
                Image.asset('assets/icons/img_3.png'),
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
                onPressed: () {},
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
