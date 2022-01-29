import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'DB.dart';
import 'Search.dart';
import 'See.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var nameController = TextEditingController();
  var lasTController = TextEditingController();
  var InfoController = TextEditingController();
  var PhoneController = TextEditingController();
  var acccountController = TextEditingController();
  var restController = TextEditingController();
  var idController = TextEditingController();

  double heights = 40;
  double widths = 350;
  int? idd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: DB.Color1,
        centerTitle: true,
        title: Text(
          'Add',
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
        //height: double.infinity,
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        decoration: const BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: const Radius.circular(
              37,
            ),
            topRight: const Radius.circular(
              37,
            ),
            bottomLeft: Radius.circular(
              20,
            ),
            bottomRight: const Radius.circular(
              20,
            ),
          ),
          color: Color(0xFFF7FFF7),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormF("name", Icons.person, nameController),
              TextFormF("lastName", Icons.person, lasTController),
              TextFormF("Inforamtion", Icons.details, InfoController),
              TextFormF("phoneNumer", Icons.phone, PhoneController),
              TextFormF("account", Icons.price_check, acccountController),
              TextFormF("rest", Icons.price_change, restController),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: DB.Color1,
                    width: 2,
                  ),
                  elevation: 0.0,
                  primary: DB.Color2,
                  fixedSize: Size(widths, heights),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  DB.inserttoDataBase(
                    name: nameController.text,
                    lastN: lasTController.text,
                    Inforamtion: InfoController.text,
                    phoneN: PhoneController.text,
                    account: acccountController.text,
                    rest: restController.text,
                  );
                },
                child: Text(
                  ' insert ?!',
                  style: TextStyle(
                    color: DB.Color1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: DB.Color1,
                    width: 2,
                  ),
                  elevation: 0.0,
                  primary: DB.Color2,
                  fixedSize: Size(widths, heights),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  print(DB.elements);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => See(DB.elements),
                    ),
                  );
                },
                child: Text(
                  'view the data ?!',
                  style: TextStyle(
                    color: DB.Color1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  30,
                  10,
                  30,
                  10,
                ),
                child: TextFormField(
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
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: Icon(Icons.format_list_numbered_rounded,
                          color: DB.Color1),
                      labelText: " ID "),
                  controller: idController,
                  keyboardType: TextInputType.text,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'the field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                    color: DB.Color1,
                    width: 2,
                  ),
                  elevation: 0.0,
                  primary: DB.Color2,
                  fixedSize: Size(widths, heights),
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  setState(() {
                    print(idd);
                    idd = int.parse(idController.text);
                    print(idd);
                    DB.DeleteFromDataBase(id: idd!);
                  });
                },
                child: Text(
                  ' Delete by id ?',
                  style: TextStyle(
                    color: DB.Color1,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget TextFormF(String lab, IconData Ic, var x) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        30,
        10,
        30,
        10,
      ),
      child: TextFormField(
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
              Ic,
              color: DB.Color1,
            ),
            labelText: lab),
        //keyboardAppearance: Brightness.light,
        controller: x,
        keyboardType: TextInputType.text,
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'the field must not be empty';
          }
          return null;
        },
      ),
    );
  }
}
