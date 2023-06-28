
import 'package:encrypt/encrypt.dart';
import 'package:uuid/uuid.dart';

class EncryptUtil {


  static get symmetricKey {
    var uuid = const Uuid();
    String symmetricKey = uuid.v4().substring(0,16);
    return symmetricKey;
  }

  static final encrypter = Encrypter(AES(Key.fromUtf8(symmetricKey), mode: AESMode.ecb));

  static final iv = IV.fromLength(16);

  static String encrypt(String text) {
    if (text.isEmpty) return "";
    return encrypter.encrypt(text, iv: iv).base64;
  }

  static String decrypt(String text) {
    if (text.isEmpty) return "";
    return encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
  }

}