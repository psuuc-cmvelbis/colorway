import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: name(),
  ));
}

class name extends StatelessWidget {
  name({super.key});
  List<List<String>> colorPalettes = [
    ['FF5733', 'FFD700', '00CED1'],
    ['8A2BE2', 'FF4500', '228B22', '1E90FF'],
    ['FF69B4', '4B0082', 'ADFF2F'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ColorWay'),
      ),
      body: GridView.builder(
        itemCount: colorPalettes.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: ((context, index) => Container(
          width: 100,
          height: 100,
              color: Color(int.parse('0xFF${colorPalettes[index][0]}')),
        )),),
            
      
    );
  }
}
