import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/reception/presentation/screens/reception_home_screen.dart';

void main() {
  runApp(const VetCareApp());
}

class VetCareApp extends StatelessWidget {
  const VetCareApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCare INNIS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppTheme.primaryBlue,
        scaffoldBackgroundColor: const Color(0xFFF4F6F9),
        colorScheme: ColorScheme.fromSeed(seedColor: AppTheme.primaryBlue),
      ),
      home: const ReceptionHomeScreen(),
    );
  }
}