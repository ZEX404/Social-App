// import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/data/datasource/static/data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/constants/colors.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 5, 4, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.kBackground,
                  backgroundImage: AssetImage('assets/images/icon.png'),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Fluttertoast.showToast(
                            msg: "Open the create post screen",
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
                            borderRadius: BorderRadius.circular(15.0),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "What's on your mind?",
                            style: TextStyle(
                              fontFamily: 'intr',
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "Open the image picker",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: AppColors.kBackground,
                        textColor: AppColors.kPrimaryColor,
                        fontSize: 16.0);
                  },
                  icon: const Icon(
                    Icons.image,
                    color: Colors.green,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Colors.transparent, height: 8),
        Container(
          color: Colors.white,
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Data.dataList.length,
            itemBuilder: (context, index) {
              return personCard(index: index);
            },
          ),
        ),
        const Divider(color: Colors.transparent, height: 8),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: Data.dataList.length,
          itemBuilder: (context, index) {
            return postCard(index: index);
          },
        ),
      ],
    );
  }

  Widget postCard({required int index}) {
    const textStyle = TextStyle(
      fontFamily: 'intr',
      color: AppColors.kTextColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Data.dataList[index].isCreate
        ? Container()
        : Container(
            color: Colors.white,
            child: Column(
              children: [
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Fluttertoast.showToast(
                                  msg: "Open profile of person $index",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: AppColors.kBackground,
                                  textColor: AppColors.kPrimaryColor,
                                  fontSize: 16.0);
                            },
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                Data.dataList[index].imgPath + index.toString(),
                              ),
                              radius: 18,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Data.dataList[index].userName,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'nunito',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              Text(
                                Data.dataList[index].hour,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Fluttertoast.showToast(
                              msg: "Menu for post $index",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColors.kBackground,
                              textColor: AppColors.kPrimaryColor,
                              fontSize: 16.0);
                        },
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
                Data.dataList[index].postImage == ''
                    ? Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ReadMoreText(
                          trimLength: 180,
                          colorClickableText: AppColors.kTextColor,
                          trimMode: TrimMode.Length,
                          trimCollapsedText: 'See more',
                          trimExpandedText: 'See less',
                          Data.dataList[index].postText,
                          textAlign: TextAlign.start,
                          lessStyle: textStyle,
                          moreStyle: textStyle,
                          style: const TextStyle(
                            fontFamily: 'intr',
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      )
                    : Container(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 5),
                              child: ReadMoreText(
                                trimLength: 150,
                                colorClickableText: AppColors.kTextColor,
                                trimMode: TrimMode.Length,
                                trimCollapsedText: ' See more',
                                trimExpandedText: ' See less',
                                Data.dataList[index].postText,
                                textAlign: TextAlign.start,
                                lessStyle: textStyle.copyWith(fontSize: 14),
                                moreStyle: textStyle.copyWith(fontSize: 14),
                                style: const TextStyle(
                                  fontFamily: 'intr',
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            FullScreenWidget(
                              backgroundColor: Colors.transparent,
                              child: Center(
                                child: Hero(
                                  tag: "$index",
                                  child: Image.network(
                                    Data.dataList[index].imgPath +
                                        index.toString(),
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Container(
                                        height: 400,
                                        color: AppColors.kBackground,
                                        width: double.infinity,
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  height: 40,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.transparent.withOpacity(0.02),
                                  radius: 10,
                                  child: const Text("❤️"),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.transparent.withOpacity(0.02),
                                  radius: 10,
                                  child: const Text("🥰"),
                                ),
                                CircleAvatar(
                                  backgroundColor:
                                      Colors.transparent.withOpacity(0.02),
                                  radius: 10,
                                  child: const Text("👍"),
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            InkWell(
                              onTap: () {
                                Fluttertoast.showToast(
                                    msg: "Reacts of post $index",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: AppColors.kBackground,
                                    textColor: AppColors.kPrimaryColor,
                                    fontSize: 16.0);
                              },
                              child: const Text(
                                "949",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Comments of post $index",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              AppColors.kBackground,
                                          textColor: AppColors.kPrimaryColor,
                                          fontSize: 16.0);
                                    },
                                    child: const Text(
                                      "200 comments",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'nunito',
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  const Text(
                                    "•",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'nunito',
                                      color: Colors.black54,
                                      fontSize: 10,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      Fluttertoast.showToast(
                                          msg: "Shares of post $index",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              AppColors.kBackground,
                                          textColor: AppColors.kPrimaryColor,
                                          fontSize: 16.0);
                                    },
                                    child: const Text(
                                      "29 shares",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'nunito',
                                        color: Colors.black54,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: AppColors.kBackground,
                  thickness: 1,
                ),
                Container(
                  height: 40,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Like post $index",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.kBackground,
                                textColor: AppColors.kPrimaryColor,
                                fontSize: 16.0);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: const MaterialStatePropertyAll(
                                AppColors.kBackground),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.thumbsUp,
                                  color: Colors.blue[700],
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Like",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Comment post $index",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.kBackground,
                                textColor: AppColors.kPrimaryColor,
                                fontSize: 16.0);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: const MaterialStatePropertyAll(
                                AppColors.kBackground),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.comment,
                                  size: 20,
                                  color: Colors.blue[700],
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Comment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg: "Share post $index",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: AppColors.kBackground,
                                textColor: AppColors.kPrimaryColor,
                                fontSize: 16.0);
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.white),
                            elevation: const MaterialStatePropertyAll(0),
                            overlayColor: const MaterialStatePropertyAll(
                                AppColors.kBackground),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.share,
                                  size: 20,
                                  color: Colors.blue[700],
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  "Share",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'nunito',
                                    color: Colors.black54,
                                    fontSize: 12,
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
                const Divider(
                  color: AppColors.kBackground,
                  thickness: 8,
                ),
              ],
            ),
          );
  }

  Widget personCard({required int index}) {
    return Data.dataList[index].isCreate
        ? GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Add story screen",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.kBackground,
                  textColor: AppColors.kPrimaryColor,
                  fontSize: 16.0);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 220, 220, 220),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                  Data.dataList[index].imgPath +
                                      index.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              child: Text(
                                "Create story",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'nunito',
                                  color: AppColors.kTextColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned.fill(
                      bottom: 45,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 220, 220, 220),
                          radius: 19,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: Colors.blue[800],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              Fluttertoast.showToast(
                  msg: "Open the story of person $index",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: AppColors.kBackground,
                  textColor: AppColors.kPrimaryColor,
                  fontSize: 16.0);
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      Data.dataList[index].imgPath + index.toString(),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 200,
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              Data.dataList[index].imgPath + index.toString(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Text(
                        Data.dataList[index].userName,
                        style: const TextStyle(
                          fontFamily: 'intr',
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
