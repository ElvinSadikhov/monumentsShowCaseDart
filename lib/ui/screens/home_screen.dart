import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/monument_response.dart';
import 'package:monuments_app/services/explore_service.dart';
import 'package:monuments_app/ui/widgets/labeled_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExploreService exploreService = ExploreService();

  late Future<MonumentResponse> monumentResponse;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    monumentResponse = exploreService.getMonuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("CSDC"),
        ),
        body: Center(
          child: FutureBuilder<MonumentResponse>(
            future: monumentResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.monuments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return LabeledCard(
                        labelMain: snapshot.data!.monuments[index].name,
                        labelSecondary:
                            snapshot.data!.monuments[index].location,
                        imageUrl: snapshot.data!.monuments[index].photoUrl,
                        description:
                            snapshot.data!.monuments[index].description,
                        uid: snapshot.data!.monuments[index].uid);
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Some error occured! Error: ${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
