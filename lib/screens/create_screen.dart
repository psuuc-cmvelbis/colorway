// create_screen.dart
import 'package:flutter/material.dart';

class CreateScreen extends StatefulWidget {
  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  List<List<String>> userColorPalettes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Color Palette'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Color Palettes:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: userColorPalettes.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('Palette ${index + 1}'),
                  subtitle: Row(
                    children: userColorPalettes[index]
                        .map((color) => Container(
                              width: 20,
                              height: 20,
                              margin: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Color(int.parse('0xFF$color')),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showColorPickerDialog();
              },
              child: Text('Create New Palette'),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorPickerDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<String> newPalette = List.filled(3, '000000'); // Initialize with 3 empty colors

        return AlertDialog(
          title: Text('Create New Color Palette'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < newPalette.length; i++)
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Color ${i + 1}',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.text,
                              onChanged: (value) {
                                setState(() {
                                  newPalette[i] = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (_isValidPalette(newPalette)) {
                  setState(() {
                    userColorPalettes.add(newPalette);
                  });
                  Navigator.pop(context);
                } else {
                  // Show an error message or handle invalid palette
                }
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }

  bool _isValidPalette(List<String> palette) {
    // Check if the palette has at least 3 colors and at most 5 colors
    return palette.length >= 3 && palette.length <= 5;
  }
}
