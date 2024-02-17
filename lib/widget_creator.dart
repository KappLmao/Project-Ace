import 'package:flutter/material.dart';
import 'package:flutter110/MasterFile.dart';
import 'package:flutter110/Profile.dart';


Widget createDrawer(BuildContext context) {
  return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Dashboard Menu',
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('List of Files'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Add Alumni Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Notification'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('messages'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,MaterialPageRoute(
                    builder: (context) {
                      return Profile();
                    },
                  ),
                );
                print("MasterFile");
              },
            ),
            ListTile(
              title: Text('Master Files'),
              onTap: () {
                Navigator.push(
                  context,MaterialPageRoute(
                    builder: (context) {
                      return MasterFile();
                    },
                  ),
                );
                print("MasterFile");
              },
            ),
            ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Logout'),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}