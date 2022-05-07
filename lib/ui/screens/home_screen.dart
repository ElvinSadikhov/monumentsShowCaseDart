import 'package:flutter/material.dart';
import 'package:monuments_app/models/responses/monument_response.dart';
import 'package:monuments_app/services/explore_service.dart';
import 'package:monuments_app/ui/screens/monument_screen.dart';
import 'package:monuments_app/ui/widgets/labeled_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExploreService exploreService = ExploreService();
  late Future<MonumentResponse> exploreResponse;

  @override
  void initState() {
    super.initState();
    exploreResponse = exploreService.getMonuments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: FutureBuilder<MonumentResponse>(
            future: exploreResponse,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.monuments.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MonumentScreen(
                                      monument: snapshot.data!.monuments[index],
                                    )));
                      },
                      child: LabeledBox(
                        monument: snapshot.data!.monuments[index],
                        borderRadius: 20,
                        fontSize: 24,
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text("Some error occured!",
                    style: TextStyle(fontSize: 30));
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
