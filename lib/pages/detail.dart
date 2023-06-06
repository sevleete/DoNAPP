import 'dart:convert';

import 'package:donapp/json/json_info.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PartDetail extends StatefulWidget {
  const PartDetail({super.key, required this.title, required this.imagePath, required this.index});
  final String title;
  final String imagePath;
  final int index;

  @override
  // ignore: library_private_types_in_public_api
  _PartDetailState createState() {
    return _PartDetailState();
  }
}
class _PartDetailState extends State<PartDetail> {
  final List partsChar = [
    [
      "🔹构成：航空盘类零件包括高压涡轮盘、高压压气机盘、低压涡轮盘及低压压气机盘。盘类零件结构一般由轮缘、腹板、轮毂、封严篦齿等组成",
      "🔹材料准备：航空发动机盘类部件主要采用高温合金、钛合金等材料",
      "🔹加工难点：材料难加工、尺寸精度高、表面质量要求严格、壁薄易变性，因此加工难度较大、尺寸精度和技术要求难以保证",
      "🔹加工部位：包括内外圆、前后端面、腹板、篦齿和榫槽等"
    ], [
      "🔹构成：航空盘类零件包括高压涡轮盘、高压压气机盘、低压涡轮盘及低压压气机盘。盘类零件结构一般由轮缘、腹板、轮毂、封严篦齿等组成",
      "🔹材料准备：航空发动机盘类部件主要采用高温合金、钛合金等材料",
      "🔹加工难点：材料难加工、尺寸精度高、表面质量要求严格、壁薄易变性，因此加工难度较大、尺寸精度和技术要求难以保证",
      "🔹加工部位：包括内外圆、前后端面、腹板、篦齿和榫槽等"
    ], [
      "🔹构成：航空发动机机匣按结构可分为环形机匣和异形机匣。环形机匣包括整体环形机匣和对开结构环形机匣两种结构。整体环形机匣由前后安装边、加强肋、安装座、安装槽和安装孔组成",
      "🔹材料准备：航空发动机机匣通常采用不锈钢、高温合金、钛合金、铝合金和复合材料等材料",
      "🔹加工难点：结构复杂、尺寸大、材料去除量大、加工周期长、刀具消耗大"
    ], [
      "🔹设计和模型制作：首先，需要进行设计和模型制作，确定门锁把手的形状和尺寸等细节。这可以使用计算机辅助设计软件（CAD）进行，然后使用计算机数控加工中心（CNC）等设备制作出实际的模型",
      "🔹材料准备：选择合适的材料进行加工，通常球形门锁把手使用不锈钢、铝合金等金属材料制作，需要对材料进行切割和切削等预处理",
      "🔹加工：根据模型，使用数控机床等设备对材料进行切削、铣削、打孔、磨削等加工工艺，将材料加工成为门锁把手的形状",
      "🔹表面处理：将加工好的门锁把手用自动抛光机进行打磨、抛光等表面处理工艺，使其表面光滑、美观，提高其耐腐蚀性和耐磨性",
      "🔹检验和组装：将加工好的门锁把手进行检验，包括尺寸、外观、强度等方面的检测，确保其质量符合标准要求。然后进行组装，将把手与门锁芯、门扣等配件组合起来，形成完整的门锁"
    ],[
    ],[
    ]
  ];

  final List partsEqu = [
    [
      "🔹数控车床",
      "🔹磨床"
    ],[
      "🔹数控车床",
      "🔹磨床"
    ],[
      "🔹四/五坐标加工中心",
      "🔹数控立车",
      "🔹数控钻镗床",
      "🔹四坐标卧式精密镗"
    ],[
      "🔹数控机床",
      "🔹铣床",
      "🔹抛光机"
    ],[
      "🔹车床"
    ],[
      "🔹金属熔炼炉",
      "🔹挤压机",
      "🔹阳极氧化设备"
    ]
  ];

