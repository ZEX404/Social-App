import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../controller/auth/logincontroller.dart';
import '../../../core/constants/colors.dart';
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
              // autovalidateMode: AutovalidateMode.always,
              key: controller.formstate,
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
                        // validator: (val) {
                        //   return validInput(val!, 5, 100, 'email');
                        // },
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
                      child: GetBuilder<LoginControllerImp>(
                        builder: (controller) => TextFormField(
                          controller: controller.password,
                          focusNode: focus,
                          textAlign: TextAlign.start,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: controller.isObscure,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(
                              fontFamily: 'Cairo',
                            ),
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
                              icon: controller.isObscure == true
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                controller.showPassword();
                              },
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
                  ),
                  const Expanded(flex: 1, child: SizedBox()),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (isLoading == false) {
                          if (controller.email.text.isEmpty) {
                            _displayErrorToast(
                                context, 'Email can\'t be empty'.tr);
                          } else if (controller.password.text.isEmpty) {
                            _displayErrorToast(
                                context, 'Password can\'t be empty'.tr);
                          } else if (!controller.email.text.isEmail) {
                            _displayErrorToast(
                                context, 'Email is not valid'.tr);
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
