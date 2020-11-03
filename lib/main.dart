import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to flutter',
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(750, 1334), allowFontScaling: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('一键看美女APP'),
      ),
      body: GirlInfo()
    );
  }
}

class GirlInfo extends StatefulWidget {

  @override
  State createState() {
    return GirlInfoState();
  }
}

class GirlInfoState extends State<GirlInfo> {
  
  var girUrl = '';
  var url = "https://uploadbeta.com/api/pictures/random/?key=%E6%8E%A8%E5%A5%B3%E9%83%8E";
    void updateGirl  () {

    setState(() {
      this.girUrl = this.url + '&time=${DateTime.now().millisecondsSinceEpoch}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
        child: Column(
          children: <Widget>[
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(

                  child: Text(
                      '换一张'
                  ),
                  onPressed: (){
                    this.updateGirl();

                  },
                ),

              ],
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
              child: Image.network(this.girUrl),
            )
          ],
        ),
      ),
    );
  }
}