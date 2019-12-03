
import 'package:flutter/material.dart';
import 'package:modulo2/screens/contacts_list.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "images/logo-placeholder.png",
                scale: .6,
                fit: BoxFit.fill,
                color: Theme
                    .of(context)
                    .primaryColor
                    .withAlpha(235),
                colorBlendMode: BlendMode.colorDodge,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ContactsList(),
                  ));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 100,
                  width: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 24,
                      ),
                      Text('Contacts',
                          style: TextStyle(color: Colors.white, fontSize: 16))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}