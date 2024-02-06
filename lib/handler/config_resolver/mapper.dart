import 'package:html_to_digia/constants/widgets_name.dart';
import 'package:html_to_digia/handler/models/ui_object_base_class.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_button.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_richtext.dart';
import 'package:html_to_digia/handler/widgets/digia_widgets/dg_text.dart';

class WidgetsMapper {
  static UiObjectModelBase? getWidgetClass({required Map data}) {
    String tag = data["type"] ?? "";

    // FIRST TRY TO MAP WITH DG-WIDGETS
    return switch (tag) {
      p => DgRichTextWidget(figmaHTMLElement: data),
      button => DgButtonWidget(figmaHTMLElement: data),
      h1 || h2 || h3 || h4 || h5 || h6 => DGTextWidget(figmaHTMLElement: data),
      _ => null,
    };
  }
}
