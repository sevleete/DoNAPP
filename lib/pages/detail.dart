import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  const ListDetail({super.key, required this.title});
  final String title;

  @override
  // ignore: library_private_types_in_public_api
  _ListDetailState createState() {
    return _ListDetailState();
  }
}
class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return Text('detail --- ${widget.title}');
  }
  
}