import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maybe/See.dart';
import 'package:sqflite/sqflite.dart';
import 'DB.dart';
import 'Edit.dart';
import 'Home.dart';
import 'Search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int t = 1;
  double o = 1;
  int r = 1;
  int b = 1;
  int g = 1;
  double a = 60;
  double a1 = 0;
  Tim() {
    const Sec = Duration(seconds: 2);
    Timer.periodic(Sec, (timer) {
      setState(() {
        t++;
        Random R = Random();
        o > 255 ? o = 0 : o += R.nextDouble().toDouble();
        r > 255 ? r = 1 : r += R.nextInt(255).toInt();
        g > 255 ? g = 2 : g += R.nextInt(255).toInt();
        b > 255 ? b = 0 : b += R.nextInt(255).toInt();
        a > 45 || a < 0 ? a = 0 : a += R.nextDouble().toDouble();
        a1 > 25 || a1 < 0 ? a1 = 0 : a1 += R.nextDouble().toDouble();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Tim();
    DB.createDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(r, g, b, o),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        " add patient ?",
                        style: TextStyle(
                          color: DB.Color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),const Divider(
                  color: Colors.black,
                  thickness: 0,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Edit()));
                  },
                  child: Row(
                    children:  [
                      Text(
                        " Edit patient ?",
                        style: TextStyle(
                          color: DB.Color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0,
                ),
                MaterialButton(
                  onPressed: () {
                    var e = AlertDialog(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      content: SizedBox(
                        height: 120,
                        width: 150,
                        child: Container(
                          child: Column(
                            children: [
                              Text("Are you sure you want to Delete all patients ?\n",
                                style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary:Colors.redAccent
                                ),
                                onPressed: () {
                                  setState(() {
                                    DB.Delete();
                                  });
                                },
                                child: Text(" Delete all ??????"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                    showDialog(context: context, builder: (context) => e);
                  },
                  child: Row(
                    children: const [
                      Text(
                        ' Delete all ???',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0,
                ),
                MaterialButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Row(
                    children: [
                      Text(
                        "Get out ?",
                        style: TextStyle(
                          color: DB.Color1,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0,
                ),
              ],
            ),
          ),
        ),
      ),
      body: See(DB.elements),
    );
  }
}
