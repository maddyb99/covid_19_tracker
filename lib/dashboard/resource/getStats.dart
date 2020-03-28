import 'package:covid19tracker/dashboard/model/stats.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Stream<CurrStats>> getCurrStats() async {
  final String url = 'https://api.rootnet.in/covid19-in/stats/latest';

  final client = new http.Client();
  final streamedRest = await client.send(
      http.Request('get', Uri.parse(url))
  );

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => CurrStats.fromJSON(data));
}