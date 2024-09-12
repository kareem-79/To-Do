import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/layout/manager/provider.dart';

class AddTaskWidget extends StatelessWidget {
  MainProvider provider;


  AddTaskWidget(
    this.provider, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Add New Task",
                style: GoogleFonts.inter(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 25),
              TextField(
                controller: provider.titleController,
                decoration: InputDecoration(
                    hintText: "Title",
                    hintStyle: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: provider.descController,
                decoration: InputDecoration(
                    hintText: "Desc",
                    hintStyle: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w400)),
              ),
              const SizedBox(height: 20),
              Text("Selected Date",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400)),
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
              const SizedBox(height: 10,),
              Text("Selected Time",
                  style: GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400)),
              InkWell(
                  onTap: () {
                    showTimePicker(context: context, initialTime: provider.time).then((value) {
                      provider.setTime(value!);
                    });
                  },
                  child: Text(
                      "${provider.time.hour}:${provider.time.minute}",style:GoogleFonts.inter(
                      fontSize: 18, fontWeight: FontWeight.w400) ,)),
              const Spacer(),
              ElevatedButton(onPressed: () {
                provider.addTask();
                Navigator.pop(context);
              }, child: const Text("Add Task"))
            ],
          ),
        );
      },
    );
  }
}
