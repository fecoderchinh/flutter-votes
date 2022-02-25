import 'package:flutter/material.dart';
import 'package:votes/partials/drawer.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  Widget _buildPage({String? index, Color? color}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        index!,
        style: const TextStyle(
          fontSize: 100.0,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildPageView(){
    return PageView(
      children: [
        _buildPage(index: 'Welcome!', color: Colors.green),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trang chủ', style: TextStyle(color: Colors.white)),
      ),
      body: _buildPageView(),
      drawer: const MyDrawer(),
    );
  }
}