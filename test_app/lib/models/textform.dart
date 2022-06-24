import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {Key? key,
      required this.formText,
      required this.padding,
      required TextFormField child,
      required this.text})
      : super(key: key);

  final String formText;
  final String text;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: padding,
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 30),
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: "Oxygen",
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0, right: 30, left: 30),
          child: TextFormField(
            decoration: InputDecoration(
              labelText: formText,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(),
              ),

              //fillColor: Colors.green
            ),
            style: const TextStyle(
              fontFamily: "Poppins",
            ),
          ),
        ),
      ],
    );
  }
}
