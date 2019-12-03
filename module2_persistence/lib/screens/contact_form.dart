import 'package:flutter/material.dart';
import 'package:modulo2/database/dao/contact_dao.dart';
import 'package:modulo2/models/contact.dart';

class ContactForm extends StatefulWidget {

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final TextEditingController _controllerName =  TextEditingController();
  final TextEditingController _controllerAccNumber =  TextEditingController();

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controllerName,
                decoration: InputDecoration(
                  labelText: 'Full name'
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controllerAccNumber,
                decoration: InputDecoration(
                    labelText: 'Account number'
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _controllerName.text;
                    final int accNumber = int.tryParse(_controllerAccNumber.text);
                    if(accNumber != null && name != null){
                      final newContact = new Contact(0, name, accNumber);
                      _dao.save(newContact).then((id) {
                        debugPrint('criou $newContact com id: $id');
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
