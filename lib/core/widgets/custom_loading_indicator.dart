import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../utils/common/colors.dart';

class CustomLoadingIndicar extends StatelessWidget {
  const CustomLoadingIndicar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.dotsTriangle(
            color: ColorManager.wightOp5, size: 50));
  }
}
