import 'package:flutter/material.dart';
import 'package:tdapp/item/task.dart';
import 'package:tdapp/item/task2.dart';
import 'package:tdapp/page/task_add.dart';

class HomePage extends StatelessWidget {
  static const name = '/homepage';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 320),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVECzTdH_vdN6kNatGLQiEc4ocSFdbcWqztQ&usqp=CAU'),
                        fit: BoxFit.fill),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 1),
                child: Row(
                  children: [
                    Text(
                      'Today',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 190),
                      child: Text(
                        'Hide completed',
                        style:
                            TextStyle(color: Color.fromARGB(255, 58, 151, 227)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Task(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const Task(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const Task(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const Task(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
              const Task(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.lineThrough,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
              const Text(
                'Tomorrow',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const TaskTwo(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const TaskTwo(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const TaskTwo(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              const TaskTwo(
                  title:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                  time: '12:42 PM',
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20, left: 320),
                child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          useSafeArea: true,
                          isScrollControlled: true,
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15))),
                          context: context,
                          builder: (BuildContext context) {
                            return const TaskAdd();
                          });
                    },
                    child: const Icon(
                      Icons.add_circle,
                      size: 50,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
