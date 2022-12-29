import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_text/styled_text.dart';
import 'widgets/drawer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List _items = [];
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    readJson();
  }

// Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kaufleute - Begriffe"),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: TextField(
              controller: _controller,
              onChanged: (t) {
                if(_controller.text == ""){
                  readJson();
                }else {
                  _items = _items.where((element) =>
                      element['title'].toString().toLowerCase().contains(t.toLowerCase())).toList();
                  setState(() {});
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: 'Schreibe etwas...',
                prefixIcon: const Icon(Icons.search),
                isDense: true,
                suffixIcon: IconButton(
                  onPressed: () {
                    readJson();
                    FocusScope.of(context).unfocus();
                    setState(() {});
                    _controller.clear();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: _items.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 10),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: Text(_items[i]['abbreviation']),
                      ),
                    ),
                    title: Text(
                        _items[i]['title'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    subtitle:StyledText(
                       text :_items[i]['subtitle'],
                       tags:  {
                        'b': StyledTextTag(
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                        'i': StyledTextTag(
                        style: const TextStyle(fontStyle: FontStyle.italic)),
                        'c' :StyledTextTag(
                        style: const TextStyle(color: Colors.red)),
                       },
                      // style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
