import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:status_downloader/Common%20Widget/color_const.dart';
customSnackBar(String title){
  return Get.snackbar(
      '',
      '',
    icon: Icon(Icons.check_circle,size: 35, color: Colors.white,),
    titleText: Align(
      alignment: Alignment.bottomLeft,
      child: Text(title,
        style: GoogleFonts.josefinSans(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w600
        ),),
    ),
    borderRadius: 8,
    backgroundColor: secondaryColor,
    snackPosition: SnackPosition.BOTTOM,
    margin: EdgeInsets.symmetric(
      horizontal: 15,
      vertical: Get.height*0.16
    ),
    dismissDirection: DismissDirection.horizontal,
    leftBarIndicatorColor: Colors.white,
    snackStyle: SnackStyle.GROUNDED
  );
}