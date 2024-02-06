import 'dart:core';
import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_text.dart';
import 'package:html_to_digia/utils/css_utils.dart';

class DgButtonWidget extends UiObjectModelBase {
  DgButtonWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};

    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();
    //
    localJson["type"] = "digia/button";
    localJson["propData"] = addPropsData(digiaFinalDataState);
    localJson["defaultPropData"] = addDefaultPropsData(digiaFinalDataState);
    localJson["children"] = [];
    localJson["dataRef"] = null;
    //
    String id = digiaFinalDataState.addDigiaComponent(component: localJson);

    return id;
  }

  @override
  Map addPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map completeCss = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement["attributes"],
    );

    Map propdata = {
      "type": "object",
    };

    Map data = {};
    // style
    data["style"] = _getButtonStyle(completeCss);
    // text
    data["text"] = DGTextWidget(figmaHTMLElement: figmaHTMLElement)
        .addPropsData(digiaFinalDataState);
    // StringUtils.prettyPrint(data);

    // onClick
    data["onClick"] = {
      "type": "action",
      "data": null,
    };
    propdata["data"] = data;
    return propdata;
  }

  Map _getButtonStyle(Map css) {

    Map buttonStyle = {
      "type": "object",
    };

    Map data = {};

    // padding
    data["padding"] = {
      "type": "string",
      "data": CssUtils.getPadding(css["padding"] ?? "10px 10px"),
    };

    // borderradius
    data["borderRadius"] = {
      "type": "string",
      "data": css["border-radius"],
    };

    // bgcolor
    data["bgColor"] = {
      "type": "string",
      "data": css["background-color"],
    };

    // margin
    data["margin"] = {
      "type": "string",
      "data": CssUtils.getPadding(css["margin"] ?? "10px 10px"),
    };

    buttonStyle["data"] = data;
    return buttonStyle;
  }


  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map defaultdata = {};

    return defaultdata;
  }
}

final dgbutton = {
  "type": "digia/button",
  "id": "ipEtbk7rRe",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "style": {
        "type": "object",
        "data": {
          "padding": {"type": "string", "data": "12,6,12,6"},
          "borderRadius": {"type": "string", "data": "100,100,100,100"},
          "bgColor": {"type": "string", "data": "#FF45B6"},
          "margin": {"type": "string", "data": "0,16,0,0"}
        }
      },
      "text": {
        "type": "object",
        "data": {
          "textStyle": {
            "type": "object",
            "data": {
              "fontToken": {"type": "string", "data": "titleMedium"},
              "textColor": {"type": "string", "data": "#FFFFFF"},
              "textBgColor": {"type": "string", "data": ""},
              "textDecoration": {"type": "string", "data": "none"},
              "textDecorationColor": {"type": "string", "data": null},
              "textDecorationStyle": {"type": "string", "data": null}
            }
          },
          "text": {"type": "string", "data": "Sign In with google "},
          "maxLines": {"type": "number", "data": 1},
          "alignment": {"type": "string", "data": "center"}
        }
      },
      "onClick": {"type": "action", "data": null}
    }
  }
};

var html_button = '''
<button type="button" class="custom-button">Click me</button>
''';

var button_css = '''
.custom-button {
      display: inline-block;
      padding: 10px 20px;
      font-size: 16px;
      font-weight: bold;
      text-align: center;
      text-decoration: none;
      cursor: pointer;
      border: 2px solid #3498db;
      color: #fff;
      background-color: #3498db;
      border-radius: 5px;
      transition: background-color 0.3s ease, color 0.3s ease, border-color 0.3s ease;
    }
''';
