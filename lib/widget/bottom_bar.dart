import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: const SizedBox(
        height: 50,
        child: TabBar(
          labelColor: Colors.teal,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.teal,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.edit,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}