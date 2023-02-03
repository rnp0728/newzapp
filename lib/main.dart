import 'package:flutter/material.dart';
import './pages/categoryscreen.dart';
import './utils/colors.dart';
void main() {
  runApp(const TechieNewz());
}

class TechieNewz extends StatefulWidget {
  const TechieNewz({Key? key}) : super(key: key);

  @override
  State<TechieNewz> createState() => _TechieNewzState();
}

class _TechieNewzState extends State<TechieNewz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, primaryColor:  AppColors.primary
      ),
      home: const CategoryScreen(),
    );
  }
}
