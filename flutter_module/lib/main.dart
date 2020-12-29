import 'package:flutter/material.dart';
import 'package:flutter_module/page/first_page.dart';
import 'package:flutter_boost/flutter_boost.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FlutterBoost.singleton.registerPageBuilders(<String,PageBuilder>{
      'first' : (String pageName, Map<String, dynamic> params, String _) =>
          FirstPage(),

    });
    FlutterBoost.singleton.addBoostNavigatorObserver(TestBoostNavigatorObserver());

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boost example',
      builder: FlutterBoost.init(postPush: _onRoutePushed),
      home: FirstPage(),
    );
  }

  void _onRoutePushed(
      String pageName,
      String uniqueId,
      Map<String, dynamic> params,
      Route<dynamic> route,
      Future<dynamic> _,
      ) {}

}


class TestBoostNavigatorObserver extends NavigatorObserver {

  @override
  void didPush(Route route, Route previousRoute) {
    // TODO: implement didPush
    super.didPush(route, previousRoute);
    print('flutterboost#didPush');

  }
  @override
  void didPop(Route route, Route previousRoute) {
    // TODO: implement didPop
    super.didPop(route, previousRoute);
    print('flutterboost#didPop');
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    // TODO: implement didRemove
    super.didRemove(route, previousRoute);
    print('flutterboost#didPop');
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    // TODO: implement didReplace
    print('flutterboost#didReplace');
  }

}
