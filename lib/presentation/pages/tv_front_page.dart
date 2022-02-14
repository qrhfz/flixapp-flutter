import 'package:flutter/material.dart';

class TvFrontPage extends StatelessWidget {
  const TvFrontPage({Key? key}) : super(key: key);

  static const ROUTE_NAME = '/tv';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TV SERIES'),
      ),
      body: Container(),
    );
  }
}
