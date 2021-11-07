import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Box<T>? useBox<T>(String boxname) {
  return use(_OpenBoxHive(boxname: boxname));
}

class _OpenBoxHive<T> extends Hook<Box<T>?> {
  final String boxname;

  const _OpenBoxHive({required this.boxname});

  @override
  __OpenBoxHiveState<T> createState() => __OpenBoxHiveState();
}

class __OpenBoxHiveState<T> extends HookState<Box<T>?, _OpenBoxHive<T>> {
  Box<T>? hivebox;

  @override
  void initHook() {
    super.initHook();
    if (!Hive.isBoxOpen(hook.boxname)) {
      Hive.openBox<T>(hook.boxname).then(
        (box) {
          setState(
            () {
              hivebox = box;
            },
          );
        },
      );
    } else {
      try {
        setState(() {
          hivebox = Hive.box(hook.boxname);
        });
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Box<T>? build(BuildContext context) {
    return hivebox;
  }

  @override
  void dispose() {
    hivebox?.close();
    super.dispose();
  }
}