  final List partsScrap = [
    [
      "🔹涡轮盘毛坯粉末冶金制备工艺过程中形成的内部残余应力，加工过程中材料残余应力导致变形"
    ],
    [
      "🔹叶片毛坯通过熔模铸造而成，通常将多组叶片同时浇铸，铸体结构复杂，铸造过程难以控制，成品可能存在铸造缺陷",
      "🔹目前，叶片的生产加工多是使用数控铣削的方法，但是由于叶片复杂的结构、工作环境以及材料的难加工性，叶片的生产加工具有很大的难度，切削时叶片容易产生变形"
    ],[
      "🔹毛坯铸造过程中可能存在缩松、缩孔等缺陷；电火花放电铣加工过程中的电热过程导致表面裂纹；多轴数控铣削过程中可能会发生由材料内应力导致的变形"
    ],
    [
      "🔹加工误差：球形门锁把手零件的加工误差过大，无法满足设计要求，导致零件报废",
      "🔹表面缺陷：球形门锁把手零件表面存在缺陷、划痕、氧化等问题，导致零件外观质量差，无法使用或者无法满足设计要求",
      "🔹材料问题：球形门锁把手零件的材料存在缺陷、损伤等问题，导致零件性能下降或者无法使用",
      "🔹运输损伤：球形门锁把手零件在运输过程中受到撞击、挤压等损伤，导致零件报废或者无法使用",
      "🔹设计问题：球形门锁把手零件设计存在缺陷或者不合理，导致零件无法满足使用要求或者无法加工"
    ],[
    ],[
    ]
  ];

  final List partsRecycle = [
    [
      "🔹零件材料回收；再制造（激光熔覆修复）"
    ],
    [
      "🔹零件材料回收；再制造（增材、焊接、切削、磨抛）"
    ],[
      "🔹毛零件材料回收；再制造（焊接、激光熔覆修复等）"
    ],
    [
      "🔹重新加工利用：将报废的零件重新加工，消除缺陷，使其符合要求后再次利用，可以有效地节约原材料和生产成本，提高经济效益",
      "🔹原材料回收：将报废的零件进行分解，将可回收的原材料进行回收，如铁、铜、铝等金属材料，可以再次利用，节约原材料和能源，降低环境污染",
      "🔹节约原材料和生产成本：通过重新加工利用和原材料回收，可以避免浪费和损失，提高资源利用效率和生产效率，降低成本",
      "🔹减少环境污染和资源浪费：通过回收处理，可以避免废弃物的不当处理造成的环境污染和资源浪费，保护环境和公共利益",
      "🔹增加附加值和收入：通过回收处理，可以将废弃物转化为可再利用的资源，创造附加值和收入"
    ],[
    ],[
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: const TabBar(
              labelStyle: TextStyle(height: 0,fontSize: 16),
              tabs: [
                Tab(text: "详情"),
                Tab(text: "报废与回收"),
              ]),
        ),
        body: TabBarView(
            children: [
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset(
                        widget.imagePath,
                        width: 320,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black26))),
                      child: const Text('加工特点:', style: TextStyle(fontSize: 20, color: Colors.orange)),
                    ),
                    Expanded(
                        child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                        child: ListView.builder(
                            itemCount: partsChar[widget.index].length,
                            itemBuilder: (BuildContext ctx, int i){
                              return Text(
                                  partsChar[widget.index][i],
                                  style: const TextStyle(fontSize: 18, color: Colors.black87)
                              );
                            }
                        )
                      )
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black26))),
                      child: const Text('加工设备:', style: TextStyle(fontSize: 20, color: Colors.orange)),
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            height: 100,
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: ListView.builder(
                                itemCount: partsEqu[widget.index].length,
                                itemBuilder: (BuildContext ctx, int i){
                                  return Text(
                                      partsEqu[widget.index][i],
                                      style: const TextStyle(fontSize: 18, color: Colors.black87)
                                  );
                                }
                            )
                        )
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Image.asset(
                        widget.imagePath,
                        width: 320,
                        height: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black12))),
                      child: const Text('零件报废原因:', style: TextStyle(fontSize: 20, color: Colors.orange)),
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                            child: ListView.builder(
                                itemCount: partsScrap[widget.index].length,
                                itemBuilder: (BuildContext ctx, int i){
                                  return Text(
                                      partsScrap[widget.index][i],
                                      style: const TextStyle(fontSize: 18, color: Colors.black87)
                                  );
                                }
                            )
                        )
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black12))),
                      child: const Text('零件回收:', style: TextStyle(fontSize: 20, color: Colors.orange)),
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            height: 100,
                            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                            child: ListView.builder(
                                itemCount: partsRecycle[widget.index].length,
                                itemBuilder: (BuildContext ctx, int i){
                                  return Text(
                                      partsRecycle[widget.index][i],
                                      style: const TextStyle(fontSize: 18, color: Colors.black87)
                                  );
                                }
                            )
                        )
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}


