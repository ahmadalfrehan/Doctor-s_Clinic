import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maybe/Details.dart';
import 'DB.dart';
import 'Edit.dart';
import 'Home.dart';
import 'Search.dart';

class See extends StatefulWidget {
  List<Map<dynamic, dynamic>> list = [];
  See(this.list);
  @override
  _SeeState createState() => _SeeState(this.list);
}

class _SeeState extends State<See> {
  List<Map<dynamic, dynamic>> list = [];
  _SeeState(this.list);
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: DB.Color1,
        centerTitle: true,
        title: Text(
          'Home page ',
          style: TextStyle(
            color: DB.Color2,
            fontWeight: FontWeight.bold,
            //fontSize: 18,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
            },
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
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
                        builder: (context) => const Home(),
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
                ),
                const Divider(
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
      body: list.isEmpty
          ? Container(
          height: 71110,
          margin: const EdgeInsets.symmetric(vertical: 13),
          child: const LinearProgressIndicator())
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(1, 1, 14, 10),
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A535C),
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(2, 2, 18, 10),
                        height: 97,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFE66D),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      ListTile(
                        trailing: MaterialButton(
                          child: const Icon(Icons.arrow_forward_outlined),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(list, index),
                              ),
                            );
                          },
                        ),
                        title: Text(
                          list[index]['name'],
                          style: const TextStyle(
                            color: Color(0xFF1A535C),
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        subtitle: Text(
                          list[index]['lastN'],
                          style: const TextStyle(
                              //color: Colors.teal,
                              ),
                        ),
                        leading: Container(
                          alignment: Alignment.center,
                          width: 100,
                          height: 100,
                          child: CircleAvatar(
                            backgroundColor: const Color(0xFF1A535C),
                            child: Text(
                              list[index]['id'].toString(),
                              style: const TextStyle(
                                color: Color(0xFFFFE66D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
