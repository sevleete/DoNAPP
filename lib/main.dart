// 导入控件
import 'package:flutter/material.dart';
// 导入设备管理页面
import './pages/list.dart';

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
          title: const Text('设备列表'),
          centerTitle: true,
          // 右侧行为按钮
          actions: <Widget>[
            IconButton(
                onPressed: (){},
                icon: const Icon(Icons.search)
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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
