import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/models/task.dart';
import 'package:todo_application/services/theme_services.dart';
import 'package:todo_application/ui/pages/add_task_page.dart';
import 'package:todo_application/ui/pages/notification_screen.dart';
import 'package:todo_application/ui/size_config.dart';
import 'package:todo_application/ui/theme.dart';
import 'package:todo_application/ui/widgets/button.dart';

import '../../services/notification_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // var initNotification = NotifyHelper();
  // @override
  // void initState() {
  //   super.initState();
  //   initNotification.initializeNotification();
  //   initNotification.requestIOSPermissions();
  // }

  DateTime selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: _appBar(),
        body: Center(
          child: Column(
            children: [
              _addTaskBar(),
              _DateBar(),
              const SizedBox(
                height: 10,
              ),
              _BodyWidget(),
            ],
          ),
        ));
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/person.jpeg'),
          radius: 18,
        ),
        SizedBox(
          width: 20,
        ),
      ],
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          ThemeServices().SwitchMode();
          // initNotification.displayNotification(
          //        title: 'Mode Changed', body: 'have a nice day!');
          //  initNotification.scheduledNotification(0, 0, Task());
          //   Get.to(NotificationScreen(payload: 'Ahmed|Mohamed|12:12'));
        },
        icon: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_outlined,
          color: Get.isDarkMode ? Colors.white : darkGreyClr,
          size: 24,
        ),
      ),
    );
  }

  Widget _addTaskBar() {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: titleStyle,
              ),
              Text(
                'Today',
                style: headingStyle,
              ),
            ],
          ),
          MyButton(
              label: '+ Add Task',
              onTap: () async {
                await Get.to(() => const AddTaskPage());

                ///Get All Notes >>old and new
              })
        ],
      ),
    );
  }

  Widget _DateBar() {
    return Container(
      child: DatePicker(
        DateTime.now(),
        // selectedTime,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        height: 100,
        width: 70,
        dateTextStyle: titleStyle,
        dayTextStyle: bodyStyle,
        monthTextStyle: bodyStyle,
        initialSelectedDate: selectedTime,
        onDateChange: (selectedDate) {
          setState(() {
            selectedTime = selectedDate;
          });
        },
      ),
    );
  }

  Widget _BodyWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? Axis.horizontal
                      : Axis.vertical,
              children: [
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? const SizedBox(height: 5)
                    : const SizedBox(height: 150),
                SvgPicture.asset(
                  'assets/images/task.svg',
                  width: 100,
                  color: primaryClr.withOpacity(0.5),
                  height: 100,
                  fit: BoxFit.contain,
                ),
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? const SizedBox(height: 5)
                    : const SizedBox(height: 5),
                Text(
                  'You don\'t have any tasks ! \n Click + Add Task to add new task ',
                  textAlign: TextAlign.center,
                  style: body3Style,
                ),
                MediaQuery.of(context).orientation == Orientation.landscape
                    ? const SizedBox(height: 120)
                    : const SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
