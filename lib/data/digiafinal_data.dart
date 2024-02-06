import 'package:html_to_digia/utils/widget_utils.dart';
import 'package:uuid/uuid.dart';

class DigiaFinalDataState {
  static DigiaFinalDataState? _instance;
  late final Map _finalDigiaJson;
  Map? _cssjson;

  DigiaFinalDataState._() {
    _finalDigiaJson = {};
  }

  static DigiaFinalDataState getInstance() {
    _instance ??= DigiaFinalDataState._();

    return _instance!;
  }

  // <----------------  FinalDigiaJson ---------------------->

  Map getDigiaJson() => {..._finalDigiaJson};

  String addDigiaComponent({required Map component}) {
    String id = Uuid().v1();

    _finalDigiaJson[id] = component;

    return id;
  }

  // <----------------  HTML ---------------------->

  // <----------------  CSS ---------------------->
  Future<void> addCssData(Map json) async {
    _cssjson = json;
  }

  Map getCompleteCss({required String tag, Map? attribute}) {
    Map completecss = {};

    if (_cssjson == null || _cssjson!.isEmpty) return completecss;

    Map cssjson = _cssjson ?? {};
    // * UNIVERSAL CSS
    if (cssjson.containsKey("*")) {
      String name = cssjson["*"];
      Map universalattr = cssjson[name];
      completecss.addAll(universalattr);
    }

    // FING GLOBAL TAG CSS
    if (cssjson.containsKey(tag)) {
      Map? tagcss = cssjson[tag];
      if (tagcss != null) completecss.addAll(tagcss);
    }

    if (attribute == null || attribute.isEmpty) return completecss;

    // MERGE CLASS BASED CSS IF ANY
    if (attribute.containsKey("class")) {
      String classname = '.'+attribute["class"];
      Map? classattr = cssjson[classname];
      if (classattr != null) completecss.addAll(classattr);
    }

    // MERGE ID BASED CSS IF ANY
    if (attribute.containsKey("id")) {
      String idname = attribute["id"];
      Map? idattr = cssjson[idname];
      if (idattr != null) completecss.addAll(idattr);
    }

   // MERGE ID BASED CSS IF ANY
    if (attribute.containsKey("style")) {
      String style = attribute["style"];
      Map idattr = WidgetUtils.inlineStyleAttToCssJson(style: style);
      completecss.addAll(idattr);
    }

    return completecss;
  }
}
