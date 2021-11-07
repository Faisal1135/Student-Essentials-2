import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive/hive.dart';

Box useBox<T>(String boxname) {
  return use(_OpenBoxHive(boxname: boxname));
}

class _OpenBoxHive extends Hook<Box> {
  final String boxname;

  const _OpenBoxHive({required this.boxname});

  @override
  __OpenBoxHiveState createState() => __OpenBoxHiveState();
}

class __OpenBoxHiveState extends HookState<Box, _OpenBoxHive> {
  late Box hivebox;

  @override
  void initHook() {
    super.initHook();

    Hive.openBox(hook.boxname).then((box) {
      setState(() {
        hivebox = box;
      });
    });
  }

  @override
  Box build(BuildContext context) {
    return hivebox;
  }

  @override
  void dispose() {
    hivebox.close();
    super.dispose();
  }
}
