import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

class ListOfTerms extends StatelessWidget {
  const ListOfTerms({Key? key, required this.items}) : super(key: key);

  final List<dynamic> items;

  Widget buildTermSubtitle(int i) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: items[i]['subtitle'].length,
      itemBuilder: (context, index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 6.0),
              child: Icon(
                Icons.square,
                size: 8,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: StyledText(
                textHeightBehavior: const TextHeightBehavior(
                  applyHeightToFirstAscent: true,
                ),
                text: items[i]['subtitle'][index].toString(),
                tags: {
                  'link': StyledTextActionTag(
                    (_, attrs) {
                      final String link = attrs['href']!;
                      launchUrl(Uri.parse(link));
                    },
                    style: const TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Color.fromRGBO(0, 0, 238, 1),
                      color: Color.fromRGBO(0, 0, 238, 1),
                      // fontSize: 18,
                    ),
                  ),
                  'b': StyledTextTag(
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  'i': StyledTextTag(
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                  'c': StyledTextTag(
                    style: const TextStyle(color: Colors.red),
                  ),
                },
                // style: const TextStyle(fontSize: 16.0),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Flexible(
        child: Center(
          child: Text("No Items Found"),
        ),
      );
    }

    return Flexible(
      child: ListView.builder(
        itemCount: items.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: ListTile(
                leading: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Text(items[index]['abbreviation']),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    items[index]['title'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                subtitle: buildTermSubtitle(index),
              ),
            ),
          );
        },
      ),
    );
  }
}
