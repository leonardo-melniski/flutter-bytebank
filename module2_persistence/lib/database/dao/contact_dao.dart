import 'package:flutter/material.dart';
import 'package:modulo2/database/app_database.dart';
import 'package:modulo2/models/contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {

  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';
  static const String _tableName = 'contacts';
  static const String _tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account_number INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase(_tableSql);
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    debugPrint('Loading all elements');
    final Database db = await getDatabase(_tableSql);
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    debugPrint('find ${contacts.length} elements');
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = List();
    for (Map<String, dynamic> map in result) {
      final Contact contact = Contact(
          map[_id], map[_name], map[_account_number]);
      contacts.add(contact);
    }
    return contacts;
  }
}