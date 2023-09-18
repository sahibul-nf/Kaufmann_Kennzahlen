import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/drawer.dart';
import '../widgets/list_terms.dart';
import '../widgets/search_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  List _items = [];

  void onSearching(String value) {
    // Handle search if the value is empty
    if (value.isEmpty) {
      // Reset the list of terms
      fetchData();
      return;
    }

    // Filter the list of terms
    List filteredTerms = _items.where((item) {
      return item["title"].toLowerCase().contains(value.toLowerCase());
    }).toList();

    // Update the list of terms
    setState(() {
      _items = filteredTerms;
    });
  }

  Future<void> fetchData() async {
    // File path
    String path = "assets/data/glossary.json";

    // Fetch content from the json file
    final String response = await rootBundle.loadString(path);

    // Decode json
    final data = await jsonDecode(response);

    // Extract data from json and store in a List
    setState(() {
      _items = data["items"];
    });
  }

  @override
  void initState() {
    fetchData();

    super.initState();
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
          // Search Form
          SearchForm(
            controller: _controller,
            focusNode: _focusNode,
            onChanged: onSearching,
            onClose: () {
              // Reset the list of terms
              fetchData();
              // Unfocus the TextField
              _focusNode.unfocus();
              // Clear the TextField
              _controller.clear();
            },
          ),
          // List of Terms
          ListOfTerms(items: _items)
        ],
      ),
    );
  }
}
