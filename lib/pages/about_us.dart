import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

import "home_page.dart";

class AboutUs extends StatelessWidget {
  AboutUs({Key? key}) : super(key: key);
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
      body: Center(
        child: Text(
          "This is About Us Page",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Roboto",
          ),
        ),
      ),
    );
  }
}
