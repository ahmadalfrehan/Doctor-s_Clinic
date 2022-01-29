import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  static Database? database;
  static Delete() {
    database!.delete('clinic');
    elements.clear();
  }

  static Color Color1 = Color(0xFF1A535C);
  static Color Color2 = const Color(0xFFFFE66D);
  static List<Map<dynamic, dynamic>> elements = [];
  static List<Map> res = [];

  static createDataBase() {
    openDatabase(
      'Ahmad.db',
      version: 1,
      onCreate: (database, version) async {
        print('database created');
        database
            .execute(
                'CREATE TABLE clinic (id INTEGER PRIMARY KEY , name TEXT ,lastN TEXT , phoneN TEXT , Information TEXT , Account TEXT , rest TEXT)')
            .then((value) {
          print('table created');
        }).catchError(
          (onError) =>
              print('the error happen when created database${onError}'),
        );
      },
      onOpen: (database) {
        elements.clear();
        GetDataFromDatabase(database);
        print('database opened ');
      },
    ).then((value) {
      database = value;
    });
  }

  static inserttoDataBase({
    required String name,
    required String lastN,
    required String phoneN,
    required String Inforamtion,
    required String account,
    required String rest,
  }) async {
    await database!.transaction(
      (txn) => txn
          .rawInsert(
              'INSERT INTO clinic (name,lastN,phoneN,Information,Account,rest) VALUES("$name","$lastN","$phoneN","$Inforamtion","$account","$rest")')
          .then((value) {
        print('$value inserted successfully');
        elements.clear();
        GetDataFromDatabase(database);
      }).catchError(
        (onError) => print('error when insert to data base ${onError}'),
      ),
    );
  }

  static GetDataFromDatabase(database) {
    //  elements.clear();
    database!.rawQuery('SELECT * FROM clinic').then((value) {
      value.forEach((element) {
        elements.add(element);
      });
    });
  }

  static DeleteFromDataBase({required int id}) {
    database!.rawDelete('DELETE FROM clinic WHERE id=?', [id]).then((value) {
      elements.clear();
      GetDataFromDatabase(database);
    });
  }

  static UpdateInDataBase({
    required int id,
    required String name,
    required String lastN,
    required String phoneN,
    required String Inforamtion,
    required String account,
    required String rest,
  }) {
    database!.rawUpdate(
      'UPDATE clinic SET name = ?,lastN = ?,phoneN = ?,Information = ?,Account = ?,rest = ? WHERE id = ?',
      ['$name', '$lastN', '$phoneN', '$Inforamtion', '$account', '$rest', id],
    ).then((value) {
      elements.clear();
      GetDataFromDatabase(database);
    });
  }
}
