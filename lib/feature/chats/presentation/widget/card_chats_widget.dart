import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardChatsWidget extends StatelessWidget {
  const CardChatsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48.0.w,
        height: 48.0.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0.r),
          image: DecorationImage(image: AssetImage(image)),
        ),
      ),
      title: Text(
        title,
        style: getBodyStyle(fontSize: 17.0.sp, context: context),
      ),
      subtitle: Text(subtitle, style: getSmallStyle()),
    );
  }
}
