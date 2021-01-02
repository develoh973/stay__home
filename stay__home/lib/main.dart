import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> mainTextList = ['친구', '가족', '연인'];
  String showText;

  @override
  Widget build(BuildContext context) {
    // mainTextList.sort();
    showText = mainTextList.elementAt(2);
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(20),
      //   child: AppBar(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0.0,
      //   ),
      // ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Color(0xffdce35b), Color(0xff45b649)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText(),
                _buildTimer(),
                // _builcAddButton(),
                _buildAddButtonGradient(),
                // _buildLocateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Container(
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Center(
            child: Container(
              color: Colors.black,
              width: 100,
              height: 100,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.placemark_fill),
            title: Container(child: Text('집 위치 설정')),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.chart_bar_fill),
            title: Container(
              child: Text('랭킹 확인')),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(CupertinoIcons.share_solid),
            title: Container(child: Text('공유하기')),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildText() {
    return Column(
      children: [
        SizedBox(height: 100),
        Text("🏡 Stay Home Challenge"),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$showText",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "를 위해 집에 있어 주세요.",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ],
    );
  }

  Widget _builcAddButton() {
    return CupertinoButton(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Icon(
            CupertinoIcons.add,
            color: Colors.white,
          ),
        ),
      ),
      onPressed: () {},
    );
  }

  Widget _buildAddButtonGradient() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Container(
        height: 50.0,
        width: 50.0,
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: _buildBottomSheet,
                isScrollControlled: false);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
          padding: EdgeInsets.all(0.0),
          child: Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffdce35b), Color(0xff45b649)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Icon(
                CupertinoIcons.add,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocateButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.placemark,
                      color: Colors.white,
                    ),
                    Text(
                      "집 위치 설정",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "일",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "21",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "시간",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "52",
              style: TextStyle(fontSize: 40),
            ),
            Text(
              "분",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
