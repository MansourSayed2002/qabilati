import 'package:flutter/material.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardNotifiWidget extends StatelessWidget {
  const CardNotifiWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.notifications),
      title: Text(title, style: getBodyStyle(context: context)),
      subtitle: Text(subtitle, style: getSmallStyle()),
    );
  }
}
