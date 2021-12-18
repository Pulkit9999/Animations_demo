import 'package:animations_demo/curve_tween_demo.dart';
import 'package:animations_demo/staggered_demo.dart';
import 'package:animations_demo/tween_three.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            backgroundColor: Colors.black,
            body: ListView(
              children: [
                CurveTweenDemo(),
                StaggeredDemo(),
                TweenThree()
                // TweenOne(),
                // TweenTwo(),
                // MixinDemo1(),
                // MixinDemo2(),
                // MixinDemo3()
              ],
            )
            // FirstAnimCtrlDemo(),
            )
        //const CrossFadeDemo()
        // const BasicAnimations()
        // TweenAD(),

        //const AnimatedContainerDemo()
        // const WithoutAnimation()
        );
  }
}
