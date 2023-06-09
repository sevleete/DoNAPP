import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import './detail.dart';

Dio dio = Dio();

// 有状态控件
class MyList extends StatefulWidget{
  // 设置required 要求必须传参数
  const MyList({super.key, required this.listTitle});

  // 列表类型
  final String listTitle;

  @override
  // ignore: library_private_types_in_public_api
  _MyListState createState() {
    return _MyListState();
  }
}

// 有状态控件，必须结合一个状态管理类来进行实现
class _MyListState extends State<MyList> with AutomaticKeepAliveClientMixin{
  final List partsImgList = [
    'images/parts/plate.png',
    'images/parts/blade.png',
    'images/parts/cartridge_receiver.png',
    'images/parts/handle.png',
    'images/parts/flange.png',
    'images/parts/aluminium_alloy.png'
  ];

  final List partsNameList = [
    '航空发动机盘类部件',
    '航空发动机叶片',
    '航空发动机机匣',
    '球形门把手',
    '法兰盘',
    '铝合金型材'
  ];

  final List equipmentsImgList = [
    'images/equipments/lathe.jpg',
    'images/equipments/milling_machine.jpg',
    'images/equipments/polisher.jpg',
    'images/equipments/NC_boring_mill.png',
    'images/equipments/smelting_furnace.jpg',
    'images/equipments/extruder.jpg',
    'images/equipments/anodize.jpg'
  ];

  final List equipmentsNameList = [
    '车床',
    '铣床',
    '抛光机',
    '数控镗床',
    '金属熔炼炉',
    '挤压机',
    '阳极氧化设备'
  ];

  @override
  bool get wantKeepAlive => true;

  // 渲染 MyList 控件的UI结构
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // return Text('列表 --- ${widget.listTitle}');
    return WaterfallFlow.builder(
      padding: EdgeInsets.zero,
      gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,      // 一行两个数据
        crossAxisSpacing: 8,
        mainAxisSpacing: 10,
        lastChildLayoutTypeBuilder: (index) => index == 20
            ? LastChildLayoutType.foot
            : LastChildLayoutType.none,
      ),
      itemCount: widget.listTitle == 'parts' ? 6 : 7,  // 瀑布流数量
      itemBuilder: (BuildContext context, int index) {
        // 返回瀑布流item子控件
        if (widget.listTitle == 'parts'){
          return waterfallItem(context, partsImgList, partsNameList, index);
        }
        else if (widget.listTitle == 'equipments'){
          return waterfallItem(context, equipmentsImgList, equipmentsNameList, index);
        }
        else{
          return waterfallItem(context, equipmentsImgList, equipmentsNameList, index);
        }
      }
    );
  }

  Widget waterfallItem(BuildContext context, List imgList, List nameList, int index){
    String imgPath = imgList[index];
    String imgName = nameList[index];
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx){
          if (widget.listTitle == 'parts'){
            return PartDetail(title: imgName, imagePath: imgPath, index: index);
          }
          else{
            return EquipmentDetail(title: imgName, imagePath: imgPath, index: index);
          }
        }));
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        child: Container(
          alignment: Alignment.center,
          color: const Color(0xFFF7F7F7),
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                imgPath,
                fit: BoxFit.cover,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(nameList[index]),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: const Text("郭琦", style: TextStyle(fontSize: 12, color: Color(0xFF999999)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}