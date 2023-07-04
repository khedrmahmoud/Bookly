import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CustomLoadingIndicar extends StatelessWidget {
  const CustomLoadingIndicar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.dotsTriangle(
            color: Colors.white.withOpacity(0.5), size: 50));
  }
}
