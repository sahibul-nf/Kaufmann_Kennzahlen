import 'package:flutter/material.dart';

import '../../about_page/about_screen.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Image.asset("assets/happy.gif"),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("Über Uns"),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AboutScreen(),
              ),
            ),
          ),
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
                        children: const <Widget>[
                          Center(
                            child: Text(
                              "https://www.spasslerndenk.com/ihk-lernkarten",
                              style: TextStyle(fontSize: 20.0),
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
          const Divider(height: 10.0),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("App Veriosn 1.0.0"),
            onTap: () => showAboutDialog(
              context: context,
              applicationName: 'Kaufleute - Kennzahlen',
              applicationVersion: '1.0.0',
            ),
          ),
        ],
      ),
    );
  }
}
