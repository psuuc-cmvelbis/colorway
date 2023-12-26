import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> selectedColorPalettes;

  LibraryScreen(this.selectedColorPalettes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library'),
      ),
      body: GridView.builder(
        itemCount: selectedColorPalettes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Column(
                children: (selectedColorPalettes[index]['colors'] as List<String>)
                    .map(
                      (color) => Expanded(
                        child: Container(
                          color: Color(int.parse('0xFF$color')),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
