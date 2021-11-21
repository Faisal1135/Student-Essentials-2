import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:studentessentials/models/app_item.dart';
import 'package:studentessentials/routes/routes.gr.dart';
import './models/app_item.dart';

class AppMain extends HookWidget {
  const AppMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animcontrl = useAnimationController(
      duration: const Duration(seconds: 2),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Essentials'),
      ),
      body: GridView(
        padding: const EdgeInsets.only(top: 20, left: 12, right: 12),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: List.generate(
          AppItemModel.getAppitemsByContext(context).length,
          (index) {
            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animcontrl,
                curve: Interval(
                    (1 / AppItemModel.getAppitemsByContext(context).length) *
                        index,
                    1.0,
                    curve: Curves.fastOutSlowIn),
              ),
            );
            animcontrl.forward();
            return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget? child) {
                return FadeTransition(
                  opacity: animation,
                  child: Transform(
                    transform: Matrix4.translationValues(
                        0, 50 * (1.0 - animation.value), 0.0),
                    child: AppItemModel.getAppitemsByContext(context)
                        .map(
                          (item) => MainGridItem(item: item),
                        )
                        .toList()[index],
                  ),
                );
              },
            );
          },
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12.0,
          crossAxisSpacing: 12.0,
          childAspectRatio: 1.5,
        ),
      ),
    );
  }
}

class MainGridItem extends StatelessWidget {
  final AppItemModel item;
  const MainGridItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 10),
              Icon(
                item.iconData,
                size: 50,
                color: Colors.pink,
              ),
              const SizedBox(height: 5),
              Expanded(
                child: Text(item.title),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// HTTP Request
// 