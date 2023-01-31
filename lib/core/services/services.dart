import 'dart:convert';
import 'dart:math';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_app/core/constants/imageassets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce_app/core/constants/constants.dart';

bool isInternetAccess = false;
String? alexandria;

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}


String quoteAuthor = "";
String quoteText = "";

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  //
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult != ConnectivityResult.none) {
    // print("Internet access");
    isInternetAccess = true;
    //
    var url = "https://raw.githubusercontent.com/ZEX404/Api/main/quotes.txt";
    var response = await http.get(Uri.parse(url));
    var quotes = json.decode(response.body);
    var random = Random();
    var randomIndex = random.nextInt(quotes.length);
    var randomQuote = quotes[randomIndex];
    // var quoteNumber = int.parse(randomQuote.keys.first);
    quoteAuthor = randomQuote.values.first["author"];
    quoteText = randomQuote.values.first["quote"];
    //
    alexandria = GoogleFonts.alexandria().fontFamily;
    //
    ImageLink.onBoardingImage1;
    ImageLink.onBoardingImage2;
    ImageLink.onBoardingImage3;
    ImageLink.onBoardingImage4;
    ImageLink.onBoardingImage5;
    //
    // print("Downloaded recsources successfully");
  } else {
    isInternetAccess = false;
    alexandria = nunito;
    //
    var quotes = offlineQuotes;
    var random = Random();
    var randomIndex = random.nextInt(quotes.length);
    var randomQuote = quotes[randomIndex];
    // var quoteNumber = int.parse(randomQuote.keys.first);
    quoteAuthor = randomQuote.values.first["author"];
    quoteText = randomQuote.values.first["quote"];
    // print("You don't have internet connection");
  }
}

List offlineQuotes = [
  {
    "40": {
      "author": "Steve Jobs",
      "quote":
          "Design is not just what it looks like and feels like. Design is how it works."
    }
  },
  {
    "41": {
      "author": "Eleanor Roosevelt",
      "quote":
          "The future belongs to those who believe in the beauty of their dreams."
    }
  },
  {
    "42": {
      "author": "Mahatma Gandhi",
      "quote":
          "Strength does not come from physical capacity. It comes from an indomitable will."
    }
  },
  {
    "43": {
      "author": "Nelson Mandela",
      "quote":
          "The greatest glory in living lies not in never falling, but in rising every time we fall."
    }
  },
  {
    "44": {
      "author": "Confucius",
      "quote":
          "It does not matter how slowly you go as long as you do not stop."
    }
  },
  {
    "45": {
      "author": "Martin Luther King Jr.",
      "quote":
          "In the end, we will remember not the words of our enemies, but the silence of our friends."
    }
  },
  {
    "46": {
      "author": "Ralph Waldo Emerson",
      "quote": "The only way to do great work is to love what you do."
    }
  },
  {
    "47": {
      "author": "Robert Frost",
      "quote": "The road less traveled is the one more worth taking."
    }
  },
  {
    "48": {
      "author": "Margaret Thatcher",
      "quote":
          "If you want something said, ask a man; if you want something done, ask a woman."
    }
  },
  {
    "49": {
      "author": "Henry Ford",
      "quote":
          "Obstacles are those things you see when you take your eyes off the goal."
    }
  },
  {
    "50": {
      "author": "Mark Twain",
      "quote": "The secret of getting ahead is getting started."
    }
  }
];
