import 'package:flutter/material.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 4, // Number of columns in the grid
            children: <Widget>[
              buildGridItem(Colors.orangeAccent, '1'),
              buildGridItem(Colors.yellow, '2'),
              buildGridItem(Colors.lightGreenAccent, '3'),
              buildGridItem(Colors.deepOrange, '4'),
              buildGridItem(Colors.limeAccent, '5'),
              buildGridItem(Colors.cyan, '6'),
              buildGridItem(Colors.redAccent, '7', flex: 4), // Larger block
              buildGridItem(Colors.orange, '8'),
              buildGridItem(Colors.purple, '9'),
              buildGridItem(Colors.pinkAccent, '10'),
              buildGridItem(Colors.red, '11'),
              buildGridItem(Colors.cyanAccent, '12'),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(Color color, String label, {int flex = 1}) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      height: flex * 50.0, // Adjust the height multiplier for larger items
    );
  }
}
