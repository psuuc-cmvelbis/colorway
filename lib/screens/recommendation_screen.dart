import 'package:flutter/material.dart';

class RecommendationScreen extends StatefulWidget {
  final List<Map<String, dynamic>> selectedColorPalettes;

  RecommendationScreen(this.selectedColorPalettes);
  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  List<Map<String, dynamic>> colorPalettes = [
    {
      'colors': ['fe5f55', 'f0d5c9', '3e4095', '9b5de5', '48cae4'],
      'description': 'Contrasting warm and cool tones for a bold appearance.',
    },
    {
      'colors': ['264653', '2a9d8f', 'e9c46a', 'f4a261', 'e76f51'],
      'description': 'Earthy and muted colors for a grounded atmosphere.',
    },
    {
      'colors': ['003049', 'd62828', 'f77f00', 'fcbf49', 'eae2b7'],
      'description': 'Warm and fiery palette for a bold and energetic vibe.',
    },
    {
      'colors': ['2d4059', '40916c', 'ffd460', 'ff9b55', 'e84a5f'],
      'description': 'Bold and contrasting colors for a modern look.',
    },
    {
      'colors': ['0081a7', '00afb9', 'fdfcdc', 'fed9b7', 'f07167'],
      'description': 'Cool and refreshing colors for a calming effect.',
    },
    {
      'colors': ['303960', '3a4a63', 'a5aad9', 'b1cc74', 'fec5bb'],
      'description': 'Harmonious blend of cool and warm tones.',
    },
    {
      'colors': ['a3de83', 'eff9c0', 'ffd3b6', 'ffaaa5', 'ff8b94'],
      'description': 'Pastel hues for a soft and elegant atmosphere.',
    },
    {
      'colors': ['6a0572', 'ab83a1', 'c3aed6', 'd9d2e9', 'e3ebf6'],
      'description': 'Mystical and dreamy shades for a magical feel.',
    },
    {
      'colors': ['f5af19', 'f9dc5c', 'fbe28a', 'f5b2c0', 'f19cbb'],
      'description': 'Warm and sunny colors for a cheerful ambiance.',
    },
    {
      'colors': ['2f4858', '33658a', '86bbd8', '96ceb4', 'dcedc1'],
      'description': 'Tranquil ocean-inspired palette for a serene look.',
    },
    {
      'colors': ['f26a8d', 'f4c2c2', 'ffe6e3', 'd6d1cd', 'b4a0e5'],
      'description': 'Soft and feminine colors for an elegant touch.',
    },
  ];
  List<Map<String, dynamic>> selectedColorPalettes = [];

  void _addToLibrary(Map<String, dynamic> selectedPalette) {
    setState(() {
      widget.selectedColorPalettes.add(selectedPalette);

    });
  }

  void _showColorPaletteDetails(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            ColorPaletteDetailsScreen(colorPalettes[index], _addToLibrary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: colorPalettes.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _showColorPaletteDetails(index),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Column(
                  children: (colorPalettes[index]['colors'] as List<String>)
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
      ),
    );
  }
}

class ColorPaletteDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> selectedPalette;
  final Function(Map<String, dynamic>) addToLibrary;

  ColorPaletteDetailsScreen(this.selectedPalette, this.addToLibrary);

  @override
  Widget build(BuildContext context) {
    List<String> colorPalette = selectedPalette['colors'];
    String description = selectedPalette['description'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Color Palette Details'),
      ),
      body: Column(
        children: [
          Container(
            height: 210.0,
            width: 250,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Column(
                    children: colorPalette
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
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: colorPalette.length,
              itemBuilder: (context, index) => ListTile(
                title: Container(
                  color: Color(int.parse('0xFF${colorPalette[index]}')),
                  height: 50.0,
                ),
                subtitle: Text('#${colorPalette[index]}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              description,
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              addToLibrary(selectedPalette);
              print('added');
            },
            child: Text('Add to Library'),

          ),
        ],
      ),
    );
  }
}
