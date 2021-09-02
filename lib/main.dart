import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gs_two/app/my_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}



