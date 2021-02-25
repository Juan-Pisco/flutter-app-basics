import 'package:flutter/material.dart';

class SlidingSwitch extends StatefulWidget {
  final double height;
  final ValueChanged<bool> onChanged;
  final double width;
  final bool value;
  final String textOff;
  final String textOn;
  final Duration animationDuration;
  final Color colorOn;
  final Color colorOff;
  final Color background;
  final Color buttonColor;
  final Color inactiveColor;
  final Function onTap;
  final Function onDoubleTap;
  final Function onSwipe;

  const SlidingSwitch({
    @required this.value,
    @required this.onChanged,
    this.height = 55,
    this.width = 250,
    this.animationDuration = const Duration(milliseconds: 400),
    this.onTap,
    this.onDoubleTap,
    this.onSwipe,
    this.textOff = "Off",
    this.textOn = "On",
    this.colorOn = const Color(0xffdc6c73),
    this.colorOff = const Color(0xff6682c0),
    this.background = const Color(0xffe4e5eb),
    this.buttonColor = const Color(0xfff7f5f7),
    this.inactiveColor = const Color(0xff636f7b),
  }) : super();
  @override
  _SlidingSwitch createState() => _SlidingSwitch();
}

class _SlidingSwitch extends State<SlidingSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> animation;
  double value = 0.0;

  bool turnState;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: widget.animationDuration);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);
    animationController.addListener(() {
      setState(() {
        value = animation.value;
      });
    });
    turnState = widget.value;
    _determine();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onDoubleTap: () {
          _action();
          if (widget.onDoubleTap != null) widget.onDoubleTap();
        },
        onTap: () {
          _action();
          if (widget.onTap != null) widget.onTap();
        },
        onPanEnd: (details) {
          _action();
          if (widget.onSwipe != null) widget.onSwipe();
        },
        child: Container(
          height: widget.height,
          width: widget.width,
          decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(50)),
          padding: EdgeInsets.all(2),
          child: Stack(children: <Widget>[
            Transform.translate(
                offset: Offset(((widget.width * 0.5) * value - (2 * value)), 0),
                child: Container(
                  height: widget.height,
                  width: widget.width * 0.5 - 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: widget.buttonColor,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20.0,
                        ),
                      ]),
                )),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      widget.textOff,
                      style: TextStyle(
                          color: turnState
                              ? widget.inactiveColor
                              : widget.colorOff,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      widget.textOn,
                      style: TextStyle(
                          color:
                              turnState ? widget.colorOn : widget.inactiveColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            )
          ]),
        ));
  }

  _action() {
    _determine(changeState: true);
  }

  _determine({bool changeState = false}) {
    setState(() {
      if (changeState) turnState = !turnState;
      (turnState)
          ? animationController.forward()
          : animationController.reverse();
      if (changeState) widget.onChanged(turnState);
    });
  }
}
