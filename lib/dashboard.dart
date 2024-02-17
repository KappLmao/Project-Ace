import 'package:flutter/material.dart';
import 'package:flutter110/MasterFile.dart';
import 'package:flutter110/widget_creator.dart';
import 'package:flutter110/Profile.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                      height: 250,
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
                                          primary: Color.fromARGB(255, 113, 205,
                                              133), // Button color
                                        ),
                                        child: Text(
                                          "Add",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // Adjust the radius as needed
                                          ),
                                          primary: Color.fromARGB(255, 113, 205,
                                              133), // Button color
                                        ),
                                        child: Text(
                                          "View List",
                                          style: TextStyle(color: Colors.black),
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
    );
  }
}
