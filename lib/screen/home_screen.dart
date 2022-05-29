import 'package:debting/widget/screen/home/dashboard.dart';
import 'package:debting/widget/screen/home/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Dashboard(),
    );
  }
}
