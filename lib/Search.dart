import 'package:flutter/material.dart';
import 'DB.dart';
import 'Details.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<dynamic, dynamic>> Search = [];
  void SearchInDelete(String text) async {
    Search.clear();
    DB.database!
        .rawQuery(
            "SELECT * FROM clinic WHERE name LIKE '%${text}%' OR  lastN LIKE '%${text}%' OR  phoneN LIKE '%${text}%' OR  Information LIKE '%${text}%' OR  Account LIKE '%${text}%' OR  rest LIKE '%${text}%'")
        .then((value) {
      value.forEach((element) {
        setState(() {
          //Search.clear();
          Search.add(element);
          //print('the search list is ' + Search.toString());
          //print('the element is is is ' + element.toString());
        });
      });
    }).catchError(
      (onError) => print('error when insert to data base ${onError}'),
    );
  }

  bool ty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: DB.Color1, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: DB.Color1, width: 2.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(
                      Icons.search,
                      color: DB.Color1,
                    ),
                    labelText: " Search "),
                onChanged: (String text) {
                  setState(() {
                    text.length == 0 ? ty = true : ty = false;
                    Search.clear();
                  });
                  SearchInDelete(text);
                },
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 1555,
                child: (Search.isEmpty || ty == true)
                    ? Center(
                        child: Text('No element Found !'),
                      )
                    : ListView.builder(
                        itemCount: Search.length,
                        itemBuilder: (context, index) => Padding(
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
                                  child: Icon(Icons.arrow_forward_outlined),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Details(Search, index),
                                      ),
                                    );
                                  },
                                ),
                                title: Text(
                                  Search[index]['name'],
                                  style: const TextStyle(
                                    color: Color(0xFF1A535C),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                                subtitle: Text(
                                  Search[index]['lastN'],
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
                                      Search[index]['id'].toString(),
                                      style: const TextStyle(
                                        color: Color(0xFFFFE66D),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
