import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/utils/widget_utils.dart';

class DgRichTextWidget extends UiObjectModelBase {
  DgRichTextWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');

    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();
    //
    localJson["type"] = "digia/richText";
    localJson["propData"] = addPropsData(digiaFinalDataState);
    localJson["defaultPropData"] = addDefaultPropsData(digiaFinalDataState);
    localJson["children"] = [];
    localJson["dataRef"] = null;
    //

    // print(digiaFinalDataState.getCompleteCss(tag: figmaHTMLElement["type"]));

    String id = digiaFinalDataState.addDigiaComponent(component: localJson);

    return id;
  }

  @override
  Map addPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map parentElementCss = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement["attributes"],
    );

    Map propsData = {
      "type": "object",
    };

    Map data = {};

    data["textSpans"] = _getTextSpansList(
      digiaFinalDataState: digiaFinalDataState,
      parentElementCss: parentElementCss,
    );
    // MAXLINES
    data["maxLines"] = _getMaxLines(attributes: parentElementCss);
    // OVERFLOW
    data["overflow"] = _getOverflow(attributes: parentElementCss);
    // ALIGNMENT
    data["alignment"] = _getAlignment(attributes: parentElementCss);
    // TEXTSTYLE
    data["textStyle"] = _getTextstyle(attributes: parentElementCss);

    propsData["data"] = data;
    return propsData;
  }

  Map _getTextSpansList({
    required DigiaFinalDataState digiaFinalDataState,
    required Map parentElementCss,
  }) {
    // TEXTSPANS
    Map textSpans = {
      "type": "array",
    };
    List<Map> textSpansDataList = [];

    // String pt = figmaHTMLElement.text;
    List<dynamic> plist = figmaHTMLElement["content"];

    for (dynamic pc in plist) {
      String text = "";
      Map? attributes = parentElementCss;
      Map? textSpan = {};

      if (pc.runtimeType == "".runtimeType) {
        // SIMPLY EXTRACT DATA WITH PARENT CSS
        text = pc;
      } else {
        // IT IS A MAP EXTRACT CSS WITH PARENT CSS
        // text = (pc["content"] as List?).toString();
        text = WidgetUtils.getSingleStringFromNestedContent(
            content:
                pc); // as we are only going one level nested in paragraph so accessing all the text there
        attributes = digiaFinalDataState.getCompleteCss(
          tag: pc["type"],
          attribute: pc["attributes"] ?? parentElementCss,
        );
      }

      attributes.isEmpty == true ? attributes = parentElementCss : attributes;
      textSpan = _getTextSpan(attributes: attributes, rootText: text);

      // print("${textSpan}\n");
      textSpansDataList.add(textSpan);
    }

    textSpans["data"] = textSpansDataList;

    return textSpans;
  }

  Map _getTextSpan({required Map attributes, required String rootText}) {
    // print('attributes $attributes');
    Map textSpan = {
      "type": "object",
    };

    Map spandata = {};
    spandata["text"] = {"type": "string", "data": "${rootText}"};

    Map spanstyle = {
      "type": "object",
    };

    Map spanstyledata = {};
    spanstyledata["textColor"] = {
      "type": "string",
      "data": attributes["color"] ?? "#101213",
    };
    spanstyle["data"] = spanstyledata;
    spandata["spanStyle"] = spanstyle;
    textSpan["data"] = spandata;

    return textSpan;
  }

  Map _getMaxLines({required Map attributes}) {
    Map data = {};
    return data;
  }

  Map _getOverflow({required Map attributes}) {
    Map data = {};
    return data;
  }

  Map _getAlignment({required Map attributes}) {
    Map data = {};
    return data;
  }

  Map _getTextstyle({required Map attributes}) {
    Map data = {};
    return data;
  }

  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map? defaultPropData = {};
    defaultPropData = {
      "type": "object",
      "data": {
        "visibility": {"type": "bool", "data": true},
        "align": {"type": "string", "data": "none"},
        "style": {
          "type": "object",
          "data": {
            "margin": {"type": "string", "data": "0,12,0,12"}
          }
        },
        "onClick": {"type": "action", "data": null}
      }
    };
    return defaultPropData;
  }
}

final dgj = {
  "type": "digia/richText",
  "id": "lXZqS8n1te",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "textSpans": {
        "type": "array",
        "data": [
          {
            "type": "object",
            "data": {
              "text": {"type": "string", "data": "Hey! "},
              "spanStyle": {
                "type": "object",
                "data": {
                  "fontToken": {"type": "string", "data": "displayLarge"},
                  "textColor": {"type": "string", "data": "#101213"}
                }
              }
            }
          },
          {
            "type": "object",
            "data": {
              "text": {"type": "string", "data": "Welcome To Digia"},
              "spanStyle": {
                "type": "object",
                "data": {
                  "fontToken": {"type": "string", "data": "displayLarge"},
                  "textColor": {"type": "string", "data": "#4945FF"},
                }
              }
            }
          }
        ]
      },
      "maxLines": {"type": "number", "data": null},
      "overflow": {"type": "string", "data": "clip"},
      "alignment": {"type": "string", "data": "start"},
      "textStyle": {
        "type": "object",
        "data": {
          "fontToken": {"type": "string", "data": "titleLarge"}
        }
      }
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
          "margin": {"type": "string", "data": "0,12,0,12"}
        }
      },
      "onClick": {"type": "action", "data": null}
    }
  },
  "children": [],
  "dataRef": null
};



// var css = `
// body {font-family: Arial, sans-serif;background-color: #f0f0f0;margin: 0;padding: 0;}header {background-color: #333;color: #fff;padding: 10px;text-align: center;}main {max-width: 800px;margin: 20px auto;padding: 20px;background-color: #fff;box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);}p {line-height: 1.5;color: #333;}
// `;

// var html = `
// <p class="pclass">This is a paragraph with <br/> a line break. Another paragraph with <a href="https://www.example.com" id="anchor" class="anc">an anchor link</a> Yet another paragraph with <em>emphasized text</em>.</p>
// `;

// var css = `
// p {
//     font-family: 'Arial', sans-serif;
//     font-size: 16px;
//     line-height: 1.5;
//     color: #333;
//     background-color: #f0f8ff; /* AliceBlue */
//     padding: 10px;
//     margin: 10px 0;
//     text-align: center;
//     font-style: italic;
//     font-weight: bold;
//     text-decoration: underline;
//     letter-spacing: 1px;
//     word-spacing: 2px;
//     text-transform: uppercase;
//     border: 1px solid #ccc;
//     box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
//   }`
// ;