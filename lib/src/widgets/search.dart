import 'package:bingo/src/widgets/view_tile.dart';
import 'package:bingo/utils/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  Map<String, dynamic> userData = {};

  Map<String, dynamic> recentSearch = {};

  CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(
            Icons.clear,
            size: 18,
          ))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 18,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return Column(
        children: [
          FutureBuilder<QuerySnapshot>(
              future: ref.where("name", isEqualTo: query).get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index].data()
                            as Map<String, dynamic>;
                        recentSearch = data;
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: viewTile(data));
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: ThemeColor.PrimaryColor,
                    ),
                  );
                }
              }),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return viewTile(recentSearch);
        });
  }
}
