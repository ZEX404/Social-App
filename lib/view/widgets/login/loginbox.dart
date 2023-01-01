import 'package:flutter/material.dart';
import '../../../controller/auth/logincontroller.dart';
import '../../../core/constants/colors.dart';
import 'package:get/get.dart';

late double height;
late double width;

String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return value!.isNotEmpty && !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : null;
}

final focus = FocusNode();

bool isLoading = false;

class LoginBox extends StatelessWidget {
  const LoginBox({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    LoginControllerImp controller = Get.put(LoginControllerImp());

    return Stack(
      alignment: Alignment.center,
      children: [
        const Positioned(
          top: 30,
          child: CircleAvatar(
            radius: 66,
            backgroundColor: AppColors.kTextColor,
            child: CircleAvatar(
              radius: 64,
              backgroundColor: AppColors.kPrimaryColor,
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/icon.png',
                ),
                radius: 60,
              ),
            ),
          ),
        ),
        Container(
          height: height / 1.5,
          width: width,
          alignment: Alignment.center,
          child: Container(
            height: height / 2.5,
            width: width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(flex: 2, child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: controller.email,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        onFieldSubmitted: (v) {
                          FocusScope.of(context).requestFocus(focus);
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppColors.kTextColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.paste),
                            color: Colors.white,
                            splashColor: Colors.teal,
                            highlightColor: Colors.transparent,
                            splashRadius: 20,
                          ),
                          border: InputBorder.none,
                          hintText: 'Email'.tr,
                          hintStyle: const TextStyle(
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8)),
                      child: TextFormField(
                        controller: controller.password,
                        style: const TextStyle(
                          fontFamily: 'Cairo',
                        ),
                        focusNode: focus,
                        textAlign: TextAlign.start,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              width: 2,
                              color: AppColors.kTextColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                            color: Colors.white,
                            splashColor: Colors.teal,
                            highlightColor: Colors.transparent,
                            splashRadius: 20,
                            icon: const Icon(Icons.visibility_off),
                            onPressed: () {},
                          ),
                          border: InputBorder.none,
                          hintText: "Password".tr,
                          hintStyle: const TextStyle(
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStateProperty.all(
                          AppColors.kTextColor,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: width / 3,
                        child: isLoading == true
                            ? Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/loading.gif',
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Login".tr,
                                style: const TextStyle(
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
