import 'package:ecommerce_app/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:ionicons/ionicons.dart';

import 'tabscreens/feed.dart';
import 'tabscreens/groups.dart';
import 'tabscreens/notifications.dart';
import 'tabscreens/reels.dart';
import 'tabscreens/settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final controller = ScrollController();

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.kBackground,
          appBar: ScrollAppBar(
            elevation: 0,
            controller: controller,
            backgroundColor: Colors.white,
            title: const Text(
              "IStudy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: AppColors.kTextColor,
                fontWeight: FontWeight.bold,
                letterSpacing: -1,
                fontFamily: 'intr',
              ),
            ),
            actions: [
              Row(
                children: [
                  _appBarAction(
                    icon: FontAwesome5.search,
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Open search screen",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColors.kBackground,
                          textColor: AppColors.kPrimaryColor,
                          fontSize: 16.0);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Open chat screen",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColors.kBackground,
                            textColor: AppColors.kPrimaryColor,
                            fontSize: 16.0);
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: const BorderSide(
                              color: Colors.black45,
                              width: 0.8,
                            ),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll(Colors.white),
                        elevation: const MaterialStatePropertyAll(0),
                        overlayColor: const MaterialStatePropertyAll(
                            AppColors.kBackground),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Chats",
                            style: TextStyle(
                              fontFamily: 'nunito',
                              color: AppColors.kTextColor,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 10,
                              child: Text(
                                "3",
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            children: [
              Container(
                color: Colors.white,
                child: TabBar(
                  controller: tabController,
                  tabs: [
                    const Tab(
                      icon: Icon(
                        Ionicons.home_outline,
                        color: AppColors.kTextColor,
                      ),
                    ),
                    const Tab(
                      icon: Padding(
                        padding: EdgeInsets.only(top: 2),
                        child: Icon(
                          Icons.video_collection_outlined,
                          color: AppColors.kTextColor,
                        ),
                      ),
                    ),
                    const Tab(
                      icon: Icon(
                        Ionicons.people_outline,
                        color: AppColors.kTextColor,
                      ),
                    ),
                    const Tab(
                      icon: Icon(
                        Ionicons.notifications_outline,
                        color: AppColors.kTextColor,
                      ),
                    ),
                    Tab(
                      child: Stack(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.black45,
                            radius: 15,
                            child: CircleAvatar(
                              backgroundColor: AppColors.kTextColor,
                              child: CircleAvatar(
                                radius: 14,
                                backgroundColor: AppColors.kBackground,
                                backgroundImage:
                                    AssetImage('assets/images/icon.png'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 7,
                              backgroundColor:
                                  AppColors.kTextColor.withOpacity(0.8),
                              child: const Icon(
                                Icons.settings,
                                color: AppColors.kBackground,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.transparent, height: 1),
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children: [
                    SingleChildScrollView(
                      controller: controller,
                      child: const FeedScreen(),
                    ),
                    SingleChildScrollView(
                      controller: controller,
                      child: const ReelsScreen(),
                    ),
                    SingleChildScrollView(
                      controller: controller,
                      child: const GroupsScreen(),
                    ),
                    SingleChildScrollView(
                        controller: controller,
                        child: const NotificationsScreen()),
                    SingleChildScrollView(
                      controller: controller,
                      child: const SettingsScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBarAction(
      {required IconData icon, required Function() onPressed}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.transparent.withOpacity(0.01),
      ),
      child: IconButton(
        onPressed: onPressed,
        splashRadius: 22,
        icon: Icon(
          icon,
          size: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
