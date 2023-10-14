import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/base/base.state.dart';

class MainTextField extends BaseStateless {
  final TextEditingController _controller;
  final String title;
  final String hint;
  const MainTextField(this._controller, this.title, this.hint, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: themeData(context).textTheme.displaySmall),
        SizedBox(
          height: dynamicHeight(context, 13),
        ),
        SizedBox(
          width: width(context) - dynamicWidth(context, 40),
          child: Center(
            child: TextField(
              style: themeData(context).textTheme.displaySmall,
              controller: _controller,
              decoration: InputDecoration(
                  hintText: hint,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: Color(0xffA3AED0)))),
            ),
          ),
        )
      ],
    );
  }
}