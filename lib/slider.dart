import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String pageNo;

  SliderPage({this.pageNo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      color: Colors.white,
      child: Center(
        child: Text(
          pageNo,
          style: TextStyle(
              color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
