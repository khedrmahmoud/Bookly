import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _a = false;
  bool _d = false;
  bool _e = false;

  @override
  void initState() {
    initAnimationTimers();
    navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: _d ? 900 : 2500),
            curve: _d ? Curves.fastLinearToSlowEaseIn : Curves.elasticOut,
            height: _d
                ? height / 2 - 80
                : _a
                    ? height / 2 - 80
                    : 20,
          ),
          AnimatedContainer(
            duration: Duration(seconds: _d ? 1 : 0),
            curve: Curves.fastLinearToSlowEaseIn,
            height: _d ? 80 : 0,
            width: _d ? width : 0,
            child: Center(
              child: _e ? Image.asset(AssetsData.logo) : const SizedBox(),
            ),
          ),
          Text(
            "Read Free Books",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }

  void initAnimationTimers() {
    Future.delayed(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
  }

  void navigateToHome() {
    Future.delayed(const Duration(milliseconds: 4950), () {
      GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
    });
  }
}
