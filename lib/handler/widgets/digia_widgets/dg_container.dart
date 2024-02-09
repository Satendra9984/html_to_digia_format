import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';

class DGContainerWidget extends UiObjectModelBase {
  DGContainerWidget({required super.figmaHTMLElement});

  @override
  String handleDigiaWidget() {
    Map localJson = {};
    // print('Richtext: ${this.figmaHTMLElement}');
    DigiaFinalDataState digiaFinalDataState = DigiaFinalDataState.getInstance();

    //
    localJson["type"] = "digia/container";
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
}

var fg = {
  "type": "digia/container",
  "id": "cO8RuxCpn5",
  "parent": "agwb55kgRV",
  "propData": {
    "type": "object",
    "data": {
      "width": {"type": "string", "data": "100%"},
      "height": {"type": "string", "data": "50"},
      "maxHeight": {"type": "string", "data": "50"},
      "minHeight": {"type": "string", "data": "50"},
      "maxWidth": {"type": "string", "data": "100%"},
      "MinWidth": {"type": "string", "data": "100%"},
      "shape": {"type": "string", "data": "circle"},
      "childAlignment": {"type": "string", "data": "center"},
      "margin": {"type": "string", "data": "8,0,8,0"},
      "padding": {"type": "string", "data": "8,8,8,8"},
      "color": {"type": "string", "data": "#39D26E"},
      "border": {
        "type": "object",
        "data": {
          "borderRadius": {"type": "string", "data": "0,0,0,0"},
          "borderWidthStr": {"type": "string", "data": null},
          "borderColor": {"type": "string", "data": "#ABABAB"}
        }
      },
      "decorationImage": {
        "type": "object",
        "data": {
          "source": {"type": "string", "data": null},
          "opacity": {"type": "number", "data": 1},
          "fit": {"type": "object", "data": null},
          "alignment": {"type": "string", "data": "none"}
        }
      }
    }
  },
  "defaultPropData": null,
  "children": [],
  "dataRef": null
};
