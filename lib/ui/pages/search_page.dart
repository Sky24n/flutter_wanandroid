import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/common/component_index.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('搜索')),
      body: ProgressView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () {},
      ),
    );
  }
}
