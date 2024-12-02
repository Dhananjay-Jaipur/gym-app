import 'package:flutter/material.dart';
import 'package:gym/backend/backend.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class Workout extends StatelessWidget {
  const Workout({super.key});

  Widget TodayDay(obj, context) {
    if (obj.todayRutine.isEmpty) {
      return const CircularProgressIndicator();
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          for (int i = 0; i < 2; i++)
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: const BorderRadius.all(
                  Radius.circular(33),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Image.asset(obj.todayRutine[i][1]),
                      ),
                      Text(
                        "  ${obj.todayRutine[i][0]}",
                        style:
                            const TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Backend obj = Provider.of<Backend>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: TableCalendar(
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: obj.focusedDay,
          calendarFormat: CalendarFormat.week,
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerStyle: const HeaderStyle(
            titleTextStyle: TextStyle(color: Colors.white38, fontSize: 20),
            titleCentered: true,
            formatButtonVisible: false,
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: Colors.grey),
            weekendStyle: TextStyle(color: Colors.grey),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                color: Colors.transparent,
                shape: BoxShape.circle),
            selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                shape: BoxShape.circle),
            defaultTextStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            weekendTextStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          selectedDayPredicate: (day) => isSameDay(obj.selctedDay, day),
          onDaySelected: obj.updateDay,
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              bool isSpecialDate =
                  obj.datsUserCame.any((d) => isSameDay(d, day));

              // Return a custom widget for special dates
              if (isSpecialDate) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              } else {
                obj.setRotine(DateFormat('EEE').format(day));
              }

              return null;
            },
          ),
        ),
      ),
      persistentFooterButtons: [
        Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(33),
              topRight: Radius.circular(33),
            ),
          ),
          child: TodayDay(obj, context),
        ),
      ],
    );
  }
}
