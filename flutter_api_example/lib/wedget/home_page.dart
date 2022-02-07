import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_example/pages/user_list_header_widget.dart';
import 'package:flutter_api_example/pages/user_list_widget.dart';
import 'package:flutter_api_example/serveice/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder<List<dynamic>>(
          future: ApiService.getUserList(""),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, position) {
                    if (position == 0) {
                      return userListHeaderWidget(
                          snapshot.data![position]["picture"]["medium"]
                              .toString(),
                          snapshot.data![position]["name"]["title"].toString() +
                              " " +
                              snapshot.data![position]["name"]["first"]
                                  .toString() +
                              " " +
                              snapshot.data![position]["name"]["last"]
                                  .toString(),
                          "City : " +
                              snapshot.data![position]["location"]["city"]
                                  .toString() +
                              "\n" +
                              "State :" +
                              snapshot.data![position]["location"]["satate"]
                                  .toString() +
                              "\n" +
                              "Country : " +
                              snapshot.data![position]["location"]["country"]
                                  .toString(),
                          context);
                    } else {
                      return userListWidget(
                          snapshot.data![position]["picture"]["medium"]
                              .toString(),
                          snapshot.data![position]["name"]["title"].toString() +
                              " " +
                              snapshot.data![position]["name"]["first"]
                                  .toString() +
                              " " +
                              snapshot.data![position]["name"]["list"]
                                  .toString(),
                          snapshot.data![position]["email"].toString(),
                          context);
                    }
                  },
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
    );
  }
}
