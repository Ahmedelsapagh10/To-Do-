import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_application/controllers/task_controller.dart';
import 'package:todo_application/ui/theme.dart';

import '../../services/theme_services.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a")
      .format(DateTime.now().add(Duration(minutes: 15)))
      .toString();
  int _selectedReminder = 5;
  List<int> RemindList = [5, 10, 15, 20];
  String _selectedRepeat = "None";
  List<String> RepeatList = ["None", "Daily", "Weekly", "Monthly"];
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    ///
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text("Add Task"),
      // ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Add Task',
                  style: headingStyle,
                ),
              ),
              InputField(
                controller: _titleController,
                label: 'Title',
                hint: 'Enter title here',
              ),
              InputField(
                controller: _noteController,
                label: 'Note',
                hint: 'Enter note here',
              ),
              InputField(
                label: 'Date',
                hint: DateFormat.yMd().format(_selectedDate),
                widget: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.grey,
                    )),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      label: 'Start Time',
                      hint: _startTime,
                      widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      label: 'End Time',
                      hint: _endTime,
                      widget: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.watch_later_outlined,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                ],
              ),
              InputField(
                  label: 'Reminder',
                  hint: '${_selectedReminder.toString()} minutes early',
                  widget: DropdownButton(
                    dropdownColor: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    items: RemindList.map((e) => DropdownMenuItem(
                          child: Text(
                            '${e.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          value: e,
                        )).toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                    ),
                    elevation: 4,
                    underline: Container(
                      height: 0,
                    ),
                    style: subtitleStyle,
                    onChanged: (value) {
                      setState(() {
                        _selectedReminder = int.parse(value.toString());
                      });
                    },
                  )),
              InputField(
                  label: 'Repeat',
                  hint: _selectedRepeat,
                  widget: DropdownButton(
                    dropdownColor: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                    items: RepeatList.map((e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          value: e,
                        )).toList(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                    ),
                    style: subtitleStyle,
                    underline: Container(
                      height: 0,
                    ),
                    elevation: 4,
                    onChanged: (value) {
                      setState(() {
                        _selectedRepeat = value.toString();
                      });
                    },
                  )),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 22),
                  child: Text(
                    'Color',
                    style: titleStyle,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 10,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedColor = 0;
                              });
                            },
                            icon: Icon(
                              Icons.circle,
                              color: primaryClr,
                              size: 32,
                            )),
                        _selectedColor == 0 ? Icon(Icons.done) : Container(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedColor = 1;
                              });
                            },
                            icon: Icon(
                              Icons.circle,
                              color: pinkClr,
                              size: 32,
                            )),
                        _selectedColor == 1 ? Icon(Icons.done) : Container(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _selectedColor = 2;
                              });
                            },
                            icon: Icon(
                              Icons.circle,
                              color: orangeClr,
                              size: 32,
                            )),
                        _selectedColor == 2 ? Icon(Icons.done) : Container(),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 30,
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: MyButton(label: 'Create Task', onTap: () {})),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///
  ///
  ///

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
}
