// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List _items = [];
  final _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    readJson();
  }

// Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/data.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  // Color _color = Color.fromARGB(255, 226, 232, 145);

  void _openLink(BuildContext context, Map<String?, String?> attrs) async {
    final String link = attrs['href']!;
    launch(link);
    // setState(() {
    //   _color = Color.fromRGBO(85, 26, 139, 1);
    // });
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
          buildSearchFormWidget(),
          buildListOfTermsWidget(),
        ],
      ),
    );
  }

  buildSearchFormWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: _controller,
        onChanged: (t) {
          if (_controller.text == "") {
            readJson();
          } else {
            _items = _items
                .where((element) => element['title']
                    .toString()
                    .toLowerCase()
                    .contains(t.toLowerCase()))
                .toList();
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
    );
  }

  buildListOfTermsWidget() {
    return Flexible(
      child: ListView.builder(
        itemCount: _items.length,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 20),
        itemBuilder: (context, index) {
          return Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.2),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(left: 18.0),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(_items[index]['abbreviation']),
                ),
              ),
              title: Text(
                _items[index]['title'],
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              subtitle: buildTermSubtitle(index),
            ),
          );
        },
      ),
    );
  }

  buildTermSubtitle(int i) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: _items[i]['subtitle'].length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.square,
                size: 8,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: StyledText(
                textHeightBehavior: TextHeightBehavior(
                  applyHeightToFirstAscent: true,
                ),
                text: _items[i]['subtitle'][index].toString(),
                tags: {
                  'list': StyledTextWidgetTag(Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      Icons.square,
                      size: 8,
                    ),
                  )),
                  'link': StyledTextActionTag(
                    (_, attrs) => _openLink(context, attrs),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(0, 0, 238, 1),
                      color: Color.fromRGBO(0, 0, 238, 1),
                      // fontSize: 18,
                    ),
                  ),
                  'b': StyledTextTag(
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  'i': StyledTextTag(
                      style: const TextStyle(fontStyle: FontStyle.italic)),
                  'c': StyledTextTag(style: const TextStyle(color: Colors.red)),
                },
                // style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        );
      },
    );
  }
}
