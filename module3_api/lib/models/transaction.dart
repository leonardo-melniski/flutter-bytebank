
import 'package:bytebank/models/contact.dart';

class Transaction {
  double value;
  Contact contact;

  Transaction(this.value, this.contact);

  @override
  toString(){
    return 'Transaction(value: $value, contact:$contact)';
  }

  Transaction.fromJson(Map<String, dynamic> json) {
    if(json == null) return;
    value = json['value'];
    contact =
    json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    return data;
  }
}

