// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../mainapp.dart' as _i1;
import '../ocr/homepage.dart' as _i7;
import '../result/model/resultmodel.dart' as _i11;
import '../result/pages/result_details.dart' as _i5;
import '../result/pages/result_home.dart' as _i3;
import '../result/pages/result_main.dart' as _i2;
import '../result/pages/save_user.dart' as _i4;
import '../skechpad/skechpad.dart' as _i6;
import 'routes.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AppMainRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AppMain());
    },
    ResultMainPageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ResultMainPage());
    },
    ResultHomePageRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ResultHomePage());
    },
    UserFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserFormScreenRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.UserFormScreen(args.finalcpga, key: args.key));
    },
    ResultDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ResultDetailsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ResultDetails(key: args.key, results: args.results));
    },
    DrawAppRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i6.DrawApp(),
          transitionsBuilder: _i10.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    },
    OcrPageRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.OcrPage(),
          transitionsBuilder: _i10.zoomInTransition,
          durationInMilliseconds: 400,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(AppMainRoute.name, path: '/'),
        _i8.RouteConfig(ResultMainPageRoute.name, path: '/result-main-page'),
        _i8.RouteConfig(ResultHomePageRoute.name, path: '/result-home-page'),
        _i8.RouteConfig(UserFormScreenRoute.name, path: '/user-form-screen'),
        _i8.RouteConfig(ResultDetailsRoute.name, path: '/result-details'),
        _i8.RouteConfig(DrawAppRoute.name, path: '/draw-app'),
        _i8.RouteConfig(OcrPageRoute.name, path: '/ocr-page')
      ];
}

/// generated route for [_i1.AppMain]
class AppMainRoute extends _i8.PageRouteInfo<void> {
  const AppMainRoute() : super(name, path: '/');

  static const String name = 'AppMainRoute';
}

/// generated route for [_i2.ResultMainPage]
class ResultMainPageRoute extends _i8.PageRouteInfo<void> {
  const ResultMainPageRoute() : super(name, path: '/result-main-page');

  static const String name = 'ResultMainPageRoute';
}

/// generated route for [_i3.ResultHomePage]
class ResultHomePageRoute extends _i8.PageRouteInfo<void> {
  const ResultHomePageRoute() : super(name, path: '/result-home-page');

  static const String name = 'ResultHomePageRoute';
}

/// generated route for [_i4.UserFormScreen]
class UserFormScreenRoute extends _i8.PageRouteInfo<UserFormScreenRouteArgs> {
  UserFormScreenRoute({required double finalcpga, _i9.Key? key})
      : super(name,
            path: '/user-form-screen',
            args: UserFormScreenRouteArgs(finalcpga: finalcpga, key: key));

  static const String name = 'UserFormScreenRoute';
}

class UserFormScreenRouteArgs {
  const UserFormScreenRouteArgs({required this.finalcpga, this.key});

  final double finalcpga;

  final _i9.Key? key;

  @override
  String toString() {
    return 'UserFormScreenRouteArgs{finalcpga: $finalcpga, key: $key}';
  }
}

/// generated route for [_i5.ResultDetails]
class ResultDetailsRoute extends _i8.PageRouteInfo<ResultDetailsRouteArgs> {
  ResultDetailsRoute({_i9.Key? key, required _i11.ResultListModel results})
      : super(name,
            path: '/result-details',
            args: ResultDetailsRouteArgs(key: key, results: results));

  static const String name = 'ResultDetailsRoute';
}

class ResultDetailsRouteArgs {
  const ResultDetailsRouteArgs({this.key, required this.results});

  final _i9.Key? key;

  final _i11.ResultListModel results;

  @override
  String toString() {
    return 'ResultDetailsRouteArgs{key: $key, results: $results}';
  }
}

/// generated route for [_i6.DrawApp]
class DrawAppRoute extends _i8.PageRouteInfo<void> {
  const DrawAppRoute() : super(name, path: '/draw-app');

  static const String name = 'DrawAppRoute';
}

/// generated route for [_i7.OcrPage]
class OcrPageRoute extends _i8.PageRouteInfo<void> {
  const OcrPageRoute() : super(name, path: '/ocr-page');

  static const String name = 'OcrPageRoute';
}
