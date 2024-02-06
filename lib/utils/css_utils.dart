import 'package:html_to_digia/utils/string_utils.dart';

class CssUtils {
  static String? getPadding(String? padding) {
    if (padding == null) return null;
    // padding = "10px";
    String dgpadding = "";
    List<String> ps = padding.split(" ");

    int multiplier = 0;
    if (ps.length == 1) {
      multiplier = 3;
    } else if (ps.length == 2) {
      multiplier = 1;
    } else if (ps.length == 3) {
      ps.add(ps[0]);
    }

    List<String> fourDimenPadding = [...ps];

    for (int i = 0; i < multiplier; i++) {
      fourDimenPadding.addAll([...ps]);
    }

    for (int i = 0; i < fourDimenPadding.length; i++) {
      double? numpad = StringUtils.extractNumber(fourDimenPadding[i]);

      if (numpad == null) continue;

      dgpadding += numpad.toString();
      if (i < fourDimenPadding.length - 1) {
        dgpadding += ',';
      }
    }

    return dgpadding;
  }
}
