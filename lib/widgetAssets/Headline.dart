import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';

class Headline extends StatelessWidget {
  final String title;
  final Function() onPressed;

  const Headline({required this.title, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Col.lightBlue,
            ),
            child: const Text(
              "View More",
              style: TextStyle(
                color: Color(0xff15BE77),
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
