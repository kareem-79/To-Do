import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/layout/manager/provider.dart';
import '../../../../core/models/task_model.dart';

class EditTaskWidget extends StatelessWidget {
  MainProvider provider;
  TaskModel taskModel;

  EditTaskWidget(this.provider, {super.key, required this.taskModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Edit Task",
                style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: 25),
              TextField(
                controller: provider.titleController,
                decoration: InputDecoration(
                    hintText: "Edit Title",
                    hintStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.descController,
                decoration: InputDecoration(
                    hintText: "Edit Desc",
                    hintStyle: Theme.of(context).textTheme.bodyMedium),
              ),
              const SizedBox(height: 20),
              Text("Selected Date",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400)),
              InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            initialDate: provider.selectedDatePiker,
                            lastDate:
                                DateTime.now().add(const Duration(days: 365)))
                        .then((value) {
                      provider.setDatePiker(value!);
                    });
                  },
                  child: Text(
                      provider.selectedDatePiker.toString().substring(0, 10))),
              const SizedBox(
                height: 10,
              ),
              Text("Selected Time",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400)),
              InkWell(
                  onTap: () {
                    showTimePicker(context: context, initialTime: provider.time)
                        .then((value) {
                      provider.setTime(value!);
                    });
                  },
                  child: Text(
                    "${provider.time.hour}:${provider.time.minute}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w400)
                  )),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  provider.editTasks(taskModel);
                  Navigator.pop(context);
                },
                child: const Text("Save Changes"),
              ),
            ],
          ),
        );
      },
    );
  }
}
