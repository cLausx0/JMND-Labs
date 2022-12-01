import 'package:flutter/material.dart';
import 'package:flutter_application_1/customs_widgets/horizontal_day_list.dart';
import 'package:flutter_application_1/customs_widgets/todo_grid_view.dart';
import 'package:flutter_application_1/customs_widgets/todo_information_popup.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> dayDependentTodos = [];

  List<String> todoInformation = [
    //É para ficar vazias as tasks
    "MON,TEST1,TEST1",
    "WED,TEST2,TEST2",
    "SUN,TEST3,TEST3",
    "WED,TEST4,TEST4",
    // "FRI,TEST5,TEST5",
    // "THU,TEST6,TEST6",
    // "MON,TEST7,TEST7",
    // "TUE,TEST8,TEST8",
    // "TUE,TEST9,TEST9",
    // "TUE,TEST10,TEST10",
  ];

  String weekday = "";

  void showInSnackBar(String value) {
    // Achamos que é o texto de add vazio
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      value,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 20, color: Colors.redAccent),
    )));
  }

  void updateList() {
    //Att a lista de tarefas
    dayDependentTodos.clear();
    for (int i = 0; i < todoInformation.length; i++) {
      if (todoInformation[i].split(",")[0] == weekday) {
        dayDependentTodos.add(todoInformation[i]);
      }
    }
  }

  void changeWeekday(String newDay) {
    // Muda o dia
    setState(() {
      weekday = newDay;
    });
    print("changed, $weekday");

    updateList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Barra com título
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.0,
        title: const Text("MY TODOs"),
      ),
      body: Column(
        //Lista dos dias da semana
        children: [
          const SizedBox(
            height: 20,
          ),
          HorizontalDayList(
            dayUpdateFunction: changeWeekday,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            //Ao clickar num dia da semana
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: [BoxShadow(blurRadius: 10.0)]),
              child: TodoGridView(
                todoList: dayDependentTodos,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //Botão adicionar atividade
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return TodoInformationPopup(
                  //Puxa o arquivo todo_Information_popup.dart
                  titleController: titleController,
                  descriptionController: descriptionController,
                );
              }).then((value) {
            setState(() {
              if (descriptionController.text ==
                      "" || //Se nem titulo nem descrição estão vazios
                  titleController.text == "") {
                showInSnackBar("Title or description can't be empty!");
              } else {
                //Se não, adiciona a task
                todoInformation.add(
                    "$weekday,${titleController.text},${descriptionController.text}");
                updateList();
                titleController.clear();
                descriptionController.clear();
              }
            });
          });
        },
        splashColor: Colors.deepPurple,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: const Icon(Icons.favorite),
            label: 'Pomodoro',
          ),
          NavigationDestination(
            icon: const Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: const Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: const Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
