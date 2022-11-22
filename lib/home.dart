import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/sqldb.dart';

class Home extends StatelessWidget {
    Home({Key? key}) : super(key: key);

  final SqlDb sqlDb=SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
        leading: Icon(Icons.menu),
      ),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () async{
                  int response=await sqlDb.insertData( 'INSERT INTO todolist(notes) VALUES("note one")');
                  print(response.toString());
                },
                color: Colors.cyanAccent,
                child: Text("insert"),
              ),
              MaterialButton(
                onPressed: () async{
                  List<Map> response=await sqlDb.readData('SELECT * FROM todolist');
                  print("$response");
                },
                color: Colors.cyanAccent,
                child: Text("ReadData"),
              ),
              MaterialButton(
                onPressed: () async{
                  int response=await sqlDb.deleteData('DELETE FROM todolist WHERE id = 2 ');
                  print("$response");
                },
                color: Colors.cyanAccent,
                child: Text("delete Data"),
              ),  MaterialButton(
                onPressed: () async{
                  int response=await sqlDb.updateData('UPDATE "todolist" SET "notes" = "tarej" WHERE id = 4',);
                  print("$response");
                },
                color: Colors.cyanAccent,
                child: Text("update Data"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
