import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == 'email') {
    if (!GetUtils.isEmail(val)) {
      return "Not valid email";
    }
  }

  if (val.isEmpty) {
    return "can't be empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be greater than $max";
  }
}
