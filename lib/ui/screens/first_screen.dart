import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/monument_response.dart';
import 'package:monuments_app/services/explore_service.dart';
import 'package:monuments_app/ui/widgets/labeled_card.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  ExploreService exploreService = ExploreService();

  MonumentResponse monumentResponse = MonumentResponse(monuments: []);

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  void fetchData() async {
    monumentResponse = await exploreService.getMonuments();
    setState() {}

    debugPrint(monumentResponse.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CSDC"),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: monumentResponse.monuments.length,
            itemBuilder: (BuildContext context, int index) {
              return LabeledCard(
                  labelMain: monumentResponse.monuments[index].name,
                  labelSecondary: monumentResponse.monuments[index].location,
                  imageUrl: monumentResponse.monuments[index].photoUrl,
                  description: monumentResponse.monuments[index].description,
                  uid: monumentResponse.monuments[index].uid);
            },
          ),
        ));
  }
}
