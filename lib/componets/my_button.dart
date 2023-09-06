import "package:flutter/material.dart";

class Mybutton extends StatelessWidget {
  final Function()? onTap;
  const Mybutton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 30.0, right: 30.0),
        padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 19,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
