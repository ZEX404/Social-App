import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/constants.dart';
import '../../../core/functions/alertexitapp.dart';
import '../../widgets/login/bottomcontainer.dart';
import '../../widgets/login/loginbox.dart';
import 'package:root_access/root_access.dart';

late double height;
late double width;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> initRootRequest() async {
    bool rootStatus = await RootAccess.requestRootAccess;
    if (!mounted) return;
    setState(() {
      rootStatusP = rootStatus;
    });
  }

  @override
  void initState() {
    initRootRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    const shadows2 = [
      Shadow(offset: Offset(-0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, -0.5), color: Colors.black),
      Shadow(offset: Offset(0.5, 0.5), color: Colors.black),
      Shadow(offset: Offset(-0.5, 0.5), color: Colors.black),
    ];
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              'assets/images/zex/bg.jpg',
            ),
            fit: BoxFit.fitWidth),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height / 12,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'ZEX VIP ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 30,
                      color: Colors.red,
                      fontFamily: 'welcome',
                      shadows: shadows2,
                    ),
                  ),
                  Text(
                    'V1.0.2',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 30,
                      color: Colors.orange,
                      fontFamily: 'welcome',
                      shadows: shadows2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Image.asset('assets/images/zex/icon.png', height: 200),
                      const Text(
                        'Hello, insert your key to login',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: 'kufa',
                          shadows: shadows2,
                        ),
                      ),
                      const LoginBox(),
                    ],
                  ),
                ),
                const BottomContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OldLoginBox extends StatelessWidget {
  const OldLoginBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: WillPopScope(
          onWillPop: alertExitApp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height / 12,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: width / 2.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.security,
                                size: 25,
                                color: AppColors.kTextColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Text(
                                  rootStatusP != null
                                      ? rootStatusP == true
                                          ? "Root Access".tr
                                          : "No Root"
                                      : "Checking",
                                  maxLines: 1,
                                  style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 18,
                                    color: rootStatusP != null
                                        ? rootStatusP == true
                                            ? Colors.greenAccent
                                            : Colors.red
                                        : Colors.orange,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                    shadows: const [
                                      Shadow(
                                          // bottomLeft
                                          offset: Offset(-0.5, -0.5),
                                          color: Colors.black),
                                      Shadow(
                                          // bottomRight
                                          offset: Offset(0.5, -0.5),
                                          color: Colors.black),
                                      Shadow(
                                          // topRight
                                          offset: Offset(0.5, 0.5),
                                          color: Colors.black),
                                      Shadow(
                                          // topLeft
                                          offset: Offset(-0.5, 0.5),
                                          color: Colors.black),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Version : ".tr,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.5, -0.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.5, -0.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.5, 0.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.5, 0.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                          const Text(
                            "1.0",
                            maxLines: 1,
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              color: AppColors.kTextColor,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    // bottomLeft
                                    offset: Offset(-0.5, -0.5),
                                    color: Colors.black),
                                Shadow(
                                    // bottomRight
                                    offset: Offset(0.5, -0.5),
                                    color: Colors.black),
                                Shadow(
                                    // topRight
                                    offset: Offset(0.5, 0.5),
                                    color: Colors.black),
                                Shadow(
                                    // topLeft
                                    offset: Offset(-0.5, 0.5),
                                    color: Colors.black),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const LoginBox(),
              const BottomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
