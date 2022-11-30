import 'package:flutter/material.dart';
import 'package:skeleton_prototype/Screens/model/panadol.dart';

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Panadol",
    "Profinal",
    "Concord",
    "Morphin",
    "Cocaine",
    "Heroine",
    "Augmontin",
    "Cataflam",
    "Acetaminophen",
    "Adderall",
    "Amitriptyline",
    "Amlodipine",
    "Amoxicillin",
    "Ativan",
    "Atorvastatin",
    "Azithromycin"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var meds in searchTerms) {
      if (meds.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(meds);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: (){},
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var meds in searchTerms) {
      if (meds.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(meds);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Panadol()));
          },
        );
      },
    );
  }
}