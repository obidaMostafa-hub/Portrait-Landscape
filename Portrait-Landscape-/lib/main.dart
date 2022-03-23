import 'package:flutter/material.dart';

import 'CreatTextElement.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ResposiveWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ResposiveWidget extends StatefulWidget {
  const ResposiveWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyWidgetState();
  }
}

class MyWidgetState extends State<ResposiveWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool open = true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 600) {
        return Scaffold(
          backgroundColor: Colors.pink,
          key: _scaffoldKey,
          body: Stack(
            children: [
              my_drawer(open)
            ],
          ),
          appBar: AppBar(
              backgroundColor: Colors.deepPurple,
              title: const Text('SECOND ASSIGNMENT'),
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  if (open) {
                    CloseDrawer();
                  } else if (!open) {
                    OpenDrawer();
                  }
                },
              )),
        );
      }

      return Scaffold(
        backgroundColor: Colors.pink,
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 80,
              ),
              CreatTextElement('FIRST ELEMENT'),
              CreatTextElement('SECOND ELEMENT'),
              CreatTextElement('THIRD ELEMENT'),
              CreatTextElement('FOURTH ELEMENT'),
              CreatTextElement('FIFTHE ELEMENT'),
            ],
          ),
        ),
        appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: const Text('SECOND ASSIGNMENT'),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _openDrawer();
              },
            )),
      );
    });
  }

  void _openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  void OpenDrawer() {
    setState(() {
      open = true;
    });
  }

  void CloseDrawer() {
    setState(() {
      open = false;
    });
  }

  Widget my_drawer(bool open) {
    if (open) {
      return Container(
        child: ListView(
          children: [
            Container(
              height: 40,
            ),
            CreatTextElement('FIRST ELEMENT'),
            CreatTextElement('SECOND ELEMENT'),
            CreatTextElement('THIRD ELEMENT'),
            CreatTextElement('FOURTH ELEMENT'),
            CreatTextElement('FIFTHE ELEMENT'),
          ],
        ),
        decoration: const BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(right: getScrrenWidth(context) / 2),
      );
    }

    return Container();
  }
}

double getScrrenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
