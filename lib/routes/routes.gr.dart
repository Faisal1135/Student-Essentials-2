// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../mainapp.dart' as _i1;
import '../notes/models/note_model.dart' as _i15;
import '../notes/note_catagory.dart' as _i10;
import '../notes/note_edit.dart' as _i9;
import '../notes/note_main_page.dart' as _i8;
import '../ocr/homepage.dart' as _i7;
import '../result/model/resultmodel.dart' as _i14;
import '../result/pages/result_details.dart' as _i5;
import '../result/pages/result_home.dart' as _i3;
import '../result/pages/result_main.dart' as _i2;
import '../result/pages/save_user.dart' as _i4;
import '../skechpad/skechpad.dart' as _i6;
import 'routes.dart' as _i13;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AppMainRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppMain());
    },
    ResultMainPageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ResultMainPage());
    },
    ResultHomePageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ResultHomePage());
    },
    UserFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserFormScreenRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.UserFormScreen(args.finalcpga, key: args.key));
    },
    ResultDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ResultDetailsRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ResultDetails(key: args.key, results: args.results));
    },
    DrawAppRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.DrawApp(),
          transitionsBuilder: _i13.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    OcrPageRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.OcrPage(),
          transitionsBuilder: _i13.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    NotesScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NotesScreenRouteArgs>(
          orElse: () => const NotesScreenRouteArgs());
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i8.NotesScreen(key: args.key),
          transitionsBuilder: _i13.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    EditNotePageRoute.name: (routeData) {
      final args = routeData.argsAs<EditNotePageRouteArgs>(
          orElse: () => const EditNotePageRouteArgs());
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i9.EditNotePage(key: args.key, existNote: args.existNote),
          transitionsBuilder: _i13.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    NoteCatagoryScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NoteCatagoryScreenRouteArgs>();
      return _i11.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.NoteCatagoryScreen(key: args.key, tag: args.tag),
          transitionsBuilder: _i13.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(AppMainRoute.name, path: '/'),
        _i11.RouteConfig(ResultMainPageRoute.name, path: '/result-main-page'),
        _i11.RouteConfig(ResultHomePageRoute.name, path: '/result-home-page'),
        _i11.RouteConfig(UserFormScreenRoute.name, path: '/user-form-screen'),
        _i11.RouteConfig(ResultDetailsRoute.name, path: '/result-details'),
        _i11.RouteConfig(DrawAppRoute.name, path: '/draw-app'),
        _i11.RouteConfig(OcrPageRoute.name, path: '/ocr-page'),
        _i11.RouteConfig(NotesScreenRoute.name, path: '/notes-screen'),
        _i11.RouteConfig(EditNotePageRoute.name, path: '/edit-note-page'),
        _i11.RouteConfig(NoteCatagoryScreenRoute.name,
            path: '/note-catagory-screen')
      ];
}

/// generated route for [_i1.AppMain]
class AppMainRoute extends _i11.PageRouteInfo<void> {
  const AppMainRoute() : super(name, path: '/');

  static const String name = 'AppMainRoute';
}

/// generated route for [_i2.ResultMainPage]
class ResultMainPageRoute extends _i11.PageRouteInfo<void> {
  const ResultMainPageRoute() : super(name, path: '/result-main-page');

  static const String name = 'ResultMainPageRoute';
}

/// generated route for [_i3.ResultHomePage]
class ResultHomePageRoute extends _i11.PageRouteInfo<void> {
  const ResultHomePageRoute() : super(name, path: '/result-home-page');

  static const String name = 'ResultHomePageRoute';
}

/// generated route for [_i4.UserFormScreen]
class UserFormScreenRoute extends _i11.PageRouteInfo<UserFormScreenRouteArgs> {
  UserFormScreenRoute({required double finalcpga, _i12.Key? key})
      : super(name,
            path: '/user-form-screen',
            args: UserFormScreenRouteArgs(finalcpga: finalcpga, key: key));

  static const String name = 'UserFormScreenRoute';
}

class UserFormScreenRouteArgs {
  const UserFormScreenRouteArgs({required this.finalcpga, this.key});

  final double finalcpga;

  final _i12.Key? key;

  @override
  String toString() {
    return 'UserFormScreenRouteArgs{finalcpga: $finalcpga, key: $key}';
  }
}

/// generated route for [_i5.ResultDetails]
class ResultDetailsRoute extends _i11.PageRouteInfo<ResultDetailsRouteArgs> {
  ResultDetailsRoute({_i12.Key? key, required _i14.ResultListModel results})
      : super(name,
            path: '/result-details',
            args: ResultDetailsRouteArgs(key: key, results: results));

  static const String name = 'ResultDetailsRoute';
}

class ResultDetailsRouteArgs {
  const ResultDetailsRouteArgs({this.key, required this.results});

  final _i12.Key? key;

  final _i14.ResultListModel results;

  @override
  String toString() {
    return 'ResultDetailsRouteArgs{key: $key, results: $results}';
  }
}

/// generated route for [_i6.DrawApp]
class DrawAppRoute extends _i11.PageRouteInfo<void> {
  const DrawAppRoute() : super(name, path: '/draw-app');

  static const String name = 'DrawAppRoute';
}

/// generated route for [_i7.OcrPage]
class OcrPageRoute extends _i11.PageRouteInfo<void> {
  const OcrPageRoute() : super(name, path: '/ocr-page');

  static const String name = 'OcrPageRoute';
}

/// generated route for [_i8.NotesScreen]
class NotesScreenRoute extends _i11.PageRouteInfo<NotesScreenRouteArgs> {
  NotesScreenRoute({_i12.Key? key})
      : super(name,
            path: '/notes-screen', args: NotesScreenRouteArgs(key: key));

  static const String name = 'NotesScreenRoute';
}

class NotesScreenRouteArgs {
  const NotesScreenRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'NotesScreenRouteArgs{key: $key}';
  }
}

/// generated route for [_i9.EditNotePage]
class EditNotePageRoute extends _i11.PageRouteInfo<EditNotePageRouteArgs> {
  EditNotePageRoute({_i12.Key? key, _i15.NoteModel? existNote})
      : super(name,
            path: '/edit-note-page',
            args: EditNotePageRouteArgs(key: key, existNote: existNote));

  static const String name = 'EditNotePageRoute';
}

class EditNotePageRouteArgs {
  const EditNotePageRouteArgs({this.key, this.existNote});

  final _i12.Key? key;

  final _i15.NoteModel? existNote;

  @override
  String toString() {
    return 'EditNotePageRouteArgs{key: $key, existNote: $existNote}';
  }
}

/// generated route for [_i10.NoteCatagoryScreen]
class NoteCatagoryScreenRoute
    extends _i11.PageRouteInfo<NoteCatagoryScreenRouteArgs> {
  NoteCatagoryScreenRoute({_i12.Key? key, required _i15.NoteTag tag})
      : super(name,
            path: '/note-catagory-screen',
            args: NoteCatagoryScreenRouteArgs(key: key, tag: tag));

  static const String name = 'NoteCatagoryScreenRoute';
}

class NoteCatagoryScreenRouteArgs {
  const NoteCatagoryScreenRouteArgs({this.key, required this.tag});

  final _i12.Key? key;

  final _i15.NoteTag tag;

  @override
  String toString() {
    return 'NoteCatagoryScreenRouteArgs{key: $key, tag: $tag}';
  }
}
