import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boost/flutter_boost.dart';
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  // flutter 侧MethodChannel配置，channel name需要和native侧一致
  static const MethodChannel _methodChannel = MethodChannel('flutter_native_channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaisedButton(
              child: Text("pushNative"),
              onPressed: (){
                FlutterBoost.singleton.open('native').then((value){
                  print('call : $value');
                });

              }
          )
        ],
      ),
    );
  }
}
