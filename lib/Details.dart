import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maybe/DB.dart';

import 'Edit.dart';
import 'Search.dart';

class Details extends StatefulWidget {
  List list = [];
  var index;
  Details(this.list, this.index);

  @override
  _DetailsState createState() => _DetailsState(this.list, this.index);
}

class _DetailsState extends State<Details> {
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  List list = [];
  var index;
  _DetailsState(this.list, this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: DB.Color1,
        centerTitle: true,
        title: Text(
          'Details',
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
                  builder: (context) => Search(),
                ),
              );
            },
            icon: Icon(
              Icons.search,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF086E7D),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(200),
                        //topRight: Radius.circular(140),
                        //bottomRight: Radius.circular(70),
                        bottomLeft: Radius.circular(200),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 0, 20),
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 1, 18, 10),
                          //height: 400,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF98A),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 19, left: 5, bottom: 3, top: 15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      list[index]['name'],
                                      style: TextStyle(
                                        color: DB.Color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.person),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      list[index]['lastN'],
                                      style: TextStyle(
                                        color: DB.Color1,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          children: [
                                            Icon(Icons.details),
                                            const SizedBox(
                                              width: 110,
                                            ),
                                            Expanded(
                                              child: Text(
                                                list[index]['Information'],
                                                style: TextStyle(
                                                  color: DB.Color1,
                                                  fontWeight: FontWeight.w400,
                                                  //fontSize: 15,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                    ),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      list[index]['phoneN'],
                                      style: TextStyle(
                                        color: DB.Color1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.price_check,
                                    ),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      list[index]['Account'],
                                      style: TextStyle(
                                        color: DB.Color1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.price_change,
                                    ),
                                    const SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      list[index]['rest'],
                                      style: TextStyle(
                                        color: DB.Color1,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1, 630, 18, 10),
                          decoration: BoxDecoration(
                            color: Color(0xFFFFF98A),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    print(index);
                                    DB.DeleteFromDataBase(id: index);
                                  });
                                },
                                child: Row(
                                  children: [
                                    const Icon(Icons.delete),
                                    const Text('Delete ?'),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                              MaterialButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Edit()));
                                },
                                child: Row(
                                  children: const [
                                    Icon(Icons.edit),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
