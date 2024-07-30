import 'package:flutter/material.dart';

class Go {
  const Go._();

  static MaterialPageRoute _route(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
  // Go to next page
  static void to(BuildContext ctx, Widget page) =>
      Navigator.push(ctx, _route(page));
  // Go to next page and replace
  static void replace(BuildContext ctx, Widget page) =>
      Navigator.pushReplacement(ctx, _route(page));
  // Go to target page and close all pages from background
  static void removeAll(BuildContext context, Widget page) =>
      Navigator.pushAndRemoveUntil(context, _route(page), (_) => false);
  // Go to back page
  static Future<void> back(BuildContext ctx) async => Navigator.of(ctx).pop();
}
