import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/utils/string_utils.dart';
import 'package:html_to_digia/utils/widget_utils.dart';

class DGTextWidget extends UiObjectModelBase {
  DGTextWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');

    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();
    //
    localJson["type"] = "digia/text";
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
    Map completeCss = digiaFinalDataState.getCompleteCss(
      tag: figmaHTMLElement["type"],
      attribute: figmaHTMLElement["attributes"],
    );

    Map propsData = {
      "type": "object",
    };

    Map data = {};

    // TEXT
    String concatText =
        WidgetUtils.getSingleStringFromNestedContent(content: figmaHTMLElement);
    data["text"] = {
      "type": "string",
      "data": concatText,
    };

    // MAXLINES

    // OVERFLOW

    // ALIGNMENT

    data["alignment"] = {
      "type": "string",
      "data": completeCss["text-align"] ?? "center",
    };
    // TEXTSTYLE
    data["textStyle"] = getTextStyle(cssatt: completeCss);

    propsData["data"] = data;
    return propsData;
  }

  Map getTextStyle({required Map cssatt}) {
    Map textstyle = {
      "type": "object",
    };

    Map data = {};

    data["textColor"] = {
      "type": "string",
      "data": cssatt["color"] ?? "#000000",
    };

    data["textBgColor"] = {
      "type": "string",
      "data": cssatt["background-color"] ?? "#FFFFFF",
    };

    data["textDecoration"] = {
      "type": "string",
      "data": cssatt["text-decoration"] ?? "none",
    };
    data["textDecorationColor"] = {
      "type": "string",
      "data": cssatt["text-decoration-color"] ?? "none",
    };
    data["fontSize"] = {
      "type": "number",
      "data": StringUtils.extractNumber(cssatt["font-size"]) ?? "",
    };
    data["fontWeight"] = {
      "type": "string",
      "data": cssatt["font-weight"] ?? "",
    };
    // data[""] = {
    //   "type": "string",
    //   "data": cssatt[""] ?? "",
    // };
    textstyle["data"] = data;
    return textstyle;
  }

  @override
  Map? addDefaultPropsData(DigiaFinalDataState digiaFinalDataState) {
    Map? defaultPropData = {};
    return defaultPropData;
  }
}

final dgtext = {
  "type": "digia/text",
  "id": "1xsd6tZGXc",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "text": {"type": "string", "data": "Figma To Digia Text"},
      "maxLines": {"type": "number", "data": 2},
      "overflow": {"type": "string", "data": "clip"},
      "alignment": {"type": "string", "data": "center"},
      "textStyle": {
        "type": "object",
        "data": {
          "fontToken": {"type": "string", "data": "headlineMedium"},
          "textColor": {"type": "string", "data": "#B92222"},
          "textBgColor": {"type": "string", "data": "#44484E"},
          "textDecoration": {"type": "string", "data": "underline"},
          "textDecorationColor": {"type": "string", "data": "#57636C"},
          "textDecorationStyle": {"type": "string", "data": "solid"}
        }
      }
    }
  },
  "defaultPropData": null,
  "children": [],
  "dataRef": null
};

var htagcss = {
  "color": "#e44d26",
  "font-size": "2.5em",
  "font-weight": "normal",
  "font-style": "normal",
  "text-align": "left",
  "text-decoration": "none",
  "line-height": "1.5",
  "letter-spacing": "1px",
  "margin": "20px",
  "padding": "10px",
  "background-color": "#f8f9fa"
};






// <-------------------- for h1, h2, h3.. (digia/text) ------------------------------->

var h_css = '''
h1 {
  color: #007BFF; /* Text color */
  font-size: 2em; /* Font size */
  font-weight: bold; /* Font weight */
  font-style: italic; /* Font style */
  text-align: center; /* Text alignment */
  text-decoration: underline; /* Text decoration */
  line-height: 1.2; /* Line height */
  letter-spacing: 2px; /* Letter spacing */
  margin: 10px; /* Margin */
  padding: 15px; /* Padding */
  background-color: #f0f0f0; /* Background color */
}
''';

var h_html = '''
<h1 style="color: #e44d26; font-size: 2.5em; font-weight: normal; font-style: normal; text-align: left; text-decoration: none; line-height: 1.5; letter-spacing: 1px; margin: 20px; padding: 10px; background-color: #f8f9fa;">
Updated Heading with Inline CSS
</h1>
`;
// <------------------------------- div --------------------------------------->
var div_html = `<html>
<head>
<style>
ul.a {
  list-style-type: circle;
}

ul.b {
  list-style-type: square;
}

ol.c {
  list-style-type: upper-roman;
}

ol.d {
  list-style-type: lower-alpha;
}
</style>
</head>
<body>

<h2>The list-style-type Property</h2>

<p>Example of unordered lists:</p>
<ul class="a">
  <li>Coffee</li>
  <li>Tea</li>
  <li>Coca Cola</li>
</ul>

<ul class="b">
  <li>Coffee</li>
  <li>Tea</li>
  <li>Coca Cola</li>
  <div>Item 1</div>
</ul>
<div class="flex-container">
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
  <div>
    <div>Item 1</div>
    <div>Item 2</div>
    <div>Item 3</div>
    <div>
      <div>Item 1</div>
      <div>Item 2</div>
      <div>Item 3</div>
  </div>
  </div>
</div>

<p>Example of ordered lists:</p>
<ol class="c">
  <li>Coffee</li>
  <li>Tea</li>
  <li>Coca Cola</li>
</ol>

<ol class="d">
  <li>Coffee</li>
  <li>Tea</li>
  <li>Coca Cola</li>
</ol>

</body>
</html>
''';
