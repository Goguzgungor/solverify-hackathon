import 'package:flutter/material.dart';
import 'package:voxvil_mobile/core/memory/hive_manager.dart';
import 'package:voxvil_mobile/core/theme/vox_theme.dart';
import 'package:voxvil_mobile/pages/home_page.dart';
import 'package:voxvil_mobile/pages/landing_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveManager.instance.hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: VoxTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const LandingPage());
  }
}
