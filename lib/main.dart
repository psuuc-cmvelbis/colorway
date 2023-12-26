import 'dart:io';

import 'package:colorway/screens/create_screen.dart';
import 'package:colorway/screens/library_screen.dart';
import 'package:colorway/screens/recommendation_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(useMaterial3: true),
    home: Name(),
  ));
}

class Name extends StatelessWidget {
List<Map<String, dynamic>> selectedColorPalettes = [];

// ... (other code)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorWay'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.green],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ColorWay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Recommendation'),
              onTap: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => RecommendationScreen(selectedColorPalettes),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Create'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreateScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Library'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LibraryScreen(selectedColorPalettes),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Exit'),
              onTap: () {
                exit(0);
              },
            ),
          ],
        ),
      ),
      body: RecommendationScreen(selectedColorPalettes),
    );
  }
}
