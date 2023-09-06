import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import "package:flutter_login/componets/data.dart";

import 'about_us.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void SignUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignment by Mohit Sir"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text(
                "login as: ${user.email}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Roboto",
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutUs(),
                    ));
              },
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("About Us"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Go to Dashboard"),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: GestureDetector(
                onTap: SignUserOut,
                child: Text("Logout"),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            final even = index % 2 == 0;
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      index: index,
                      imageUrl: even
                          ? "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg"
                          : "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_640.jpg",
                    ),
                  ),
                );
              },
              child: even ? Left(index) : Right(index),
            );
          },
        ),
      ),
    );
  }
}

Widget Left(index) {
  return Container(
    // margin: EdgeInsets.only(top: 3, bottom: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            "https://thumbs.dreamstime.com/b/environment-earth-day-hands-trees-growing-seedlings-bokeh-green-background-female-hand-holding-tree-nature-field-gra-130247647.jpg",
            width: 100,
            height: 100,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Text(
            "${data[index]}",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    ),
  );
}

Widget Right(index) {
  return Container(
    // margin: EdgeInsets.only(top: 3, bottom: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            "${data[index]}",
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            "https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072823_640.jpg",
            width: 100,
            height: 100,
          ),
        ),
      ],
    ),
  );
}
