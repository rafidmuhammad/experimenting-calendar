import 'dart:io';

import 'package:calendar_app/pages/calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/models/day_values_model.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';
import 'package:scrollable_clean_calendar/widgets/month_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Scrollable Clean Calendar',
        theme: ThemeData(
          colorScheme: const ColorScheme(
            primary: Color(0xFF4B4633),
            secondary: Color(0xFFD32F2F),
            secondaryContainer: Color(0xFF9A0007),
            surface: Color(0xFFDEE2E6),
            background: Color(0xFFF6F2EF),
            error: Color(0xFF96031A),
            onPrimary: Colors.white,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onBackground: Colors.black,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        home: CalendarPage());
  }
}
