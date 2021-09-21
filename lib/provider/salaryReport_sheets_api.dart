import 'package:gsheets/gsheets.dart';

import '../models/salaryReportFields.dart';

class EmployeeSalaryReportApi {
  static const _credentials = r'''
 {
  "type": "service_account",
  "project_id": "genesis-packaging-v-1",
  "private_key_id": "7d0aa58d93f7762579056ed3011561c9c9bd2e37",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCe7tZpQEOpYNQt\nCwkYsNhtIcNqtAcjKl3eFHdNfhaTiFQdKgGRu/x8XaFWQsRxuGS2AJrmAGPPA3iG\ngI5YnARVHjuD3oXz6Rc1kHm2XewL1Iec7pq+iEbaRbcLLmo+ciQBL8L/2dyEJN31\n823/txK91hE5ItFZ5SlH9gjU0KxMte1qsYbqgY0l9mGCvBF5I8/1mUXuCZziGXY0\nZ4x9BsqGuLhjQVAJoCDlDhf+teQpJMcOTfRiMXOlmW1Wi4IsaVwjVSrg6Q3lAIDw\n/wHoB78BibB0Z/bs1TWzaccsGUJJfPrXkcw9zbnTza0ZY1f4YQVEvLOppscaF2Yt\n4KM1U8R3AgMBAAECggEANz1nK5TpD4V2qaM0ya6pwqCiFcO12Vyf3JD7eGUzPpr7\nNVnEytzuYGGAsoUpVydSZcnnDLsk9a5MpV8oWpb7kIQeBnMA1up0pSruitqxMNlx\nOzPZeBDQo4vol4vN5J9ycTEjEx8rXIid1x8BZAhDDNVLDjNSVW7nfrn+js1qnYxv\n24URNMxU38f0ryda8Ohu4fyRj+bNK7dtM+9lGwEli/XRPJk8J6kTnzzFKyLiNo6j\naHkHWjzYzwcfolDPbVtRuZpeUYKwc1mfVC9f6QGWNp89xwdEUJ1HCY6XRX7gxNrb\nhz65PdUK9SPSAN2Nkak/dO6+4+qGKEtu1heygZjqrQKBgQDLxiTeA8E6IYEpT740\nGek8Q8HIGGU9KZzTltLnSC/xOOiRKQDi+4VuyM3Az3x9wSy4SeiWzL8j1QwG1a1u\nwY3UAB8de0VMHpxE/7M0/jkmjykUmNq/VuCbBAoMGu7RGLKF481m71sind/IgtNk\nzOmGfVkFUUdtWqcf0Vi6xgTqfQKBgQDHqp6Chdht5iecfeh+S6cITWnf6LuE5eD1\nRZpuy6daiURl70SAtnOIw/BoFqZ5FeC3IeWSl/TFC+6/eCh7/ciTrMbp/bAB7MJw\ntdR76uWu0KRoPyMQZdpayKpF63mpGbA3QxNb18ULpwbHgvkBCqEjh7QEW8jL6vh1\nO2Yfl0MpAwKBgC5JwUApbDAvQi7HLXaaWC/XWGKCoCSnmjc6MIhXDoTmH3Yx8UCe\nT+4dcReWSjoqsmTebRYsRlL2Zzf6O95H21bH/ElvIgurfGX0C5pDEWpf5L4IBtCm\nBHlSDpI3X/5hdNQTLipuvq37XMUoaqqgHX/uY1Vg5C/EAuioXlZ2+tDlAoGAJh6M\n5J5pE5I9PcNL/9CxswQUkor8QgMhT7JaKYz4BnDufgeQLIKozBOcckLgxX1Hya7P\nBY29TWFZ03Q9Rm7NPGRgFYw5biSlep88UewmrZlnyf9D0n2fknV9DJxIPeCJpANK\nTt6C4BajVLPMlkZRPVdLJwne7A+QH9GXTbCzQcECgYEAlurSlzSZ14Zas8wP8Xze\nkPB7rwrsf0oprFY6lmNbZz0vo3PFag839JhXq2I54J0Jofn+6a2Qg7b5lxaAKrrk\n5fNRwzxfni70dcJ5EbTsopHLHp1/mQDkW2P9b3OMbBcVMQPVLlXTxqsM8fWqrh71\n1q9O8P6Zc0EJ/ESahF3JPP8=\n-----END PRIVATE KEY-----\n",
  "client_email": "genesispackaging@genesis-packaging-v-1.iam.gserviceaccount.com",
  "client_id": "118224554527244234684",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/genesispackaging%40genesis-packaging-v-1.iam.gserviceaccount.com"
}
  ''';
  static final _spreadsheetId = '13n2NB-qrHTBZN-voLUrkdAvHe-zYwBXhdcfLuytx2-8';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Sheet1');
      final attributes = SalaryReportFields.getFields();
      _userSheet!.values.insertRow(1, attributes);
    } catch (e) {
      print('error in initSheet $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;
    try {
      _userSheet!.values.map.appendRows(rowList);
    } catch (e) {
      print('error in insert $e');
    }
  }

  static Future<int> getRowCount() async {
    if (_userSheet == null) return 0;
    final lastRow = await _userSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
}
