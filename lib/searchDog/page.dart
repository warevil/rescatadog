import 'package:flutter/material.dart';
import '../db/dataDog.dart';
import './widgets/searDog_item.dart';
import './widgets/searchDogDelegate.dart';

class SearchDog extends StatefulWidget {
  const SearchDog({Key? key}) : super(key: key);

  @override
  _SearchDog createState() => _SearchDog();
}

class _SearchDog extends State<SearchDog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            onTap: () {
              showSearch(context: context, delegate: SearchDogDelegate());
            },
            title: const Text(
              'Search',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: dogs.length,
          itemBuilder: (BuildContext context, int index) {
            return SearchDogItem(dogs[index]);
          },
        ));
  }
}
