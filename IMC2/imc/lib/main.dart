import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imc/ui/android/app.dart';
import 'package:imc/ui/ios/app.dart';

void main() =>
    Platform.isIOS ? runApp(MyCuppertinoApp()) : runApp(MyMaterialApp());
