import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageApp {
  static final storage = FlutterSecureStorage();

  static void Write(String key, String value) async =>
      await storage.write(key: key, value: value);

  static Future<String?> Read(String key) async {
    var response = await storage.read(key: key);
    return response;
  }
}
