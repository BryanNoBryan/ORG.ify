import 'package:flutter/material.dart';
import 'package:midyear/Col.dart';

class Announcement extends StatelessWidget {
  final String title;
  final String description;
  final Function() onPressed;

  const Announcement(
      {required this.title,
      required this.description,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Col.lightBlue,
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 79, 79, 79)),
                ),
              ),
            ],
          )),
    );
  }
}
