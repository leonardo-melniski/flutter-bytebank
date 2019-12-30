import 'package:bytebank/models/transaction.dart';
import 'package:bytebank/services/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'dart:convert';

import 'package:http_interceptor/http_client_with_interceptor.dart';

class TransactionWebClient {
  String url = 'http://192.168.2.116:8080/transactions';
  final Client client =
      HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

  Future<List<Transaction>> findAll() async {
    final Response response =
        await client.get(url).timeout(Duration(seconds: 5));
    final List<dynamic> json = jsonDecode(response.body);
    return json.map((obj) => Transaction.fromJson(obj)).toList();
  }

  Future<Transaction> save(Transaction transaction) async {
    final Response response = await client
        .post(
          url,
          headers: {'Content-type': 'application/json', 'password': '1000'},
          body: jsonEncode(transaction.toJson()),
        )
        .timeout(Duration(seconds: 5));

    Map<String, dynamic> json = jsonDecode(response.body);
    return Transaction.fromJson(json);
  }
}
