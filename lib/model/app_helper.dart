import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../constant/app_constant.dart';

class AppHelper {
  final storage = const FlutterSecureStorage();

  saveData(String? token) async {
    await storage
        .write(key: "saveInitialData", value: token)
        .whenComplete(() => logger.i('saveToken:  saveInitialData'));
  }

  Future<String?> getData() async {
    // return await storage.read(key: "is_default_2_marks");
    try {
      final value = await storage.read(key: "saveInitialData");
      return value;
    } on PlatformException catch (e) {
      await storage.deleteAll();
    }
    return null;
    }
}