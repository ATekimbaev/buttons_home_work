import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String massage = 'Вы не нажали ни одной кнопки';

  void buttonPress(String name) {
    setState(
      () {
        massage = 'Вы нажали на кнопку $name';
      },
    );
  }

  void buttonLongPress(String name) {
    setState(() {
      massage = 'Вы зажали кнопку';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                onTap: (){buttonPress('Pop up menu button 1');},
                child: Row(
                  children: const [
                    Text('One'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.one_k,color: Colors.black,)
                  ],
                ),
              ),
              PopupMenuItem(
                 onTap: (){buttonPress('Pop up menu button 2');},
                child: Row(
                  children: const [
                    Text('Two'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.two_k,color: Colors.black,)
                  ],
                ),
              ),
              PopupMenuItem(
                 onTap: (){buttonPress('Pop up menu button 3');},
                child: Row(
                  children: const [
                    Text('Tree'),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.three_k, color: Colors.black,)
                  ],
                ),
              ),
            ],
          ),
        ],
        title: const Text('Buttons Home Work'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FlatButton(
              onPressed: () {
                buttonPress('Flat Button');
              },
              child: const Text('Flat Button'),
              onLongPress: () {
                buttonLongPress('Flat Button');
              },
            ),
            RaisedButton(
              onPressed: () {
                buttonPress('Raised Button');
              },
              child: const Text('Raised Button'),
              onLongPress: () {
                buttonLongPress('Raised Button');
              },
            ),
            FloatingActionButton(
              onPressed: () {
                buttonPress('Floating action button');
              },
              child: const Icon(Icons.access_alarms_rounded),
            ),
            MyDropDownButton(),
            IconButton(
              onPressed: () {
                buttonPress('Icon Butttton');
              },
              icon: const Icon(Icons.add_alert_rounded),
            ),
            InkWell(
              onTap: () {
                buttonPress('InkWell Button');
              },
              child: const Text('InkWell Button'),
            ),
            OutlineButton(
              child: Text('outline button'),
              onPressed: (){buttonPress('outline button');}),
            const Spacer(),
            Center(
              child: Text(massage),
            ),
            const SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}

class MyDropDownButton extends StatefulWidget {
  MyDropDownButton({Key? key}) : super(key: key);

  @override
  State<MyDropDownButton> createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  List<String> item = ['item 1', 'item 2', 'item 3'];
  String dropDownValue = 'item 1';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropDownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropDownValue = newValue!;
        });
      },
      items: item.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

