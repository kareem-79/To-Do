import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/models/task_model.dart';
import 'package:to_do/modules/layout/manager/provider.dart';
import 'package:to_do/modules/layout/pages/widgets/custom_card_task.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                            "Hi , ${provider.user?.name.toUpperCase() ?? ""}",
                            style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: EasyInfiniteDateTimeLine(
                    firstDate: FirebaseAuth
                        .instance.currentUser!.metadata.creationTime!,
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                    showTimelineHeader: false,
                    focusDate: provider.selectedDate,
                    onDateChange: provider.setDate,
                    activeColor: Colors.blue,
                    dayProps: EasyDayProps(
                        todayHighlightStyle: TodayHighlightStyle.withBackground,
                        todayHighlightColor: const Color(0xff85a5ff),
                        inactiveDayStyle: DayStyle(
                            dayStrStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                            monthStrStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                            dayNumStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.w400),
                            decoration: BoxDecoration(
                                color: MainProvider.mode == ThemeMode.light
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).secondaryHeaderColor,
                                borderRadius: BorderRadius.circular(15)))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            StreamBuilder(
              stream: provider.getTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Text("Has Error");
                } else {
                  List<TaskModel> tasks =
                      snapshot.data!.docs.map((e) => e.data()).toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return CustomCardTask(
                          taskModel: tasks[index],
                        );
                      },
                    ),
                  );
                }
              },
            )
          ],
        );
      },
    );
  }
}
