import 'package:flutter/widgets.dart';

/// Animates the rotation of a widget when [turns] value is changed.

class AnimatedRotationBox extends StatefulWidget {
  const AnimatedRotationBox({
    Key key,
    this.turns = .0,
    this.speed = 200,
    this.child
  }) :super(key: key);

  /// Controls the rotation of the child.
  ///
  /// If the current value of the turns is v, the child will be
  /// rotated v * 2 * pi radians before being painted.
  final double turns;

  /// Animation duration in milliseconds
  final int speed;

  final Widget child;

  @override
  _AnimatedRotationBoxState createState() => new _AnimatedRotationBoxState();
}

class _AnimatedRotationBoxState extends State<AnimatedRotationBox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = new AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.speed ?? 200)
    );
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(AnimatedRotationBox oldWidget) {
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(widget.turns);
    }
  }
}