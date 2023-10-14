import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';

class PurpleButton extends BaseStateless {
  final String text;
  final double widgetHeight;
  final double widgetWidth;
  const PurpleButton(this.widgetHeight, this.widgetWidth,
      {super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widgetHeight,
        width: widgetWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: themeData(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              'LOG IN',
              style: themeData(context).textTheme.titleSmall,
            ),
          ),
        ));
  }
}