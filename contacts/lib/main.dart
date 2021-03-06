import 'dart:io';

import 'package:contacts/android/android.app.dart';
import 'package:contacts/ios/ios.app.dart';
import 'package:flutter/widgets.dart';

void main() {
  if (Platform.isAndroid)
    runApp(AndroidApp());
  else
    return runApp(IOSApp());
}
