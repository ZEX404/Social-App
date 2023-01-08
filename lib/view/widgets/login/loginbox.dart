import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../controller/auth/logincontroller.dart';
import 'package:get/get.dart';

late double height;
late double width;

final focus = FocusNode();

bool isLoading = false;

class LoginBox extends StatefulWidget {
  const LoginBox({super.key});
  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    LoginControllerImp controller = Get.put(LoginControllerImp());
    const shadows2 = [
      Shadow(offset: Offset(-0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, 0.5), color: Colors.black),
      Shadow(offset: Offset(-0.5, 0.5), color: Colors.black),
    ];
    return Form(
      key: controller.formstate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20)),
              child: GetBuilder<LoginControllerImp>(
                builder: (controller) => TextFormField(
                  controller: controller.password,
                  focusNode: focus,
                  textAlign: TextAlign.start,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                      fontFamily: 'welcome', color: Colors.black),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                    prefixIcon: const Icon(Icons.key, color: Colors.black),
                    suffixIcon: IconButton(
                      color: Colors.white,
                      splashColor: Colors.teal,
                      highlightColor: Colors.transparent,
                      splashRadius: 20,
                      icon: const Icon(Icons.paste, color: Colors.black),
                      onPressed: () async {
                        Clipboard.getData(Clipboard.kTextPlain).then((value) {
                          if (value != null) {
                            String copiedText = value.text!;
                            controller.password.text =
                                copiedText.trim().toUpperCase();
                          }
                        });
                      },
                    ),
                    border: InputBorder.none,
                    hintText: "Key",
                    hintStyle: const TextStyle(
                        fontFamily: 'welcome', color: Colors.black38),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              height: 40,
              width: width / 2,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.transparent.withOpacity(0.5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.deepOrange)))),
                onPressed: isLoading == true
                    ? null
                    : () {
                        if (isLoading == false) {
                          if (controller.password.text.isEmpty) {
                            _displayErrorToast(
                                context, 'Password can\'t be empty'.tr);
                          } else if (controller.password.text.length < 6) {
                            _displayErrorToast(
                                context, 'Password is not valid'.tr);
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                          }
                        }
                      },
                child: isLoading == true
                    ? Image.asset(
                        'assets/images/loading.gif',
                        color: Colors.deepOrange,
                      )
                    : Text(
                        "Login".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'welcome',
                          shadows: shadows2,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayErrorToast(context, text) {
    MotionToast.error(
      title: Text(
        "Error".tr,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.red,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.bold,
        ),
      ),
      description: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: 'Cairo',
          color: Colors.black,
        ),
      ),
    ).show(context);
  }
}
