// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/monument_response.dart';

class LabeledBox extends StatelessWidget {
  final Monument monument;
  final double fontSize;
  final double borderRadius;

  const LabeledBox({
    Key? key,
    required this.monument,
    this.fontSize = 20,
    this.borderRadius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.indigo[400]!,
                spreadRadius: 3,
                blurRadius: 8,
                blurStyle: BlurStyle.inner,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(this.borderRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Text(
                this.monument.name,
                style: TextStyle(
                  fontSize: this.fontSize,
                  color: Colors.grey[900],
                ),
              ),
            ),
          )),
    );
  }
}
