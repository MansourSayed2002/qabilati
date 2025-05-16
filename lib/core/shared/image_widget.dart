import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/cupertino_model_popup.dart';
import 'package:qabilati/core/function/image_picker.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String? image;
  var controller = getIt<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.cupertinoModelPopup(
          widget: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  image = await imagePicker(false);
                  controller.pathImage = image;
                  setState(() {});
                },

                child: Text(
                  S.of(context).camera,
                  style: getBodyStyle(context: context),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  image = await imagePicker(true);
                  controller.pathImage = image;
                  setState(() {});
                },
                child: Text(
                  S.of(context).gallery,
                  style: getBodyStyle(context: context),
                ),
              ),
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: 100.0,
        backgroundColor: ColorApp.peach,
        backgroundImage:
            image != null ? FileImage(File(image!)) : AssetImage(ImageApp.user),
      ),
    );
  }
}
