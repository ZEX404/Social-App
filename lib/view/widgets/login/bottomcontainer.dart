import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'buynow.dart';

late double height;
late double width;

class BottomContainer extends StatelessWidget {
  const BottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    const shadows2 = [
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
    ];
    return Column(
      children: [
        const BuyNow(),
        Container(
          height: height / 12,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Uri url = Uri.parse("https://t.me/ZEX_XX");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  hoverColor: Colors.red[200],
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/zex/tg.png', height: 30),
                        const SizedBox(width: 5),
                        Text(
                          'Telegram'.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'droid',
                            shadows: shadows2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Uri url = Uri.parse("https://zexhack.rf.gd");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  hoverColor: Colors.red[200],
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/zex/web.png', height: 30),
                        const SizedBox(width: 5),
                        Text(
                          'Website'.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'droid',
                            shadows: shadows2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    Uri url = Uri.parse("https://www.youtube.com/@ZEX404");
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  },
                  hoverColor: Colors.red[200],
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/zex/yt.png',
                            height: 30, color: Colors.red),
                        const SizedBox(width: 5),
                        Text(
                          'Youtube'.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontFamily: 'droid',
                            shadows: shadows2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
