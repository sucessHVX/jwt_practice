import 'dart:convert';

dynamic convertUtf8ToObject(dynamic body) {
  String responseBody = jsonEncode(body); //다시 json 데이터로 변경
  dynamic convertBody = jsonDecode(utf8.decode(responseBody.codeUnits));
  return convertBody;
}
