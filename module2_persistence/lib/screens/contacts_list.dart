import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modulo2/database/dao/contact_dao.dart';
import 'package:modulo2/models/contact.dart';
import 'package:modulo2/screens/contact_form.dart';



class ContactsList extends StatelessWidget {

  final ContactDao _dao = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return _loading();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              debugPrint('future builder with size ${contacts.length}');
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => _ContactItem(contacts[index]),
              );
              break;
          }
          return Text('Unknown error.');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ContactForm()),
          );
        },
      ),
    );
  }

  Center _loading() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Loading...'),
          )
        ],
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact _contact;

  _ContactItem(this._contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          _contact.name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          _contact.accNumber.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
