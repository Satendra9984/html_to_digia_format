import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/config_resolver/mapper.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';

class DGColumnWidget extends UiObjectModelBase {
  DGColumnWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');
    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();

    //
    localJson["type"] = "digia/richText";
    localJson["propData"] = addPropsData(digiaFinalDataState);
    localJson["defaultPropData"] = addDefaultPropsData(digiaFinalDataState);
    localJson["children"] = addChildren(digiaFinalDataState);
    localJson["dataRef"] = null;
    //

    // print(digiaFinalDataState.getCompleteCss(tag: figmaHTMLElement["type"]));

    String id = digiaFinalDataState.addDigiaComponent(component: localJson);

    return id;
  }

  @override
  Map addPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map propsData = {
      "type": "object",
    };

    Map data = {};

    propsData["data"] = data;
    return propsData;
  }

  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map? defaultPropData = {};
    return defaultPropData;
  }

  List addChildren(DigiaFinalDataState digiaFinalDataState) {
    List content = figmaHTMLElement["content"];

    List<String> children = [];

    for (var child in content) {
      UiObjectModelBase? childClass = WidgetsMapper.getWidgetClass(data: child);

      if (childClass == null) continue;

      String childId = childClass.handleDigiaWidget();
      children.add(childId);
    }

    return children;
  }
}

var dgc = {
  "type": "digia/column",
  "id": "agwb55kgRV",
  "parent": null,
  "propData": {
    "type": "object",
    "data": {
      "mainAxisAlignment": {"type": "object", "data": null},
      "crossAxisAlignment": {"type": "string", "data": "start"}
    }
  },
  "defaultPropData": {
    "type": "object",
    "data": {
      "visibility": {"type": "bool", "data": true},
      "align": {"type": "string", "data": "none"},
      "style": {
        "type": "object",
        "data": {
          "padding": {"type": "string", "data": "12,0,12,0"}
        }
      },
      "onClick": {"type": "action", "data": null}
    }
  },
  "children": [
    "lXZqS8n1te",
    "HFkfP7EwJi",
    "ipEtbk7rRe",
    "QlFXqaMMoM",
    "DO4qfRmM7U"
  ],
  "dataRef": {"datum": "[]", "kind": "json"}
};
