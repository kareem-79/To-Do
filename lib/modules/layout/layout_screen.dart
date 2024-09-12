import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do/modules/layout/manager/provider.dart';
import 'package:to_do/modules/layout/pages/widgets/add_task_widget.dart';

class LayoutScreen extends StatelessWidget {
  static const String routeName = "LayoutScreen";

  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider()..getUser(),
      child: Selector<MainProvider, int>(
        selector: (p0, p1) => p1.selectedIndex,
        builder: (context, selectedIndex, child) {
          var provider = Provider.of<MainProvider>(context, listen: false);
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            child: Scaffold(
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(360),
                    borderSide: const BorderSide(color: Colors.white, width: 3)),
                onPressed: () {
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
                          child:  AddTaskWidget(provider));
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
              bottomNavigationBar: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  notchMargin: 8,
                  color: Colors.white,
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    currentIndex: selectedIndex,
                    onTap: provider.setIndex,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.menu,
                            size: 32,
                          ),
                          label: "Tasks"),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.settings,
                            size: 32,
                          ),
                          label: "Settings"),
                    ],
                  ),
                ),
              ),
              body: provider.screens[selectedIndex],
            ),
          );
        },
      ),
    );
  }
}


