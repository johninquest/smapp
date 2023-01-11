import 'package:flutter/material.dart';

class PageRouter {
  void navigateToPage(Widget widgetName, BuildContext widgetContext) {
    Navigator.of(widgetContext)
        .push(MaterialPageRoute(builder: (context) => widgetName));
  }

  void navigateToPageWithData(
      Widget widgetName, BuildContext widgetContext, dynamic routedData) {
    Navigator.push(
        widgetContext,
        MaterialPageRoute(
            builder: (context) => widgetName,
            settings: RouteSettings(arguments: routedData)));
  }
}
