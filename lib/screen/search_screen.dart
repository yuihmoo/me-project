import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  get textEditingController => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchHeader(),
      body: ListView(
        children: <Widget>[
          ListTile(
          )
        ],
      ),
    );
  }

  AppBar searchHeader() {
    return AppBar(
      leadingWidth: 20,
      leading: const Icon(Icons.search),
      title: TextFormField(
        controller: textEditingController,
        decoration: const InputDecoration(
          hintText: '검색',
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white60),
          ),
        ),
      ),
    );
  }
}