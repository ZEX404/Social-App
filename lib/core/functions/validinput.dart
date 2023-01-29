import 'package:ecommerce_app/core/constants/constants.dart';
import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return messageInputEmpty;
  } else {
    if (type == 'email') {
      if (!GetUtils.isEmail(val)) {
        return "Email $messageNotValid";
      }
    }

    if (type == 'username') {
      if (!GetUtils.isUsername(val) || val[0].isNum) {
        return "Username $messageNotValid";
      }
    }

    if (type == 'phone') {
      if (!GetUtils.isPhoneNumber(val)) {
        return "Phone $messageNotValid";
      }
    }

    if (val.length < min) {
      return "$messageInputMin $min";
    }

    if (val.length > max) {
      return "$messageInputMax $max";
    }
  }
}
