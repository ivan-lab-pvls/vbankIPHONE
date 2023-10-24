import 'package:banking_app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'const.dart';
import 'fx.dart';
import 'nx.dart';
import 'views/page_view.dart';

final String incomes = "incomes";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationServiceFb().activate();
  Constants.pxsaxa = xazaaewz(Constants.pxsaxa, Constants.ixa);
  Constants.sxasaza = xazaaewz(Constants.sxasaza, Constants.ixa);
  Constants.dasax = xazaaewz(Constants.dasax, Constants.ixa);
  Constants.mkxsa = xazaaewz(Constants.mkxsa, Constants.ixa);
  Constants.gdfssd = xazaaewz(Constants.gdfssd, Constants.ixa);
  await Hive.initFlutter();
  await Hive.openBox(incomes);
  await Hive.openBox<bool>('settings');
  final bool isFlagSet =
      Hive.box<bool>('settings').get('splash', defaultValue: false) ?? false;
  runApp(BankingApp(
    isFirstOpen: Future<bool>.value(isFlagSet),
  ));
}
