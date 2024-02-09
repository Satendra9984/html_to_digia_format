import 'package:html_to_digia/constants/widgets_name.dart';
import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/config_resolver/mapper.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/utils/string_utils.dart';

class DGGridViewWidget extends UiObjectModelBase {
  DGGridViewWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');
    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();

    //
    localJson["type"] = "digia/grid";
    localJson["propData"] = addPropsData(digiaFinalDataState);
    localJson["defaultPropData"] = addDefaultPropsData(digiaFinalDataState);
    localJson["children"] = getchildren();
    localJson["dataRef"] = {"datum": "[  ]", "kind": "json"};
    //

    // print(digiaFinalDataState.getCompleteCss(tag: figmaHTMLElement["type"]));

    String id = digiaFinalDataState.addDigiaComponent(component: localJson);

    return id;
  }

  @override
  Map addPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map css = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement[attributes],
    );
    Map propsData = {
      "type": "object",
    };

    Map data = {};

    /*
      "allowScroll": {"type": "bool", "data": true},
      "shrinkWrap": {"type": "bool", "data": true},
      "crossAxisCount": {"type": "number", "data": 2},
      "crossAxisSpacing": {"type": "number", "data": 2},
      "mainAxisSpacing": {"type": "number", "data": 2},
      "childAspectRatio": {"type": "number", "data": 2} 
   */

    data["allowScroll"] = {
      "type": "bool",
      "data": "",
    };
    data["shrinkWrap"] = {
      "type": "bool",
      "data": "",
    };
    data["crossAxisCount"] = {
      "type": "number",
      "data": null,
    };
    data["crossAxisSpacing"] = {
      "type": "number",
      "data": StringUtils.extractNumber(css["grid-row-gap"] ?? css["grid-gap"]),
    };
    data["mainAxisSpacing"] = {
      "type": "number",
      "data": StringUtils.extractNumber(
          css["grid-column-gap"] ?? css["grid-row-gap"]),
    };
    data["childAspectRatio"] = {
      "type": "number",
      "data": "",
    };

    // layout data
    Map layoutDataCol = extractColumnSizes(css["grid-template-columns"]);
    Map layoutDataRow = extractColumnSizes(css["grid-template-rows"]);

    data["childAspectRatio"] = {
      "type": "number",
      "data": layoutDataCol["childAspectRatio"] ?? 1,
    };

    data.addAll(layoutDataRow);

    propsData["data"] = data;
    return propsData;
  }

  List<String> getchildren() {
    List<dynamic> children = figmaHTMLElement[content] ?? [];
    List<String> childIds = [];
    for (dynamic child in children) {
      UiObjectModelBase? childclass = WidgetsMapper.getWidgetClass(data: child);

      if (childclass == null) continue;

      String childId = childclass.handleDigiaWidget();
      childIds.add(childId);
    }

    return childIds;
  }

  Map extractColumnSizes(String gridTemplateColumns) {
    Map sizes = {};

    // Split the value by whitespace or comma
    List<String> columns = gridTemplateColumns.split(RegExp(r'\s+|,'));
    // String gridTemplateColumns = 'grid-template-columns: repeat(3, 100px) 1fr auto;';

    for (String column in columns) {
      // Extract numerical value and unit (if any)
      RegExpMatch? match = RegExp(r'(\d+)(\w*)').firstMatch(column);
      if (match != null) {
        String value = match.group(1)!;
        String unit = match.group(2) ?? '';
        sizes["crossAxisCount"] = int.tryParse(value) ?? null;
        sizes["childAspectRatio"] = int.tryParse(unit) ?? 1;
      }
    }

    return sizes;
  }

  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map? defaultPropData = {};
    return defaultPropData;
  }
}

var dg = {
  "type": "digia/gridView",
  "id": "wfux0kZFrd",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "allowScroll": {"type": "bool", "data": true},
      "shrinkWrap": {"type": "bool", "data": true},
      "crossAxisCount": {"type": "number", "data": 2},
      "crossAxisSpacing": {"type": "number", "data": 2},
      "mainAxisSpacing": {"type": "number", "data": 2},
      "childAspectRatio": {"type": "number", "data": 2}
    }
  },
  "defaultPropData": null,
  "children": ["0efd2DlAVF", "gV3lqBGNWb", "MNekmAbkeO"],
  "dataRef": {"datum": "[  ]", "kind": "json"}
};


/*

{
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(100px, 1fr)); /* Automatically adjust columns */
  grid-auto-rows: 100px; /* Define height for rows */
  grid-gap: 10px; /* Define gap between grid items */
  grid-template-areas: 
    "header header header"
    "sidebar main main"
    "sidebar footer footer"; /* Define grid areas */
  justify-items: center; /* Align items along the inline (row) axis */
  align-items: center; /* Align items along the block (column) axis */
  justify-content: center; /* Align content along the inline (row) axis */
  align-content: center; /* Align content along the block (column) axis */
  grid-row-gap: 20px; /* Spacing between rows */
  grid-column-gap: 20px; /* Spacing between columns */
}

*/
