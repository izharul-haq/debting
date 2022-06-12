import 'package:debting/widgets/views/home/home_appbar.dart';
import 'package:debting/widgets/views/home/home_dashboard.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomeDashboard(),
    );
  }
}
