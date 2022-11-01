import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts(
      {Key? key, required this.id, required this.title, required this.body})
      : super(key: key);

  final int? id;

  final String? title;

  final String? body;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: Colors.grey,
      child: ListTile(
        leading: Text('$id'),
        title: Text('$title'),
        subtitle: Text('$body'),
      ),
    );
  }
}
