import 'package:flutter/material.dart';

class ProfileField {
  final String label;
  final String hint;
  final IconData icon;

  ProfileField({required this.label, required this.hint, required this.icon});
}

/// موديل الإشعار
class NotificationItem {
  final String title;
  final String subtitle;
  bool value; // القيمة الحالية للـ Switch

  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.value,
  });
}

///////////////

class SecurityItem {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  SecurityItem({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });
}

//////////////biling//////////
class BillingModel {
  final String date;
  final String title;
  final double price;

  BillingModel({required this.date, required this.title, required this.price});
}

//////////////insulin/////////////////
class FoodModel {
  final String name;
  final String carbs;
  final String image;

  FoodModel({required this.name, required this.carbs, required this.image});
}

/////////// insulin_unit /////////////
class FoodModel2 {
  final String name;
  final String carbs;
  final String image;

  FoodModel2({required this.name, required this.carbs, required this.image});
}

///////////// Doctor //////////////
class DrawerModel {
  final String title;
  final IconData icon;
  final bool isExpandable;

  DrawerModel({
    required this.title,
    required this.icon,
    this.isExpandable = false,
  });
}

//////////// MenuItemModel///////////
class MenuItemModel {
  final IconData icon;
  final String title;

  final bool enableNav;
  final List<SubMenuItemModel>? subItems;

  MenuItemModel({
    required this.icon,
    required this.title,

    this.enableNav = true,
    this.subItems,
  });
}

class SubMenuItemModel {
  final String title;

  SubMenuItemModel({required this.title});
}

////////////// ProductsPage ///////////////
class ProductModel {
  final String name;
  final String image;

  ProductModel({required this.name, required this.image});
}

////////////////fltter ////////////////
class CategoryModel {
  final String title;

  CategoryModel({required this.title});
}

////////////// Chckout //////////////
class InputFieldModel {
  final String hint;
  final dynamic icon;

  InputFieldModel({required this.hint, required this.icon});
}

////////////// Chckout2 //////////////
class FieldModel {
  final String text;
  final int index;
  final IconData icon;

  FieldModel({required this.text, required this.index, required this.icon});
}

///////////////////////// CartPage ///////////////////////
class Product {
  final String name;
  final String image;
  final int price;
  int quantity;
  final String delivery;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
    required this.delivery,
  });
}

////////////// terms /////////////////
class TermSection {
  final String? number; // رقم القسم زي "1"
  final String title; // عنوان القسم
  final String? body; // نص الفقرة
  final List<String>? bullets; // لو فيه نقاط
  final List<String>? subSections; // لو فيه عناوين فرعية
  final bool isWarning; // هل صندوق تحذير

  TermSection({
    this.number,
    required this.title,
    this.body,
    this.bullets,
    this.subSections,
    this.isWarning = false,
  });
}
//////////// privacy //////////////

class PolicyItem {
  final String text;
  final IconData icon;
  final Color iconColor;

  PolicyItem({
    required this.text,
    this.icon = Icons.check_circle,
    this.iconColor = Colors.green,
  });
}

class PolicySectionModel {
  final IconData? icon;
  final Color iconColor;
  final String title;
  final List<PolicyItem> items;

  PolicySectionModel({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.items,
  });
}

///////////////// Medical //////////////////
// 1. تعريف الموديل
class MedicalInfo {
  final IconData icon;
  final String title;
  final String desc;

  const MedicalInfo({
    required this.icon,
    required this.title,
    required this.desc,
  });
}
