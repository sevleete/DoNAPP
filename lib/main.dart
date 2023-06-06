// 导入控件
import 'dart:ui';

import 'package:donapp/pages/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_echart/flutter_echart.dart';
// 导入设备管理页面
import './pages/list.dart';

import 'package:flutter_hms_scan_kit/flutter_hms_scan_kit.dart';
import 'package:flutter_hms_scan_kit/scan_result.dart';

// 入口函数
void main() {
  runApp(const MyApp());
}

// 无状态控件  有状态控件
class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  ScanResult? _scanResult;
  List<int>? _code;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await FlutterHmsScanKit.platformVersion ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 每个项目最外层，必须有MaterialApp
    return MaterialApp(
      title: '零件加工指导应用程序',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // 指定首页
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          // 导航条区域
          appBar: AppBar(
            title: const Text('加工助手'),
            centerTitle: true,
            // 右侧行为按钮
            actions: <Widget>[
              IconButton(
                  onPressed: scan,
                  icon: const Icon(Icons.crop_free)
              )
            ],
          ),
          // 侧边栏区域
          drawer: Drawer(
            child: ListView(
              padding: const EdgeInsets.all(0), // 设置上下左右padding
              children: const <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text('坤坤'),
                  accountEmail: Text('jinitaimei@kunkun.com'),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/user/kunkun.jpg'),
                  ),
                  // 美化当前控件
                  decoration: BoxDecoration(
                    // 背景图片
                      image: DecorationImage(
                          fit: BoxFit.cover, // 设置充满区域
                          image: AssetImage('images/user/kunkun_background.png')
                      )
                  ),
                ),
                ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings),),
                ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback),),
                // 分割线
                Divider(
                    height: 5,
                    thickness: 2
                ),
                ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app),)
              ],),
          ),
          // 底部tabBar
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(color: Colors.black12),
            height: 50,
            child: const TabBar(
              labelStyle: TextStyle(height: 0,fontSize: 8), // 设置文本不占高度
              tabs: <Widget>[
                // 零件识别回收
                Tab(icon: Icon(Icons.miscellaneous_services)),
                // 设备管理
                Tab(icon: Icon(Icons.home)),
                // 成本评估
                Tab(icon: Icon(Icons.analytics)),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              MyList(listTitle: 'parts'),
              MyList(listTitle: 'equipments'),
              valueAssess(),
            ],
          ),
        ),
      )
    );
  }

  Future<void> scan() async {
    // _scanResult = await FlutterHmsScanKit.scan;
    _scanResult = await FlutterHmsScanKit.startScan(
      isToastDebug: false,
    );
    setState(() {});
  }
}

// ignore: camel_case_types
class valueAssess extends StatelessWidget{
  const valueAssess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParticularPage(index: 0)));
                  },
                  child: const Text('零件识别记录 -- 1（2023/06/01）', style: TextStyle(fontSize: 20, color: Colors.black87))
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParticularPage(index: 1)));
                  },
                  child: const Text('零件识别记录 -- 2（2023/06/02）', style: TextStyle(fontSize: 20, color: Colors.black87))
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: OutlinedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ParticularPage(index: 2)));
                  },
                  child: const Text('零件识别记录 -- 3（2023/06/02）', style: TextStyle(fontSize: 20, color: Colors.black87))
              ),
            ),
          ],
        ),
      ),
    );
  }

}



