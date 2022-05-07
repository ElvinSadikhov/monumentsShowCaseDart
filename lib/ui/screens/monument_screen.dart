// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/monument_response.dart';
import 'package:monuments_app/ui/screens/quiz_screen.dart';
import 'package:monuments_app/utils/helper/widget_method.dart';

class MonumentScreen extends StatelessWidget {
  final Monument monument;

  const MonumentScreen({Key? key, required this.monument}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(this.monument.name),
      ),
      body: Stack(children: [
        SizedBox(
          height: sizeOfScreen.height,
          width: sizeOfScreen.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  width: sizeOfScreen.width,
                  height: 300,
                  child: Image.network(
                    this.monument.photoUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                WidgetMethods.verticalSpace(10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Location of monument: ${this.monument.location}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    WidgetMethods.verticalSpace(20),
                    const Text(
                      "Description",
                      style: TextStyle(fontSize: 24),
                    ),
                    const Divider(
                      color: Colors.black87,
                      thickness: 2,
                      indent: 12,
                      endIndent: 12,
                    ),
                    WidgetMethods.verticalSpace(20),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: Text(
                          this.monument.description,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 40,
          child: Container(
            width: sizeOfScreen.width,
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onDoubleTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizScreen(
                            uid: this.monument.uid,
                            monumentName: this.monument.name)));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 30,
                  width: 200,
                  color: Colors.amber,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Take a quiz",
                          style: TextStyle(fontSize: 18),
                        )
                      ]),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
