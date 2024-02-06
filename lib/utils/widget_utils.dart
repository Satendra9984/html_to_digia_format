
class WidgetUtils {
  static String getSingleStringFromNestedContent({required dynamic content}) {
    String singleString = "";
    if (content.containsKey("content") == false) return singleString;

    for (dynamic innercontent in content["content"]) {
      // print('inner: $innercontent');
      if (innercontent.runtimeType == "".runtimeType) {
        singleString += innercontent;
        continue;
      }

      Map itsamap = Map.from(innercontent);

      if (itsamap.containsKey("type") && itsamap["type"] == "br") {
        singleString += "\n";
        continue;
      }

      String recursiveString =
          getSingleStringFromNestedContent(content: innercontent);

      // print("recursive: $recursiveString");

      singleString += recursiveString;
    }

    return singleString;
  }

  static Map inlineStyleAttToCssJson({String? style}) {
    Map styleMap = {};
    if (style == null) return styleMap;

    style =
        "color: #e44d26; font-size: 2.5em; font-weight: normal; font-style: normal; text-align: left; text-decoration: none; line-height: 1.5; letter-spacing: 1px; margin: 20px; padding: 10px; background-color: #f8f9fa;";

    List<String> stylePairList = style.split(";");
    stylePairList.removeLast();

    for (String stylePair in stylePairList) {
      // print('stylePair: $stylePair');
      List<String> pair = stylePair.split(":");
      String key = pair[0].trim();
      String value = pair[1].trim();

      styleMap[key] = value;
    }

    // StringUtils.prettyPrint(styleMap);
    return styleMap;
  }
}
