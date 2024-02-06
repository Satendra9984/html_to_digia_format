import 'package:html_to_digia/data/digiafinal_data.dart';

abstract class UiObjectModelBase {
  final Map figmaHTMLElement;
  // final Map finalDigiaWidgetGlobalJson;

  UiObjectModelBase({
    required this.figmaHTMLElement,
  });

  String handleDigiaWidget();
  Map addPropsData(DigiaFinalDataState dataState);
  Map? addDefaultPropsData(DigiaFinalDataState dataState);
}
