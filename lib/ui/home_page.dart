import 'package:app_task/services/the_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          children: const [
            Text(
              "Hello Friend",
              style: TextStyle(fontSize: 30),
            )
          ],
        ));
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
        },
        child: const Icon(
          Icons.nightlight_round,
          size: 20,
        ),
      ),
      actions: [
        const Icon(
          Icons.person,
          size: 20,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
