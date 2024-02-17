import 'package:flutter/material.dart';
import 'package:flutter110/widget_creator.dart';

class MasterFile extends StatefulWidget {
  const MasterFile({ Key? key }) : super(key: key);

  @override
  _MasterFileState createState() => _MasterFileState();
}

class _MasterFileState extends State<MasterFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      drawer: createDrawer(context),
      body: Center(
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            padding: EdgeInsets.all(320),
            child: Text(
              'Welcome back, admin',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
