import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'survey_screen.dart';

void main() {
  runApp(const CultureAnalysisApp());
}

class CultureAnalysisApp extends StatelessWidget {
  const CultureAnalysisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Analisis Budaya & Inovasi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(),
        '/survey': (context) => const SurveyScreen(),
      },
    );
  }
}
