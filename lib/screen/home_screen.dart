import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:me/screen/write_screen.dart';

import '../model/Account.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  late Stream<QuerySnapshot> streamData;

  @override
  void initState() {
    super.initState();
    streamData = fireStore.collection('yuihmoo').snapshots();
  }

  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('yuihmoo').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const LinearProgressIndicator();
        return _buildBody(context, snapshot.data!.docs);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<Account> accounts =
        snapshot.map((p) => Account.fromSnapshot(p)).toList();

    return Scaffold(
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.save),
            title: Text(accounts[index].key),
            subtitle: Text(accounts[index].value),
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            trailing: FloatingActionButton(
              heroTag: ('del$index'),
              child: const Icon(Icons.delete),
              backgroundColor: Colors.black12,
              foregroundColor: Colors.white60,
              onPressed: () {
                accounts[index].reference.delete();
              },
            ),
            onTap: () async {
              final account = accounts[index];
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(account: account)),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WriteScreen()),
          );
        },
      ),
    );
  }
}
