import 'package:html_to_digia/constants/widgets_name.dart';
import 'package:html_to_digia/data/digiafinal_data.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/DG_divider.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_button.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_container.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_grid.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_richtext.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_text.dart';

class WidgetsMapper {
  static UiObjectModelBase? getWidgetClass({required Map data}) {
    String tag = data[typeName] ?? "";

    // FIRST TRY TO MAP WITH DG-WIDGETS
    return switch (tag) {
      p => DgRichTextWidget(figmaHTMLElement: data),
      button => DgButtonWidget(figmaHTMLElement: data),
      h1 || h2 || h3 || h4 || h5 || h6 => DGTextWidget(figmaHTMLElement: data),
      div => handleDiv(data),
      hr => DGDividerWidget(figmaHTMLElement: data),
      _ => null,
    };
  }
}

UiObjectModelBase? handleDiv(Map data) {
  // Divider cases
  if (data.containsKey(content) == false || (data[content] as List).isEmpty) {
    return DGDividerWidget(figmaHTMLElement: data);
  }

  // bases on css-display
  var digastate = DigiaFinalDataState.getInstance();
  var css = digastate.getCompleteCss(
      tag: data[typeName], attribute: data[attributes]);

  String display = css["display"] ?? "block";

  return switch (display) {
    'block' => DGContainerWidget(figmaHTMLElement: data),
    'grid' => DGGridViewWidget(figmaHTMLElement: data),
    _ => null,
  };

  return null;
}
