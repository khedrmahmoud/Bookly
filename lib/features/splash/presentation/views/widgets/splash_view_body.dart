import 'dart:async';

import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool _a = false;
  // bool _b = false;
  // bool _c = false;
  bool _d = false;
  bool _e = false;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _a = true;
      });
    });
    /*    Timer(const Duration(milliseconds: 400), () {
      setState(() {
        _b = true;
      });
    });
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _c = true;
      });
    }); */
    Timer(const Duration(milliseconds: 1700), () {
      setState(() {
        _e = true;
      });
    });
    Timer(const Duration(milliseconds: 3400), () {
      setState(() {
        _d = true;
      });
    });
    Timer(const Duration(milliseconds: 3850), () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    double _w = MediaQuery.of(context).size.width;
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
                ? _h / 2 - 80
                : _a
                    ? _h / 2 - 80
                    : 20,
          ),
          AnimatedContainer(
            duration: Duration(seconds: _d ? 1 : 0),
            curve: Curves.fastLinearToSlowEaseIn,
            height: _d ? 80 : 0,
            width: _d ? _w : 0,
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
}
