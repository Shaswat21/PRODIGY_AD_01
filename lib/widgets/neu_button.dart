import 'package:flutter/material.dart';

class NeuButton extends StatefulWidget {
  final String text;
  final double radius;
  final double? width;
  final double? height;
  final bool isDigit;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const NeuButton({
    super.key,
    required this.text,
    this.radius = 50,
    this.isDigit = false,
    this.width,
    this.height,
    this.onTap,
    this.onLongPress,
  });

  @override
  State<NeuButton> createState() => _NeuButtonState();
}

class _NeuButtonState extends State<NeuButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onLongPress: widget.onLongPress,
      child: Listener(
        onPointerDown: (event) {
          setState(() {
            _isPressed = true;
          });
        },
        onPointerUp: (event) {
          setState(() {
            _isPressed = false;
          });
        },
        child: Container(
          width: widget.width ?? MediaQuery.sizeOf(context).width/4-20,
          height: widget.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: _isPressed
                  ? [
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: const Offset(4, 4),
                          blurRadius: 2,
                          spreadRadius: 4),
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          offset: const Offset(-1, -1),
                          blurRadius: 2,
                          spreadRadius: 4),
                    ]
                  : [
                      BoxShadow(
                          color: Theme.of(context).shadowColor,
                          offset: const Offset(4, 4),
                          blurRadius: 2),
                      BoxShadow(
                          color: Theme.of(context).primaryColor,
                          offset: const Offset(-4, -4),
                          blurRadius: 2),
                    ]),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
                child: Text(
              widget.text,
              style: widget.isDigit ? Theme.of(context).textTheme.labelMedium : Theme.of(context).textTheme.titleMedium,
            )),
          ),
        ),
      ),
    );
  }
}
