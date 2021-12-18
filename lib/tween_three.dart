import 'package:flutter/material.dart';

class TweenThree extends StatefulWidget {
  const TweenThree({Key? key}) : super(key: key);

  @override
  _TweenThreeState createState() => _TweenThreeState();
}

class _TweenThreeState extends State<TweenThree>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnim, _sizeAnim;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _colorAnim =
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

    _sizeAnim = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 100.0, end: 200.0), weight: 33),
      TweenSequenceItem(tween: Tween(begin: 200.0, end: 150.0), weight: 33),
      TweenSequenceItem(tween: Tween(begin: 150.0, end: 300.0), weight: 33),
    ]).animate(_controller);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (ctx, _) {
          return IconButton(
            onPressed: () {
              if (_controller.isCompleted)
                _controller.reverse();
              else
                _controller.forward();
            },
            icon: Icon(Icons.favorite),
            iconSize: _sizeAnim.value,
            color: _colorAnim.value,
          );
        },
      ),
    );
  }
}
