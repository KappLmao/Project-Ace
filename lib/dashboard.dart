import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter110/MasterFile.dart';
import 'package:flutter110/widget_creator.dart';
import 'package:flutter110/Profile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List _coursesList = [];
  List _coursesMajorList = [];
  String _selectedItem = 'Artificial Intelligence';

  Future<List> viewCoursesList() async {
    var uri = Uri.parse("http://localhost/ace/users.php");
    Map<String, dynamic> requestBody = {
      "operation": "viewCoursesList",
    };
    var response = await http.post(
      uri,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      return response.body != "0" ? jsonDecode(response.body) : [];
    }
    return [];
  }

  Future<List> getCoursesMajorList(index) async {
    var uri = Uri.parse("http://localhost/ace/users.php");
    Map<String, dynamic> json = {
      "courseId": index,
    };
    Map<String, dynamic> requestBody = {
      "operation": "getCoursesMajorList",
      "json": jsonEncode(json),
    };
    var response = await http.post(
      uri,
      body: requestBody,
    );

    if (response.statusCode == 200) {
      print("getCoursesMajorList response: ${response.body}");
      List majorList = jsonDecode(response.body);
      setState(() {
        _coursesMajorList = majorList;
      });
      print("Courses Major List: $_coursesMajorList");
    } else {
      print(
          "Failed to fetch courses major list. Status code: ${response.statusCode}");
    }
    return [];
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    List courseListFiles = await viewCoursesList();
    if (mounted) {
      _coursesList = courseListFiles;
    }
  }

  void handleGetMajorList(index) async {
    List majorList = await getCoursesMajorList(index);
    setState(() {
      _coursesMajorList = majorList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      drawer: createDrawer(context),
      body: Center(
        child: SizedBox(
          width: 1000,
          child: Card(
            elevation: 4,
            color: Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 120,
              ),
              child: Card(
                elevation: 4,
                color: Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 25,
                    right: 25,
                    bottom: 0,
                  ),
                  child: Card(
                    elevation: 4,
                    color: Color.fromARGB(255, 71, 116, 84),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Welcome back, admin',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 150,
                        ),
                        Container(
                          width: 200,
                          child: SizedBox(
                            height: 150,
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "Add Courses/Major",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: 80,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Adjust the radius as needed
                                              ),
                                              primary: Color.fromARGB(255, 113,
                                                  205, 133), // Button color
                                            ),
                                            child: Text(
                                              "Add",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.dialog(
                                                AlertDialog(
                                                  backgroundColor:
                                                      Colors.yellow,
                                                  content: SizedBox(
                                                    height: 500,
                                                    width: 500,
                                                    child: courseListWidget(),
                                                  ),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    10), // Adjust the radius as needed
                                              ),
                                              primary: Color.fromARGB(255, 113,
                                                  205, 133), // Button color
                                            ),
                                            child: Text(
                                              "View List",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget courseListWidget() {
    if (_coursesList.isEmpty) {
      return Center(
        child: Text("No Courses added yet"),
      );
    } else {
      return ListView.builder(
          itemCount: _coursesList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              color: Colors.grey[400],
              child: ListTile(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: Colors.yellow,
                      content: SizedBox(
                        height: 500,
                        width: 500,
                        child: FutureBuilder<List>(
                          future: getCoursesMajorList(
                              _coursesList[index]["course_id"]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text('Error: ${snapshot.error}'));
                            } else {
                              return courseListMajorWidget();
                            }
                          },
                        ),
                      ),
                    ),
                  );
                },
                title: Text(
                  _coursesList[index]["course_name"].toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          });
    }
  }

  Widget courseListMajorWidget() {
    if (_coursesMajorList.isEmpty) {
      return Center(
        child: Text("No Courses added yet"),
      );
    } else {
      return ListView.builder(
          itemCount: _coursesMajorList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              color: Colors.grey[400],
              child: ListTile(
                title: Text(
                  _coursesMajorList[index]["course_major_name"],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          });
    }
  }
}
