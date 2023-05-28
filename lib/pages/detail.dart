import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ListDetail extends StatefulWidget {
  const ListDetail({super.key, required this.title, required this.imagePath});
  final String title;
  final String imagePath;

  @override
  // ignore: library_private_types_in_public_api
  _ListDetailState createState() {
    return _ListDetailState();
  }
}
class _ListDetailState extends State<ListDetail> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
              labelStyle: TextStyle(height: 0,fontSize: 16),
              tabs: [
                Tab(text: "详情"),
                Tab(text: "报废与回收"),
              ]),
        ),
        body: const TabBarView(
            children: [
              Center(child: Text('汽车')),
              Center(child: Text('自行车'))
            ]),
      ),
    );

  }
  
}