import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CurveTweenDemo extends StatefulWidget {
  const CurveTweenDemo({Key? key}) : super(key: key);

  @override
  _CurveTweenDemoState createState() => _CurveTweenDemoState();
}

class _CurveTweenDemoState extends State<CurveTweenDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnim, _sizeAnim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _colorAnim = ColorTween(begin: Colors.pinkAccent, end: Colors.purpleAccent)
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Interval(0.7, 1.0, curve: Curves.bounceIn)));

    _sizeAnim = Tween(begin: 100.0, end: 300.0)
        .chain(CurveTween(curve: Interval(0.0, 0.7, curve: Curves.bounceOut)))
        .animate(_controller);
    // TODO: implement initState
    //  _sizeAnim = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(
    //       parent: _controller,
    //       curve: Interval(0.0, 0.7, curve: Curves.bounceOut)));
    //   // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctxt, _) {
        return IconButton(
          onPressed: () {
            if (_controller.isCompleted)
              _controller.reverse();
            else
              _controller.forward();
          },
          icon: Icon(Icons.access_alarm),
          iconSize: _sizeAnim.value,
          color: _colorAnim.value,
        );
      },
    );
  }
}
