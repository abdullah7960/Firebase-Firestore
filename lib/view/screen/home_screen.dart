import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 30),
                    child: Icon(
                      Icons.list,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0, left: 30),
                    child: Text(
                      "Drawer",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ],
              ),
              color: Colors.lightBlue,
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Home Page",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Navigator.of(context).pushReplacementNamed(HomePage.routeName);
              },
            ),
            Divider(
              height: 10,
              color: Colors.black,
              indent: 65,
            ),
            ListTile(
              leading: Icon(
                Icons.add_box,
                color: Colors.orangeAccent,
              ),
              title: Text(
                "Add Gadgets ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Navigator.of(context).pushNamed(AddUser.routeName);
              },
            ),
            Divider(
              height: 10,
              indent: 65,
              color: Colors.black,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("GADGETS LIST"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.filter_b_and_w,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}
