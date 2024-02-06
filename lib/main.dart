import 'dart:convert';
import 'dart:io';

import 'package:html_to_digia/handler/config_resolver/ui_data_donfig_resolver.dart';
import 'package:html_to_digia/data/digiafinal_data.dart';

void main() async {
  String html = await File('figma_html.json').readAsStringSync();
  Map htmlJson = JsonDecoder().convert(html);

  String css = await File('figma_css.json').readAsStringSync();
  Map cssJson = JsonDecoder().convert(css);
  

  DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();
  digiaFinalDataState.addCssData(cssJson);

  final configResolver = UiDataConfigResolver(data: htmlJson);
  await configResolver.getFinalJsonForDigia();

  Map digiaJson = digiaFinalDataState.getDigiaJson();

  String stringDigia = JsonEncoder().convert(digiaJson);

  await File('digia_output.json').writeAsString(stringDigia);
}


// https://www.udemy.com/course/100-days-of-code/learn/lecture/37435630#questions
