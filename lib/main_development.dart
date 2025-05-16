import 'package:flutter/material.dart';
import 'package:qabilati/core/service/service_app.dart';
import 'package:qabilati/qabilati_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceApp.init();
  runApp(QabilatiApp());
}
