import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:studentessentials/mainapp.dart';
import 'package:studentessentials/notes/note_catagory.dart';
import 'package:studentessentials/notes/note_edit.dart';
import 'package:studentessentials/notes/note_main_page.dart';
import 'package:studentessentials/ocr/homepage.dart';
import 'package:studentessentials/result/pages/result_details.dart';
import 'package:studentessentials/result/pages/result_home.dart';
import 'package:studentessentials/result/pages/result_main.dart';
import 'package:studentessentials/result/pages/save_user.dart';
import 'package:studentessentials/skechpad/skechpad.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@MaterialAutoRouter(routes: [
  AutoRoute(page: AppMain, initial: true),
  AutoRoute(
    page: ResultMainPage,
  ),
  AutoRoute(page: ResultHomePage),
  AutoRoute(page: UserFormScreen),
  AutoRoute(page: ResultDetails),
  CustomRoute(
      page: DrawApp,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400),
  CustomRoute(
      page: OcrPage,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400),
  CustomRoute(
      page: NotesScreen,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400),
  CustomRoute(
      page: EditNotePage,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400),
  CustomRoute(
      page: NoteCatagoryScreen,
      transitionsBuilder: zoomInTransition,
      durationInMilliseconds: 400),
])
class $AppRouter {}
