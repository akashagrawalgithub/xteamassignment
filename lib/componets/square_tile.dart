import "package:flutter/material.dart";

// ignore: must_be_immutable
class SquareTile extends StatelessWidget {
  Function()? onTap;
  final String image;
  SquareTile({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Image.network(
          image,
          width: 50,
        ),
      ),
    );
  }
}
