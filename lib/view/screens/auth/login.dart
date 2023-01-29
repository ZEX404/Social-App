import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/core/class/scrollbehavier.dart';
import 'package:ecommerce_app/core/constants/apilinks.dart';
import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:ecommerce_app/core/constants/routes.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/view/widgets/auth/custombuttonauth.dart';
import 'package:ecommerce_app/view/widgets/auth/customtextform.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/functions/validinput.dart';

late double height;
late double width;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // initRootRequest();
    super.initState();
  }

  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Crud crud = Crud();

  login() async {
    if (formstate.currentState!.validate()) {
      if (mounted) {
        setState(() {
          isLoading = true;
        });
      }
      var response = await crud.postRequest(loginLink, {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      });

      if (response['status'] == 'success') {
        sharedPref.setString("email", emailController.text.trim());
        sharedPref.setString("password", passwordController.text);
        Get.offAllNamed(AppRoutes.home);
      } else {
        final snackbar = SnackBar(
          backgroundColor: Colors.white.withOpacity(0.8),
          showCloseIcon: true,
          closeIconColor: Colors.red,
          margin: const EdgeInsets.all(8),
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          content: Text(
            response['message'],
            style: GoogleFonts.alexandria(
              color: Colors.red,
            ),
          ),
          duration: const Duration(seconds: 5),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.kPrimaryColor,
          ),
        ),
        title: Text(
          "Sign In",
          style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 20, color: AppColors.kTextColor.withOpacity(0.5)),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.kBackground,
      ),
      body: isLoading == true
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Container(
                    height: height / 6,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.kPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CircularProgressIndicator(
                          backgroundColor: AppColors.kBackground,
                          color: AppColors.kTextColor,
                        ),
                        Center(
                          child: Text(
                            "Loading",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Cairo',
                              fontSize: 20,
                              color: AppColors.kTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          : ScrollConfiguration(
              behavior: MyBehavior(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: formstate,
                  child: ListView(
                    children: [
                      Image.asset('assets/images/icon.png',
                          height: 180, fit: BoxFit.fitHeight),
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(),
                      ),
                      Text(
                        "Sign in with your email and password\nor continue with social media",
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 14,
                                color: AppColors.kTextColor.withOpacity(0.5)),
                      ),
                      const SizedBox(height: 40),
                      CustomTextForm(
                        TextInputAction: TextInputAction.next,
                        hintText: "Enter your Email",
                        label: "Email",
                        iconData: Icons.email_outlined,
                        myController: emailController,
                        validator: (val) {
                          return validInput(val!, 1, 50, "email");
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextForm(
                        TextInputAction: TextInputAction.done,
                        hintText: "Enter your Password",
                        label: "Password",
                        iconData: Icons.lock_outlined,
                        myController: passwordController,
                        validator: (val) {
                          return validInput(val!, 1, 50, "password");
                        },
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Forget Password",
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontSize: 14),
                      ),
                      CustomButtonAuth(
                        text: "Sign In",
                        onPressed: () async {
                          login();
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
