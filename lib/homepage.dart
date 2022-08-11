import 'package:crudsapp/database/databasehadler.dart';
import 'package:crudsapp/database/user_model.dart';
import 'package:crudsapp/database/user_repo.dart';
import 'package:crudsapp/main.dart';
import 'package:flutter/material.dart';
import 'database/databasehadler.dart';
import 'package:sqflite/sqflite.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailtextcontroller = TextEditingController();
  TextEditingController nametextcontroller = TextEditingController();
  TextEditingController agetextcontroller = TextEditingController();

  Database? _database;

  List<Map<String, dynamic>>? userList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ameer Hamza'),
      ),
      body: Column(
        children: [
          textfield('Name', nametextcontroller),
          textfield('Email', emailtextcontroller),
          textfield('Age', agetextcontroller),
          getbutton(),
          getReadbutton(),
          buildUSerList()
        ],
      ),
    );
  }

  Widget getbutton() {
    return ElevatedButton(
        onPressed: () {
          insertDB();
        },
        child: Text("Insert"));
  }

  Widget getReadbutton() {
    return ElevatedButton(
        onPressed: () {
          getFromUser();
        },
        child: Text("Read"));
  }

  Widget buildUSerList() {
    return Expanded(
      child: ListView.builder(
          itemCount: userList?.length,
          itemBuilder: (BuildContext context, int index) {
            return Text('User Name ${userList![index]['name']}');
          }),
    );
  }

  Future<Database?> openDB() async {
    _database = await DatabaseHandler().openDB();
    return _database;
  }

  Future insertDB() async {
    _database = await openDB();
    UserRepo userRepo = UserRepo();
    userRepo.createTable(_database);

    UserModel userModel = UserModel(
        nametextcontroller.text.toString(),
        emailtextcontroller.text.toString(),
        int.tryParse(agetextcontroller.text.toString())!);

    await _database?.insert('User', userModel.toMap());
    await _database?.close();
  }

  Future<void> getFromUser() async {
    _database = await openDB();

    UserRepo userRepo = UserRepo();
    userList = await userRepo.getUsers(_database);

    await _database?.close();
  }

  
}
