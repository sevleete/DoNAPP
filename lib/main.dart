// 导入控件
import 'package:flutter/material.dart';
// 导入设备管理页面
import './pages/list.dart';

import 'package:flutter_hms_scan_kit/flutter_hms_scan_kit.dart';
import 'package:flutter_hms_scan_kit/scan_result.dart';

// 入口函数
void main() {
  runApp(const MyApp());
}

// 无状态控件  有状态控件
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 每个项目最外层，必须有MaterialApp
    return MaterialApp(
      title: '零件加工指导应用程序',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // 指定首页
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget{
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // 导航条区域
        appBar: AppBar(
          title: const Text('加工助手'),
          centerTitle: true,
          // 右侧行为按钮
          actions: <Widget>[
            IconButton(
                onPressed: (){
                  gotoScan();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const ScanPage()),
                  // );
                },
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
            MyList(listTitle: 'equipment'),
          ],
        ),
      ),
    );
  }


}

class ScanPage extends StatelessWidget{

  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('二维码扫描'),
      ),
      // body: ,
    );
  }
}