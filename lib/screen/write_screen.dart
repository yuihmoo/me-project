import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:me/main.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyEditingController = TextEditingController(text: 'key');
    final valueEditingController = TextEditingController(text: 'value');

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            textAlign: TextAlign.center,
            controller: keyEditingController,
            cursorColor: Theme.of(context).cardColor,
            maxLength: 20,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              prefixIcon: Icon(Icons.vpn_key_outlined),
              labelStyle: TextStyle(
                color: Colors.teal,
              ),
              helperText: '글자 제한',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            controller: valueEditingController,
            cursorColor: Theme.of(context).cardColor,
            maxLength: 50,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 50, 10, 10),
              prefixIcon : Icon(Icons.work),
              labelStyle: TextStyle(
                color: Colors.teal,
              ),
              helperText: '글자 제한',
              suffixIcon: Icon(
                Icons.check_circle,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.teal,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        backgroundColor: Colors.teal,
        onPressed: () {
          CollectionReference account = FirebaseFirestore.instance.collection('yuihmoo');
          account.add({
            'key' : keyEditingController.text,
            'value' : valueEditingController.text
          });
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MainPage()),
          );
        },
      ),
    );
  }
}
