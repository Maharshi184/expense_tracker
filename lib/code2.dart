import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp1());
}

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ListView with Separator')),
        body: const ListViewWithSeparator(),
      ),
    );
  }
}

class ListViewWithSeparator extends StatelessWidget {
  const ListViewWithSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 6,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey, // Separator color
        thickness: 1, // Separator thickness
      ),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.person),
          title: Text('Item ${index + 1}'),
          subtitle: Text('Subtitle for item ${index + 1}'),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Handle tap here
          },
        );
      },
    );
  }
}
