import 'dart:convert';
import 'dart:io';
import 'package:html_to_digia/handler/config_resolver/mapper.dart';
import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';

class UiDataConfigResolver {
  final Map data;
  late final DigiaFinalDataState digiaFinalDataState;
  UiDataConfigResolver({required this.data}) {
    this.digiaFinalDataState = DigiaFinalDataState.getInstance();
  }

  /// Here the final Json Will be returned for Digia-Dashboard to use
  Future<Map?> getFinalJsonForDigia() async {
    _handleData();
    // csshandle();
    // return {..._finalDigiaJson};

  }

  void _handleData() async {

    // List child = (data["content"] as List).first;
    String type = data["type"];
    print("type: ${type},");

    UiObjectModelBase? childClass = WidgetsMapper.getWidgetClass(
      data: data,
    );

    if (childClass == null) return;

    String id = childClass.handleDigiaWidget();
  }
}

void main() async {
  final configResolver = UiDataConfigResolver(data: {});
  Map? finalJsonForDigia = await configResolver.getFinalJsonForDigia();
  await File('final_figma.json').writeAsString(jsonEncode(finalJsonForDigia));
}
