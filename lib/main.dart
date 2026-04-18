import 'package:flutter/material.dart';
import 'package:untitled/Mariam/screenl/screenl/memory.dart';
import 'package:untitled/Mariam/screenl/screenl/relax.dart';
import 'package:untitled/Mariam/screenl/screenl/trivial.dart';
import 'package:untitled/prject2/FilterPage.dart';
import 'package:untitled/prject2/cartpage.dart';
import 'package:untitled/prject2/checkout_screen.dart';
import 'package:untitled/prject2/Product%20View.dart';
import 'package:untitled/project3/Medical.dart';
import 'package:untitled/project3/Terms.dart';
import 'package:untitled/project3/Privacy.dart';
import 'package:untitled/screen/Add_pyment.dart';
import 'package:untitled/screen/Delete_Account.dart';
import 'package:untitled/screen/Doctor.dart';
import 'package:untitled/screen/Edit_profile.dart';
import 'package:untitled/screen/Notifications.dart';
import 'package:untitled/screen/ali.dart';
import 'package:untitled/screen/biling.dart';
import 'package:untitled/screen/chang_password.dart';
import 'package:untitled/prject2/Filter1.dart';
import 'package:untitled/screen/insulin.dart';
import 'package:untitled/screen/insulin_unit.dart';
import 'package:untitled/screen/setting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  home: CartPage(),
      home: RelaxScreen(),
    );
  }
}
