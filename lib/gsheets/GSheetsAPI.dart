import 'dart:developer';

import 'package:gsheets/gsheets.dart';

class GSheetsAPI {
  static const _credentials = r'''
{

}
''';
  static final _spreadsheetID = '1g-9Wam3AMLdoxCugd7m8ZHGsaIfv6ncpStXV1h0FplY';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _userSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetID);
      _userSheet = await _getWorkSheet(spreadsheet, title: 'Events');

      final header = ['Title', 'Username', 'Description'];
      _userSheet!.values.insertRow(1, header);
    } catch (e) {
      log('Init Error GSheets: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_userSheet == null) return;

    _userSheet!.values.map.appendRows(rowList);
  }
}
