import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "PasswordGenerator",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.deepOrange.shade200
        )
      ),
      home: passwordListPage(),
    );
  }
}


class passwordListPage extends StatefulWidget{

  @override
  _passwordListPageState createState() => _passwordListPageState();
}

class _passwordListPageState extends State<passwordListPage>{

  List<String> userId = [];
  List<String> password = [];

  void init() async{
    final prefs = await SharedPreferences.getInstance();
    userId = prefs.getStringList('userId')??[];
    password = prefs.getStringList('password')??[];
    setState(() {});
  }

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: Text("PasswordList"),
      ),
      body: ListView.builder(
        itemCount: 5/*userId.length*/,
        itemBuilder: (context, index){
          return SizedBox(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    width: 400,
                    height: 100,
                    child: Card(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(30),
                        child: Text("title",
                        style: TextStyle(fontSize: 20),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      )
    );
  }

}