import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/componets/data.dart';

import 'about_us.dart';
import 'home_page.dart';

class DetailPage extends StatelessWidget {
  final int index;
  final String imageUrl;
  final user = FirebaseAuth.instance.currentUser!;

  DetailPage({required this.index, required this.imageUrl});
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.dashboard),
                title: Text("Go to Dashboard"),
              ),
            ),
            
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              data[index],
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
