import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/utils/css_utils.dart';
import 'package:html_to_digia/utils/string_utils.dart';

class DGDividerWidget extends UiObjectModelBase {
  DGDividerWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');
    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();

    Map css = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement["attributes"],
    );

    bool horizon = isHorizontalDivider(css);
    //
    localJson["type"] =
        "digia/${horizon ? "horizontalDivider" : "verticalDivider"}";
    localJson["propData"] = addPropsData(digiaFinalDataState);
    localJson["defaultPropData"] = addDefaultPropsData(digiaFinalDataState);
    localJson["children"] = [];
    localJson["dataRef"] = null;
    //

    // print(digiaFinalDataState.getCompleteCss(tag: figmaHTMLElement["type"]));

    String id = digiaFinalDataState.addDigiaComponent(component: localJson);

    return id;
  }

  bool isHorizontalDivider(Map css) {
    if (css.isEmpty) {
      return true;
    }

    if (css.containsKey("width")) {
      int val = StringUtils.extractNumber(css["width"])!.toInt();
      if (val == 100) {
        return true;
      }
    }

    return false;
  }

  @override
  Map addPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map css = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement["attributes"],
    );

    bool horizon = isHorizontalDivider(css);

    css.addAll(overrideBorder(css["border"]));

    Map propsData = {
      "type": "object",
    };

    Map data = {};

    data["lineStyle"] = {
      "type": "string",
      "data": css["border-style"],
    };
    data["color"] = {
      "type": "string",
      "data": css["border-color"] ?? css["background-color"] ?? "#000000",
    };
    data["thickness"] = {
      "type": "number",
      "data": StringUtils.extractNumber(css["border-width"]) ??
          StringUtils.extractNumber(css["width"]),
    };

    String dimenName = horizon ? "height" : "width" ; 
    data[dimenName] = {
      "type": "number",
      "data": StringUtils.extractNumber(css[dimenName]),
    };

    String? indent = CssUtils.getPadding(css["margin"] ?? css["padding"]);
    List<String> indents = ["4", "4"];
    if (indent != null) {
      indents = indent.split(",");
    }

    data["indent"] = {
      "type": "number",
      "data": indents[0],
    };
    data["endIndent"] = {
      "type": "number",
      "data": indents[1],
    };

    propsData["data"] = data;
    return propsData;
  }

  Map overrideBorder(String? border) {
    Map overrides = {};
    if (border == null) return overrides;

    // border-left: 2px solid black; height
    List<String> borderdata = border.split(" ");

    if (borderdata.length == 1) {
      overrides["width"] = {
        "type": "number",
        "data": StringUtils.extractNumber(borderdata[0]),
      };
    }
    if (borderdata.length == 2) {
      overrides["lineStyle"] = {
        "type": "string",
        "data": borderdata[1],
      };
    }
    if (borderdata.length == 3) {
      overrides["color"] = {
        "type": "string",
        "data": borderdata[2],
      };
    }

    return overrides;
  }

  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map? defaultPropData = {};
    return defaultPropData;
  }
}

var divider = {
  "horizontalDivider": {
    "type": "digia/horizontalDivider",
    "id": "9Cd4o8G92i",
    "parent": "agwb55kgRV",
    "propData": {
      "type": "object",
      "data": {
        "lineStyle": {"type": "string", "data": "solid"},
        "color": {"type": "string", "data": "#DE2727"},
        "thickness": {"type": "number", "data": 10},
        "height": {"type": "number", "data": 10},
        "indent": {"type": "number", "data": null},
        "endIndent": {"type": "number", "data": null}
      }
    },
    "defaultPropData": null,
    "children": [],
    "dataRef": null
  },
  "verticalDivider": {
    "type": "digia/verticalDivider",
    "id": "6meaFDf5eG",
    "parent": "agwb55kgRV",
    "propData": {
      "type": "object",
      "data": {
        "lineStyle": {"type": "string", "data": "solid"},
        "color": {"type": "string", "data": "#41D728"},
        "thickness": {"type": "number", "data": 10},
        "width": {"type": "number", "data": 10},
        "indent": {"type": "number", "data": null},
        "endIndent": {"type": "number", "data": null}
      }
    },
    "defaultPropData": null,
    "children": [],
    "dataRef": null
  },
};

var cssdivider = {
  "vert": {
    "width": "1px",
    "height": "100%",
    "background-color": "#000",
    "margin": "0 10px",
    "padding": "0",
//
    "border": "none",
    "border-width": "1px",
    "border-style": "solid",
    "border-color": "#000",
//
    "box-shadow": "none",
    "position": "relative",
    "display": "block",
  },
  "hori": {
    "width": "100%",
    "height": "1px",
    "background-color": "#000",
    "margin": "10px 0",
    "padding": "0",
    "border": "none",
    "border-width": "1px",
    "border-style": "solid",
    "border-color": "#000",
    "box-shadow": "none",
    "position": "relative",
    "display": "block",
  }
};
