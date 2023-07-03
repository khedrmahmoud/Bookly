import 'package:flutter/material.dart';

import 'widgets/serach_view_body.dart';

class SerachView extends StatelessWidget {
  const SerachView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
