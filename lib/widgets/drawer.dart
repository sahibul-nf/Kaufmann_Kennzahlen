import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Image.asset("assets/images/happy.gif"),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Quellen"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Sources"),
                  ),
                  body: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: TextButton(
                              child: const Text(
                                "https://www.spasslerndenk.com/ihk-lernkarten",
                                style: TextStyle(fontSize: 20.0),
                              ),
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "https://www.spasslerndenk.com/ihk-lernkarten"));
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