class EquipmentDetail extends StatefulWidget {
  const EquipmentDetail({super.key, required this.title, required this.imagePath, required this.index});
  final String title;
  final String imagePath;
  final int index;

  @override
  // ignore: library_private_types_in_public_api
  _EquipmentDetailState createState() {
    return _EquipmentDetailState();
  }
}
class _EquipmentDetailState extends State<EquipmentDetail> {
  final List equipmentMatters = [
    [
      "🔹操作人员应穿紧身合适的布料防护服，即按本工种规定着装；严禁佩戴手套；留有长发时要戴防护帽",
      "🔹操作者应佩戴防打击的护目镜",
      "🔹开动机床前要详细检查机床上危险部件的防护装置是否安全可靠，电机上接地线是否完整有效，发现异常要及时维修，严禁带隐患操作",
      "🔹润滑机床，并做空载试验",
      "🔹使用卡盘扳子卡活找正时，先关闭电源并将床头挂轮手柄搬到空档位置，紧活时要双腿叉开，用缓力将活卡牢固，不要用力过猛",
      "🔹在机床转动时，禁止用手调整机床和测量工件；禁止用手触摸机床的旋转部位；禁止取下安装护板或防护装置。不要用手清除切屑，而应用钩子、刷子或专门工具清除切屑",
      "🔹操作时要站在机床侧面，严禁用手摸、扶、按转动工件或隔着转动工件取送物件，不准戴手套操作",
      "🔹机床运转时，操作者不能离开工作地点。发现机床运转不正常时，应立即停车，请检修工检查。当停止供电时，要立即关闭机床或其他电动机构，并把刀具退出工作部位",
      "🔹高速切削时，必须戴好防护眼镜，对切削下来的或缠在卡盘工件上的铁屑，要停车后除掉，严禁用手和油刷除屑",
      "🔹加工中的走、进、吃刀量不准超过机床最大负荷，严禁用手扶工件操作",
      "🔹加工完的工件，要放在安全位置，并摆放整齐、平稳，严禁将工件落得过高或摆放在安全通道以及床头上",
      "🔹工作结束应关闭机床和电动机，拉下电源开关,把刀具和工件从工作位退出，清理机床、物件、工具和铁屑，并做好下班前各项工作"
    ], [
      "🔹操作前要穿紧身防护服，袖口扣紧，上衣下摆不能敞开，严禁戴手套，不得在开动的机床旁穿、脱换衣服，或围布于身上，防止机器绞伤。必须戴好安全帽，辫子应放入帽内，不得穿裙子、拖鞋。戴好防护镜:以防铁屑飞溅伤眼，并在机床周围安装挡板使之与操作区隔离",
      "🔹工件装夹前，应拟定装夹方法。装夹毛坯件时，台面要垫好，以免损伤工作台",
      "🔹工作台移动时要检查紧固螺丝应打开，工作台不移动时紧固螺丝应紧上",
      "🔹刀具装卸时，应保持铣刀锥体部分和锥孔的清洁，并要装夹牢固。高速切削时必须戴好防护镜。工作台不准堆放工具，零件等物，注意刀具和工件的距离，防止发生撞击事故",
      "🔹安装铣刀前应检查刀具是否对号、完好，铣刀尽可能靠近主轴安装，装好后要试车。安装工件应牢固",
      "🔹工作时应先用手进给，然后逐步自动走刀。运转自动走刀时，拉开手轮，注意限位挡块是否牢固，不准放到头，不要走到两极端而撞坏丝杠：使用快速行程时，要事先检查是否会相撞等现象，以免碰坏机件、铣刀碎裂飞出伤人。经常检查手摇把内的保险弹簧是否有效可靠",
      "🔹切削时禁止用手摸刀刃和加工部位。测量和检查工件必须停车进行，切削时不准调整工件",
      "🔹主轴停止前，须先停止进刀。如若切削深度较大时，退刀应先停车，挂轮时须切断电源，挂轮间隙要适当，挂轮架背母要紧固，以免造成脱落;加工毛坯时转速不宜太快，要选好吃刀量和进给量",
      "🔹发现机床有故障，应立即停车检查并报告建设与保障部派机修工修理。工作完毕应做好清理工作，并关闭电源"
    ], [
      "🔹在使用抛光机之前，应该先准备好所有必要的材料，这些材料包括抛光剂、抛光机、抛光布、防护服以及眼镜、手套等个人防护装备",
      "🔹使用抛光机前应该先清洁待处理的表面。如果表面上有油污或者灰尘，那么抛光机处理起来就会更加困难。因此，在使用抛光机之前，应该先将表面清洁干净",
      "🔹在使用抛光机之前，需要将抛光剂涂在表面上，让其均匀分布。使用抛光机时，抛光剂的质量应该与待处理表面的硬度匹配，过硬的抛光剂会使加工表面受到损害，而过软的抛光剂则可能造成抛光效果不佳",
      "🔹打开抛光机的开关，使其旋转起来。将抛光布贴在抛光盘上，并将其压到待处理表面上。将抛光机平放，使抛光布与待加工表面的角度大约为45度。然后，轻轻地握住抛光机的手柄，开始进行抛光处理",
      "🔹在进行抛光机处理时，要注意避免对加工表面过度施力。这可能会导致表面受到损伤，或者产生划痕。此外，还应该注意抛光剂的数量，过量的抛光剂会使加工表面过于光滑，导致抛光效果不佳",
      "🔹在使用抛光机时，应该佩戴耳塞，眼镜和手套等保护装备。这可以有效避免产生粉尘和噪音等多种因素可能会对身体造成的伤害",
      "🔹如果您是第一次使用抛光机，那么最好找一位经验丰富的人来指导你。因为操作不当可能会导致安全问题，也可能会造成不必要的损失",
      "🔹选择抛光机时，应该考虑其可靠性，能存活多长时间和生产效率等因素，并在使用前进行适当的旋转和维护",
      "🔹抛光剂的质量对成品表面的质量有着重要的影响。因此，在使用抛光机时应该选择优质的抛光剂，确保成品的表面质量"
    ], [
      "🔹遵守铣镗工一般安全操作规程，按规定穿戴好劳动保护用品",
      "🔹检查操作手柄、开关、旋钮、夹具机构、液压活塞的联结是否处在正确位置，操作是否灵活，安全装置是否齐全、可靠",
      "🔹检查镗床的润滑系统是否正常，油路有无堵塞，切削油中是否有异物变质",
      "🔹检查机床各轴有效运行范围内是否有障碍物",
      "🔹严禁超性能使用机床。按工件材料选用全理的切削速度和进给量",
      "🔹装卸较重的工件时，必须根据工件重量和形状选用合理的吊具和吊装方法",
      "🔹主轴转动，移动时，严禁用手触摸主轴及安装在主轴端部的刀具",
      "🔹更换刀具时，必须先停机，经确认后才能更换，更换时应该注意刀刃的伤害",
      "🔹禁止踩踏设备的导轨面及油漆表面或在其上面放置物品。严禁在工作台上敲打或校直工件",
      "🔹对新的工件在输入加工程序后，必须检查程序的正确性，模拟运行程序是否正确，未经试验不允许进行自动循环操作，以防止机床发生故障",
      "🔹使用平旋径向刀架单独切削时，应先把镗杆退回至零位，然后再换到平旋盘方式，另外须确保手动夹紧装置已经松开",
      "🔹在工作中需要旋工作台时，应确保其在旋转时不会碰到机床的其它部件，也不能碰到机床周围的其它物体",
      "🔹机床运行时，禁止触碰旋转的丝轴、光杆、主轴、平旋盘周围，操作者不得停留在机床的移动部件上",
      "🔹机床运转时操作者不准擅自离开工作岗位或托人看管",
      "🔹机床运行中出现异常现象及响声，应立即停机，查明原因，及时处理",
      "🔹当机床的主轴箱，工作台处于或接近运动极限位置，操作者不得进入加工区域",
      "🔹机床关机时，须将工作台退至中间位置，镗杆退回，然后退出操作系统，最后切断电源",
      "🔹工作前应认真检查夫具及锁紧装置是否完好正常",
      "🔹调整镗床时应注意：升降镗床主轴箱之前，要先松开立柱上的夹紧装置，否则会使镗杆弯曲及夹紧装置损坏而造成伤害事故；装镗杆前应仔细检查主轴孔和镗杆是否有损伤，是否清洁，安装时不要用锤子和其它工具敲击镗杆，迫使镗杆穿过尾座支架",
      "🔹工件夹紧要牢固，工作中不应松动",
      "🔹工作开始时，应用手进给进，使刀具接进加工部位时，再用机动进给",
      "🔹当工具在工作位置时不要停车或开车，待其离开工作位置时，现开车或停车",
      "🔹机床运转时，切勿将手伸过工作台；在检验工件时，如手有碰刀其的危险，应在检查之前将刀其退到安全位置",
      "🔹大型镗床应设有梯子或台阶，以便于工人操作和观察。梯子坡度不应大于50度，并设有防滑脚踏板"
    ],[
      "🔹作业前要穿戴好一切劳动保护用品",
      "🔹入炉操作所使用的各种耙、铲、取样勺、净化管等铁制工具使用前必须要经过充分预热后方可使用",
      "🔹配料所使用的铝锭和中间合金及入炉的部分工艺废料，如果受潮时，必须先进行充分预热后方可再加入炉内铝水中",
      "🔹要正确指挥引导出铝运输车进入和退出作业场所。天车挂钩吊包时，如需人工协助时，只允许手托钩头下部外侧，以防止挤伤发生",
      "🔹铝水抬包向炉流槽中倾倒铝液时，要操作平稳、缓慢进行，严禁快速倾倒铝液，以防铝液溅出伤人",
      "🔹向熔炼炉或静置炉内铝液中加入固体铝时，一定要戴好眼镜，两米以内不准有人观看和通过。加入的固体铝必须干燥，而且应沿炉门内斜坡徐徐加入",
      "🔹从炉内向外扒渣时，扒出的渣子要放入渣箱中吊走或扒出后立即摊开降温，以防止渣子燃烧",
      "🔹不允许在天车吊物下面站立或通行，听到天车铃响，应立即躲闪"
    ],[
      "🔹检查设备是否正常，机器各运作件是否在原位，滑板的润滑情况，感应装置行程开关是否动作，紧固件（镙丝）等是否松动，循环冷却水是否开启，油位是否够，油温是否正常，油泵有无异声，工进速度是否正常，动作转换是否正常",
      "🔹检查棒炉情况（参照第1条），检查挤压中心线，检查挤压筒的加热情况，加热仪表波动情况。牵引机，料床，后部设备运转情况。各种操作工装具维修五金工具（模，垫，压饼，压板，夹子，榔头，钳子，板手，起子，镙丝刀，撬棍，隔热毛条，整形工具等）是否在工作现场固定位置，行车，模具加热炉是否正常。各种淬火冷却风机是否运转。各种测量工具是否完备正确",
      "🔹现场是否有无关闲杂人员，是否有维修保养人员，是否有参观考察人员，是否有新进学习人员，应根据实际情况以安全第一为原则分别对相关人员进行劝阻，询问，提示，预防，解说，培训，指导，示范等，对无领导作陪的外来人员必要时作好保密工作。统筹按排生产，班组人员，注意各工序间的连接有序",
      "🔹了解生产内容，生产要求，生产顺序，生产时作好相应的真实数据记录，字迹条理清晰，标淸生产日期，做到可核查，可追溯，可借鉴，可引用。对生产型材的图纸，表单，资料，文件等要预先准备并熟知于胸"
    ],[
      "🔹生产过程中使用的吊具应保持导电顺畅良好",
      "🔹阳极氧化铝的生产和加工应配备制冷装置，并采用与压缩空气混合的处理方法",
      "🔹在对铝合金型材进行阳极氧化之前，清洁之前使用的夹具。去除夹具表面的残留氧化膜，以确保在使用过程中与铝条保持良好接触",
      "🔹注意阳极氧化溶液的温度范围应适配型材材料",
      "🔹在阳极氧化铝合金型材的生产过程中，应保证夹具的导电接触面积，夹具的压痕应尽可能小",
      "🔹对于不同材料制成的铝合金型材，纯铝、铝和不同规格和尺寸的铝合金，应单独处理，不得在同一氧化槽中加工"
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Image.asset(
                widget.imagePath,
                width: 320,
                height: 320,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: const BoxDecoration(border: Border(top: BorderSide(width: 2, color: Colors.black12))),
              child: const Text('设备注意事项:', style: TextStyle(fontSize: 20, color: Colors.orange)),
            ),
            Expanded(
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: ListView.builder(
                        itemCount: equipmentMatters[widget.index].length,
                        itemBuilder: (BuildContext ctx, int i){
                          return Text(
                              equipmentMatters[widget.index][i],
                              style: const TextStyle(fontSize: 18, color: Colors.black87)
                          );
                        }
                    )
                )
            ),
          ],
        ),
      )
    );
  }
}