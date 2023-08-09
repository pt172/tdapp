import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tdapp/item/time.dart';

class TaskAdd extends StatefulWidget {
  static const name = '/taskadd';
  const TaskAdd({super.key});

  @override
  State<TaskAdd> createState() => _TaskAddState();
}

class _TaskAddState extends State<TaskAdd> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Row(
          children: [
            InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: Color.fromARGB(197, 0, 136, 248),
                    ),
                    Transform.translate(
                        offset: const Offset(-10, 0),
                        child: const Text(
                          'Close',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(197, 0, 136, 248)),
                        )),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                'Task',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      const Divider(
        height: 25,
        thickness: 2,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a task',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
            const TextField(
              decoration: InputDecoration(
                  icon: Text(
                    'Name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  label: Text('Lorem ipsum dolor')),
            ),
            const SizedBox(
              height: 25,
            ),
            const Row(
              children: [
                Text(
                  'Hour',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 30,
                ),
                TimePicker(),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CupertinoSwitch(
                    activeColor: Colors.green,
                    value: isSwitched,
                    onChanged: ((value) {
                      setState(() {
                        isSwitched = value;
                      });
                    }))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  'Done',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'If you disable today, the task will be considered as tomorrow',
              style:
                  TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16),
            )
          ],
        ),
      ),
    ]);
  }
}
