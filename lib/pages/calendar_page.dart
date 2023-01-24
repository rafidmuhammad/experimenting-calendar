import 'dart:io';

import 'package:calendar_app/pages/nextpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  bool isShow = false;
  TextStyle styleFont = GoogleFonts.poppins();
  Map<int, String> weekdayName = {
    1: "Senin",
    2: "Selasa",
    3: "Rabu",
    4: "Kamis",
    5: "Jumat",
    6: "Sabtu",
    7: "Minggu"
  };

  Map<int, String> monthName = {2: "Februari", 3: "Maret", 4: "April"};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CleanCalendarController calendarController = CleanCalendarController(
      minDate: DateTime(2023, 2, 1),
      maxDate: DateTime(2023, 4, 30),

      // onRangeSelected: (firstDate, secondDate) {},
      onDayTapped: (date) {
        showDialog(
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
                          style:
                              styleFont.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(": "),
                      Expanded(flex: 2, child: Text(weekdayName[date.weekday]!))
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
                          style:
                              styleFont.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(": "),
                      Expanded(
                          flex: 2,
                          child: Text(
                              "${date.day} ${monthName[date.month]} ${date.year}"))
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
                          style:
                              styleFont.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(": "),
                      const Expanded(flex: 2, child: Text("15.00 WIB"))
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
                          style:
                              styleFont.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Text(": "),
                      const Expanded(flex: 2, child: Text("Dr.X, Sp.KJ"))
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
                          style:
                              styleFont.copyWith(fontWeight: FontWeight.w600),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            );
          },
        );
      },
      readOnly: false, rangeMode: false,
      // onPreviousMinDateTapped: (date) {},
      // onAfterMaxDateTapped: (date) {},
      weekdayStart: DateTime.monday,
      // initialFocusDate: DateTime(2023, 5),
      // initialDateSelected: DateTime(2022, 3, 15),
      // endDateSelected: DateTime(2022, 3, 20),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F2EF),
        elevation: 1,
        title: const Text('Jadwal Kontrol',
            style: TextStyle(color: Color(0xFF4B4633))),
      ),
      backgroundColor: const Color(0xFFF6F2EF),
      // floatingActionButton: FloatingActionButton(
      //   child: const Icon(Icons.arrow_downward),
      //   onPressed: () {
      //     calendarController.jumpToMonth(date: DateTime(2022, 8));
      //   },
      // ),
      body: ScrollableCleanCalendar(
        locale: 'id',
        calendarController: calendarController,
        layout: Layout.BEAUTY,
        dayBuilder: (context, values) {
          if (values.day == DateTime(2023, 3, 6)) {
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
          } else {
            return Center(
              child: Text(
                values.text,
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(fontWeight: FontWeight.w500)),
              ),
            );
          }
        },
        calendarCrossAxisSpacing: 0,
      ),
    );
  }
}
