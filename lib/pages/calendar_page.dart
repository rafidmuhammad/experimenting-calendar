import 'dart:io';
import 'package:calendar_app/models/schedule_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isShow = false;
  TextStyle styleFont = GoogleFonts.poppins();
  List<Schedule> jadwal = [
    Schedule(date: DateTime(2023, 2, 1, 15, 45), doctor: "Dr. Dre"),
    Schedule(date: DateTime(2023, 3, 3, 14, 0), doctor: "Dr. Dre")
  ];

  @override
  Widget build(BuildContext context) {
    CleanCalendarController calendarController = CleanCalendarController(
      minDate: DateTime(2023, 2, 1),
      maxDate: DateTime(2023, 4, 30),
      onDayTapped: (date) {
        for (var e in jadwal) {
          DateFormat.MMMMd('id').format(e.date) ==
                  DateFormat.MMMMd('id').format(date)
              ? dialog(e)
              : null;
        }
      },
      rangeMode: false,
      weekdayStart: DateTime.monday,
    );

    return Scaffold(
      appBar: AppBar(
        titleTextStyle:
            styleFont.copyWith(fontWeight: FontWeight.w600, fontSize: 18),
        backgroundColor: const Color(0xFFF6F2EF),
        elevation: 1,
        title: const Text('Jadwal Kontrol',
            style: TextStyle(color: Color(0xFF4B4633))),
      ),
      backgroundColor: const Color(0xFFF6F2EF),
      body: ScrollableCleanCalendar(
        locale: 'id',
        calendarController: calendarController,
        layout: Layout.BEAUTY,
        dayBuilder: (context, values) {
          for (var element in jadwal) {
            if (DateFormat.MMMMd('id').format(element.date) ==
                DateFormat.MMMMd('id').format(values.day)) {
              return Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(values.text,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onPrimary))),
                ),
              );
            }
          }
          return Center(
            child: Text(
              values.text,
              style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontWeight: FontWeight.w500)),
            ),
          );
        },
        calendarCrossAxisSpacing: 0,
      ),
    );
  }

  Future<void> dialog(Schedule jadwal) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Hari",
                      style: styleFont.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(": "),
                  Expanded(
                      flex: 2,
                      child: Text(DateFormat.EEEE('id').format(jadwal.date)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Tanggal",
                      style: styleFont.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(": "),
                  Expanded(
                      flex: 2,
                      child: Text(DateFormat.yMMMMd('id').format(jadwal.date)))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Pukul",
                      style: styleFont.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(": "),
                  Expanded(
                      flex: 2,
                      child: Text("${DateFormat.Hm().format(jadwal.date)} WIB"))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Dokter",
                      style: styleFont.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(": "),
                  Expanded(flex: 2, child: Text(jadwal.doctor))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                      "Poli",
                      style: styleFont.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(": "),
                  const Expanded(flex: 2, child: Text("Jiwa"))
                ],
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "OK",
                style: styleFont.copyWith(fontWeight: FontWeight.w600),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
          title: Text(
            textAlign: TextAlign.center,
            "Jadwal Kunjungan Dokter",
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            )),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        );
      },
    );
  }
}
