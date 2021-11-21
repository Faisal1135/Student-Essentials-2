import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../routes/routes.gr.dart';
import 'package:auto_route/auto_route.dart';

class AppItemModel {
  final String title;

  final IconData iconData;
  final Color? iconColor;

  final void Function()? onTap;
  final String? imagepath;

  const AppItemModel(
      {required this.title,
      this.onTap,
      required this.iconData,
      this.iconColor,
      this.imagepath});

  static List<AppItemModel> getAppitemsByContext(BuildContext context) {
    return <AppItemModel>[
      AppItemModel(
        title: 'Result',
        iconData: Icons.book_online,
        onTap: () {
          context.router.push(
            const ResultMainPageRoute(),
          );
        },
      ),
      AppItemModel(
        title: 'Sketchpad',
        iconData: Icons.edit,
        onTap: () {
          context.router.push(const DrawAppRoute());
        },
      ),
      AppItemModel(
        title: 'Routine',
        iconData: Icons.lock_clock_sharp,
        onTap: () {},
      ),
      AppItemModel(
        title: 'Text Scanner',
        iconData: Icons.text_fields,
        onTap: () {
          context.router.push(
            const OcrPageRoute(),
          );
        },
      ),
      AppItemModel(
        title: 'Take Note',
        iconData: Icons.note_add,
        onTap: () {
          context.router.push(
            NotesScreenRoute(),
          );
        },
      ),
    ];
  }
}

var appItems = [
  AppItemModel(
    title: 'Result',
    onTap: () {},
    iconData: Icons.assignment,
    iconColor: Colors.blue,
  ),
];
