import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:odometer/odometer.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.size,
    required this.label,
    required this.count,
    this.color,
    this.textColor,
    this.shape = BoxShape.rectangle,
  });

  final double size;
  final int count;
  final String label;
  final Color? color;
  final Color? textColor;
  final BoxShape shape;

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _value = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(10.ms, () => setState(() => _value = widget.count));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size,
      width: widget.size,
      decoration: BoxDecoration(
        color: widget.color,
        shape: widget.shape,
        borderRadius: widget.shape == BoxShape.rectangle
            ? BorderRadius.circular(8)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.label,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: widget.textColor),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedSlideOdometerNumber(
                  odometerNumber: OdometerNumber(_value),
                  duration: 2.seconds,
                  letterWidth: 22,
                  numberTextStyle: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(
                          color: widget.textColor, fontWeight: FontWeight.bold),
                  curve: Curves.easeOutCubic,
                  groupSeparator: const SizedBox(),
                ),
                Text(
                  'offers',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: widget.textColor),
                ),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
