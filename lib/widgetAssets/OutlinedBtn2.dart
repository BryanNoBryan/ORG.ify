import 'package:flutter/material.dart';

class OutlinedBtn2 extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const OutlinedBtn2({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff2749FD);

    const double borderRadius = 40;

    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          side: MaterialStateProperty.all(
              const BorderSide(color: primaryColor, width: 1.4)),
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.w300, color: primaryColor),
        ),
        const Icon(Icons.arrow_forward, color: primaryColor)
      ]),
    );
  }
}
