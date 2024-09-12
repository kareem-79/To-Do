import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/models/task_model.dart';
import 'package:to_do/modules/layout/manager/provider.dart';

import 'edit_task_widget.dart';

class CustomCardTask extends StatelessWidget {
  TaskModel taskModel;

  CustomCardTask({super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Slidable(
            key: const ValueKey("test"),
            startActionPane: ActionPane(
                dismissible: DismissiblePane(onDismissed: () {
                  provider.deleteTask(taskModel.id);
                }),
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: (_) {
                      provider.deleteTask(taskModel.id);
                    },
                    borderRadius: BorderRadius.circular(15),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                    label: "Delete",
                  ),
                  SlidableAction(
                    borderRadius: BorderRadius.circular(15),
                    onPressed: (_) {
                      provider.editTasks(taskModel);
                      showModalBottomSheet(
                        isDismissible: true,
                        showDragHandle: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                            )),
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                              value: provider,
                              child:  EditTaskWidget(provider, taskModel: taskModel,));
                        },
                      );
                    },
                    backgroundColor: Colors.blue,
                    icon: Icons.edit,
                    label: "Edit",
                  ),
                ]),
            child: Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        height: 80,
                        width: 4,
                        decoration: taskModel.isDone == true
                            ? BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5))
                            : BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(5))),
                    const SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(taskModel.title,
                            style: taskModel.isDone == true
                                ? GoogleFonts.poppins(
                                    fontSize: 22,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600)
                                : GoogleFonts.poppins(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(taskModel.desc),
                        const Spacer(),
                        Row(
                          children: [
                            const Icon(Icons.timelapse),
                            Text(taskModel.time)
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          provider.setDone(taskModel);
                        },
                        child: Container(
                          width: 90,
                          height: 40,
                          decoration: taskModel.isDone == true
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white)
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue),
                          child: taskModel.isDone == true
                              ? Text(
                                  "isDone...!",
                                  style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                                )
                              : const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 28,
                                ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