class ParticularPage extends StatelessWidget{
  const ParticularPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('零件详情'),
      ),
      body: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Image.asset(
                  'images/particular/flange.png',
                  width: 320,
                  height: 320,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black12))),
                    child: Row(
                      children: [
                        Container(
                          height: 300,
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text('零件名称', style: TextStyle(fontSize: 20, color: Colors.black87)),
                              Text('零件编号', style: TextStyle(fontSize: 20, color: Colors.black87)),
                              Text('检测结果', style: TextStyle(fontSize: 20, color: Colors.black87)),
                              Text('等级', style: TextStyle(fontSize: 20, color: Colors.black87)),
                              Text('出厂时间', style: TextStyle(fontSize: 20, color: Colors.black87)),
                              Text('报废建议', style: TextStyle(fontSize: 20, color: Colors.black87)),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                          height: 300,
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: _buildResult(context, index),
                          ),
                        ))
                      ],
                    )
                ),
              )
            ],
          )
      ),
    );
  }

  List<Widget> _buildResult(BuildContext ctx, int index){
    switch(index){
      case 0:
        return <Widget>[
          const Text('莫氏2号-100回转法兰盘', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('CFL0001', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('合格', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('一等品', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('2023.05.12', style: TextStyle(fontSize: 20, color: Colors.black87)),
          GestureDetector(
            onTap: () {
              Navigator.push(
                ctx,
                MaterialPageRoute(builder: (context) => AssessPage()),
              );
            },
              child: const Text('合格(点击查看详情)', style: TextStyle(fontSize: 20, color: Colors.lightGreen))
          )
        ];
      case 1:
        return <Widget>[
          const Text('莫氏2号-100回转法兰盘', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('CFL0002', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('表面有破口', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('不合格', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('2023.05.12', style: TextStyle(fontSize: 20, color: Colors.black87)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (context) => AssessPage()),
                );
              },
              child: const Text('不合格(点击查看详情)', style: TextStyle(fontSize: 20, color: Colors.red))
          )
        ];
      case 2:
        return <Widget>[
          const Text('莫氏2号-100回转法兰盘', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('CFL0003', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('卡盘连接处裂痕 不合格', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('不合格', style: TextStyle(fontSize: 20, color: Colors.black87)),
          const Text('2022.07.15', style: TextStyle(fontSize: 20, color: Colors.black87)),
          GestureDetector(
              onTap: () {
                Navigator.push(
                  ctx,
                  MaterialPageRoute(builder: (context) => AssessPage()),
                );
              },
              child: const Text('回收再制造(点击查看详情)', style: TextStyle(fontSize: 20, color: Colors.orangeAccent))
          )

        ];
      default:
        return const <Widget>[
          Text('零件名称', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Text('零件编号', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Text('检测结果', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Text('等级', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Text('出厂时间', style: TextStyle(fontSize: 20, color: Colors.black87)),
          Text('报废建议', style: TextStyle(fontSize: 20, color: Colors.black87)),
        ];
    }
  }
}

class AssessPage extends StatelessWidget{
  AssessPage({super.key});

  final List<EChartPieBean> _dataList = [
    EChartPieBean(title: "全部报废\n182.31元", number: 182, color: Colors.lightBlueAccent),
    EChartPieBean(title: "回收处理\n196.33元", number: 196, color: Colors.deepOrangeAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('成本评估'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text('莫氏2号-100回转法兰盘', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(
                'images/particular/flange.png',
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('等级', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('一等品', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('二等品', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('不合格(可回收)', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 2 / 5,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 2, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('不合格(报废)', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('百分比(%)', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('94.3', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('3.6', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('1.2', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 2, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('0.9', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 2, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('单件收益(元)', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('195', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('140', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 1, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('20', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 1, color: Colors.black12),
                            right: BorderSide(width: 1, color: Colors.black12),
                            bottom: BorderSide(width: 2, color: Colors.black12),
                            left: BorderSide(width: 1, color: Colors.black12),
                          )
                      ),
                      child: const Text('-315', style: TextStyle(fontSize: 18, height: 1.5, color: Colors.black87)),
                    )
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                child: PieChatWidget(
                  dataList: _dataList,
                  //是否需要背景
                  isBackground: true,
                  //是否画直线
                  isLineText: true,
                  // 背景
                  bgColor: Colors.white,
                  //是否显示最前面的内容
                  isFrontgText: true,
                  //默认选择放大的块
                  initSelect: -2,
                  //初次显示以动画方式展开
                  openType: OpenType.ANI,
                  //旋转类型
                  loopType: LoopType.DOWN_LOOP,
                  //点击回调
                ),
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              child: const Text('每万件额外收益14万元', style: TextStyle(fontSize: 24, height: 1.6, color: Colors.black87)),
            )
          ],
        )
      ),
    );
  }
}