import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/constants/app_constant.dart';
import 'package:voxvil_mobile/core/memory/hive_boxes.dart';
import 'package:voxvil_mobile/core/memory/hive_manager.dart';
import 'package:voxvil_mobile/core/widgets/main_text_filed.dart';
import 'package:voxvil_mobile/core/widgets/purple_button.dart';
import 'package:voxvil_mobile/pages/home_page.dart';

import '../core/base/base.state.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends BaseState<LandingPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: themeData.colorScheme.background),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/vox_logo.png'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: dynamicHeight(50)),
              child: Text('LOGIN', style: themeData.textTheme.titleMedium),
            ),
            MainTextField(_controller, 'Public Key', '0000000'),
            SizedBox(
              height: dynamicHeight(50),
            ),
            InkWell(
              onTap: () async {
                await HiveManager.instance
                    .addMapToBox(HiveBoxes.USER, publicKey, _controller.text);
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: PurpleButton(dynamicHeight(54), width - dynamicWidth(40),
                  text: 'LOG IN'),
            ),
          ],
        ),
      ),
    ));
  }
}
