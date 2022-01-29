import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maybe/Details.dart';
import 'DB.dart';
import 'Search.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key}) : super(key: key);

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  var nameEditController = TextEditingController();
  var lasTEditController = TextEditingController();
  var InfoEditController = TextEditingController();
  var PhoneEditController = TextEditingController();
  var acccountEditController = TextEditingController();
  var restEditController = TextEditingController();
  var idEditController = TextEditingController();
  int? idE;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: DB.Color1,
        centerTitle: true,
        title: Text(
          'Edit',
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
          child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormF("Edit name?", Icons.person, nameEditController),
            TextFormF("Edit lastName ?", Icons.person, lasTEditController),
            TextFormF("Edit Inforamtion ?", Icons.info, InfoEditController),
            TextFormF("Edit phoneNumer ?", Icons.phone, PhoneEditController),
            TextFormF("Edit account ?", Icons.account_balance,
                acccountEditController),
            TextFormF("Edit rest ?", Icons.work_outline, restEditController),
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
                controller: idEditController,
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
                fixedSize: Size(350, 40),
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                setState(() {
                  print(idE);
                  idE = int.parse(idEditController.text);
                  print(idE);
                  DB.UpdateInDataBase(
                    id: idE!,
                    name: nameEditController.text,
                    lastN: lasTEditController.text,
                    phoneN: PhoneEditController.text,
                    Inforamtion: InfoEditController.text,
                    account: acccountEditController.text,
                    rest: restEditController.text,
                  );
                });
              },
              child: Text(
                ' Edit ?',
                style: TextStyle(
                  color: DB.Color1,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      )),
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
