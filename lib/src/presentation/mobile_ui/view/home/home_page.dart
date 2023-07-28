import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:ccts/src/data/json_asset/blog_data.dart';
import 'package:ccts/src/data/json_asset/user_data.dart';
import 'package:ccts/src/presentation/mobile_ui/view/add_post/post_details_page.dart';
import 'package:ccts/src/presentation/mobile_ui/view/auth_screens/login_and_register.dart';
import 'package:ccts/src/presentation/mobile_ui/view/cost_estimation/cost_estimation.dart';
import 'package:ccts/src/presentation/mobile_ui/view/home/drawer.dart';
import 'package:ccts/src/presentation/mobile_ui/view/home/portfolio_detail.dart';
import 'package:ccts/src/presentation/mobile_ui/view/project_page/add_project.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/blog_tile.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/contractor_tile.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_appbar.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_button.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/custom_dialog_box.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/engineer_tile.dart';
import 'package:ccts/src/presentation/mobile_ui/widgets/land_converter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  final String? registerId;
  const HomePage({super.key, this.registerId});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  //for view all and view less
  bool viewAll = false; 
  bool blogViewAll = false;

  //text controllers
  final TextEditingController ropaniController =  TextEditingController();
  final TextEditingController annaController =  TextEditingController();
  final TextEditingController paisaController =  TextEditingController();
  final TextEditingController dhurController =  TextEditingController();
  final TextEditingController daamController =  TextEditingController();
  final TextEditingController kathaController =  TextEditingController();
  final TextEditingController bighaController =  TextEditingController();
  final TextEditingController sqMeterController = TextEditingController();
  final TextEditingController sqFeetController = TextEditingController();

  double ropaniValue = 0.0;
  double aanaValue = 0.0; 
  double paisaValue = 0.0;
  double damValue = 0.0;
  double bighaValue = 0.0; 
  double katthaValue = 0.0;
  double dhurValue = 0.0;
  double sqFeetValue = 0.0;
  double sqMeterValue = 0.0;

  //User Data List
  List userInfoList = [];

  //Get Currenet User Data
  getUserData(){
    for(var data in userData){
      if(data["userId"] == widget.registerId){
        userInfoList.add(data);
        setState(() {  });
      }
    }
  }

  registerDialogue(){
    if(userInfoList[0]['isRegistered']==false){
      showDialog(context: context, builder: (BuildContext context) =>  
        CustomDialog(
          onOkpressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const LoginAndRegister(indx: 1,)))); 
          },
        )
      );
    }
  }
  
  @override
  void initState() {
    getUserData();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>  registerDialogue());
  }

  @override
  void dispose() {
    ropaniController.dispose();
    annaController.dispose();
    paisaController.dispose();
    daamController.dispose();
    bighaController.dispose();
    kathaController.dispose();
    dhurController.dispose();
    sqMeterController.dispose();
    sqFeetController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        key: _key,
        backgroundColor: scaffoldBg, 
        appBar: customAppBar(context, "CCTS", false, true , _key, widget.registerId),
        drawer: const HomeDrawer(),
        floatingActionButton: userInfoList[0]["isRegistered"] == true ? SizedBox(
          height: 55.h,
          width: 55.h,
          child: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddProject()));
            },
            backgroundColor: const Color.fromARGB(255, 88, 156, 211),
            child: const Icon(Icons.add, size: 26,),
          ),
        ) : const SizedBox(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:14.0.w, vertical: 20.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addvertise(),
                SizedBox(height: 22.0.h,),
                landConverter(),
                SizedBox(height: 37.0.h,),
                calculateCost(),
                SizedBox(height: 34.0.h,),
                contractorDetail(),
                SizedBox(height: 10.0.h,),
                enginnersDetail(),
                SizedBox(height: 34.0.h,),
                blogSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //view advertise
  addvertise() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0.r),
      child: Image.asset(
        "assets/img/ad.png",
        height: 200.h,
        width: 370.w,
        fit: BoxFit.fill,
      ),
    );
  }

  //Cost Calculation
  calculateCost(){
   return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0.r),
            child: Container(
              padding: EdgeInsets.only(bottom: 25.0.h),
              color: const Color(0xff3ED598),
              width: 158.w,
              height: 205.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Calculate \nOverall Cost \nEstimation", 
                  style: roboto(white, 20, 0.0, FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const CostEstimation())));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0.r),
            child: Container(
              padding: EdgeInsets.only(bottom: 25.0.h),
              color: red,
              width: 158.w,
              height: 205.h,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  "Calculate \nCost Estimation \nby Category", 
                  style: roboto(white, 20, 0.0, FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    ); 
  }

  //land converter
  landConverter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("LAND CONVERTER", style: roboto(black, 16.0, 0.0),),
            const Spacer(),
            GestureDetector(
              onTap: (){
                ropaniController.clear();
                annaController.clear();
                paisaController.clear();
                daamController.clear();
                bighaController.clear();
                kathaController.clear();
                dhurController.clear();
                sqFeetController.clear();
                sqMeterController.clear();
              },
              child: SizedBox(
                width: 40.w,
                height: 25.h,
                child: Center(
                  child: Text("Reset", style: roboto(const Color.fromARGB(255, 88, 156, 211), 14, 0.0),)
                )
              ),
            )
          ],
        ),
        SizedBox(
          height: 15.0.h,
        ),
        Text("Ropani", style: roboto(black, 14.0, 0.0),),
        SizedBox(
          height: 8.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LandConverterWidget(
              hintText: data1[0],
              textController: ropaniController,
              onChange: (val) {
                //to set 0 when ntg is inserted
                setZero();
                setState(() {
                  aanaValue =  double.parse(annaController.text == "" ? "0.0" : annaController.text) / 16;
                  damValue =  double.parse(daamController.text == "" ? "0.0" : daamController.text) / 256;
                  paisaValue =  double.parse(paisaController.text == "" ? "0.0" : paisaController.text) / 64;

                  ropaniValue = val == "" ? 0.0 : double.parse(val);
                  //add all value to convert in ropani
                  final ropani = ropaniValue+ aanaValue+ paisaValue+ damValue;
                  //convert to bigha from ropani
                  final bigha = ropani * 0.075116598079561;
                  var convertBigha = bigha.toString().split('.');
                  bighaController.text = convertBigha[0].toString();
                  var katthavalue = '0.${convertBigha[1]}';
                  // coverting biggha to katha 
                  var convertedkathhavalue = double.parse(katthavalue)*20;
                  var dhurvalue =convertedkathhavalue.toString().split('.');
                  kathaController.text = dhurvalue[0].toString();
                  var dhurvalue2 = '0.${dhurvalue[1]}';
                  // converting kattha to dhur
                  var dhurvalue1= double.parse(dhurvalue2)*20;
                  dhurController.text = dhurvalue1.toStringAsFixed(2);
                  //converting kattha to sqaure meter
                  sqMeterController.text = (ropani * 508.74).toStringAsFixed(2);
                  //converting kattha to square feet
                  sqFeetController.text = (ropani * 5476).toStringAsFixed(2);
                });
              },
            ),
            LandConverterWidget(
              hintText: data1[1],
              textController: annaController,
              onChange: (val) {
                setZero();
                setState(() {
                  paisaValue =  double.parse(paisaController.text == "" ? "0.0" : paisaController.text) / 64;
                  damValue =  double.parse(daamController.text == "" ? "0.0" : daamController.text) / 256;
                  ropaniValue =  double.parse(ropaniController.text == "" ? "0.0" : ropaniController.text);

                  final annaVal = val == "" ? 0.0 : double.parse(annaController.text);
                  //convert anna to ropani
                  aanaValue = annaVal / 16;
                  //add all value to convert in ropani
                  final anna = ropaniValue+ aanaValue+ paisaValue+ damValue;
                  //convert to bigha from ropani
                  final bigha = anna * 0.075116598079561;
                  var convertBigha = bigha.toString().split('.');
                  bighaController.text = convertBigha[0].toString();
                  var katthavalue = '0.${convertBigha[1]}';
                  // coverting biggha to katha
                  var convertedkathhavalue = double.parse(katthavalue)*20;
                  var dhurvalue =convertedkathhavalue.toString().split('.');
                  kathaController.text = dhurvalue[0].toString();
                  var dhurvalue2 = '0.${dhurvalue[1]}';
                  // converting kattha to dhur
                  var dhurvalue1= double.parse(dhurvalue2)*20;
                  dhurController.text = dhurvalue1.toStringAsFixed(2);
                  //anna to sqm and sqf
                  sqMeterController.text = (anna * 508.74).toStringAsFixed(2);
                  sqFeetController.text = (anna * 5476).toStringAsFixed(2);
                });
              },
            ),
            LandConverterWidget(
              hintText: data1[2],
              textController: paisaController,
              onChange: (val){
                setZero();
                setState(() {
                  aanaValue =  double.parse(annaController.text == "" ? "0" : annaController.text) / 16;
                  damValue =  double.parse(daamController.text == "" ? "0" : daamController.text) / 256;
                  ropaniValue =  double.parse(ropaniController.text == "" ? "0" : ropaniController.text);

                  final paisaVal = val == "" ? 0.0 : double.parse(val);
                  //paisa to ropani
                  paisaValue = paisaVal / 64;
                  //add all value to convert in ropani
                  final paisa = ropaniValue+ aanaValue+ paisaValue+ damValue;
                  //convert to bigha from ropani
                  final bigha = paisa * 0.075116598079561;
                  var convertBigha = bigha.toString().split('.');
                  bighaController.text = convertBigha[0].toString();
                  var katthavalue = '0.${convertBigha[1]}';
                  // coverting biggha to katha
                  var convertedkathhavalue = double.parse(katthavalue)*20;
                  var dhurvalue =convertedkathhavalue.toString().split('.');
                  kathaController.text = dhurvalue[0].toString();
                  var dhurvalue2 = '0.${dhurvalue[1]}';
                  // converting kattha to dhur
                  var dhurvalue1= double.parse(dhurvalue2)*20;
                  dhurController.text = dhurvalue1.toStringAsFixed(2);
                  //paisa to sqm and sqf
                  sqMeterController.text = (paisa * 508.74).toStringAsFixed(2);
                  sqFeetController.text = (paisa * 5476).toStringAsFixed(2);
                });
              },
            ),
            LandConverterWidget(
              hintText: data1[3],
              textController: daamController,
              onChange: (val){
                setZero();
                setState(() {
                  aanaValue =  double.parse(annaController.text == "" ? "0.0" : annaController.text) / 16;
                  paisaValue =  double.parse(paisaController.text == "" ? "0.0" : paisaController.text) / 64;
                  ropaniValue =  double.parse(ropaniController.text == "" ? "0.0" : ropaniController.text);
                  
                  final damVal = val == "" ? 0.0 : double.parse(val);
                  //dam to ropani
                  damValue = damVal / 256;
                  //add all value to convert in ropani
                  final daam = ropaniValue+ aanaValue+ paisaValue+ damValue;
                  //convert to bigha from ropani
                  final bigha = daam * 0.075116598079561;
                  var bighasplit = bigha.toString().split('.');
                  bighaController.text = bighasplit[0].toString();
                  var katha = "0.${bighasplit[1]}";
                  //bigha to katha
                  var newkathaValue = double.parse(katha)*20;
                  var katthavalue1 = newkathaValue.toString().split('.');
                  kathaController.text = katthavalue1[0].toString();
                  var dhurvalue = "0.${katthavalue1[1]}";
                  //katha to dhur
                  var dhurValue = double.parse(dhurvalue)*20;
                  dhurController.text = dhurValue.toStringAsFixed(2);
                  //dam to sqm and sqf
                  sqMeterController.text = (daam * 508.74).toStringAsFixed(2);
                  sqFeetController.text = (daam * 5476).toStringAsFixed(2);
                });
              },
            ),
          ],
        ),
        SizedBox(height: 15.0.h,),
        Text("Bigha", style: roboto(black, 14.0, 0.0),),
        SizedBox(
          height: 8.0.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LandConverterWidget(  
              hintText: data2[0],
              width: 102.5.w,
              textController: bighaController,
              onChange: (val){
                setZero();
                setState(() {
                  katthaValue =  double.parse(kathaController.text == "" ? "0.0" :kathaController.text) / 20;
                  dhurValue =  double.parse(dhurController.text == "" ? "0.0" :dhurController.text) / 400;

                  bighaValue = val == "" ? 0.0 : double.parse(val);
                  //add all value in bigha
                  final bigha = bighaValue + katthaValue + dhurValue;
                  //converted biggha to ropani
                  final ropani = bigha * 13.31;
                  var ropanitoAnna = ropani.toString().split('.');
                  ropaniController.text = ropanitoAnna[0].toString();
                  var ropanainewvalue =  "0.${ropanitoAnna[1]}";
                  //converted ropani to anna
                  var annacoverted = double.parse(ropanainewvalue)*16;
                  var originalannavalue = annacoverted.toString().split('.');
                  annaController.text = originalannavalue[0].toString();
                  var paisa =  "0.${originalannavalue[1]}";
                  //converted anna to paisa
                  var paisacoverted = double.parse(paisa)*4;
                  var originalpaisavalue = paisacoverted.toString().split('.');
                  paisaController.text = originalpaisavalue[0].toString();
                  var dam =  "0.${originalpaisavalue[1]}";
                  //converted paisa to dam
                  var damcoverted = double.parse(dam)*4;
                  daamController.text = damcoverted.toStringAsFixed(2);
                  //bigha to sqm and sqf
                  sqMeterController.text = (bigha * 6772.63).toStringAsFixed(2);
                  sqFeetController.text = (bigha * 72900).toStringAsFixed(2);
                });
              },
            ),
            SizedBox(width: 10.w,),
            LandConverterWidget(
              hintText: data2[1],
              width: 102.5.w,
              textController: kathaController,
              onChange: (val){
                setZero();
                setState(() {
                  bighaValue =  double.parse(bighaController.text == "" ? "0.0" : bighaController.text);
                  dhurValue =  double.parse(dhurController.text == "" ? "0.0" : dhurController.text) / 400;

                  final kathaVal = val == "" ? 0.0 : double.parse(val);
                  //convert katha to bigha
                  katthaValue = kathaVal / 20;
                  //add all value in bigha
                  final katha = katthaValue + bighaValue + dhurValue;
                  //bigha to ropani
                  final ropani = katha * 13.31;
                  var ropanitoAnna = ropani.toStringAsFixed(2).split('.');
                  ropaniController.text = ropanitoAnna[0].toString();
                  var ropanainewvalue =  "0.${ropanitoAnna[1]}";
                  //ropani to anna
                  var annacoverted = double.parse(ropanainewvalue)*16;
                  var originalannavalue = annacoverted.toString().split('.');
                  annaController.text = originalannavalue[0].toString();
                  var paisa =  "0.${originalannavalue[1]}";
                  //anna to paisa
                  var paisacoverted = double.parse(paisa)*4;
                  var originalpaisavalue = paisacoverted.toString().split('.');
                  paisaController.text = originalpaisavalue[0].toString();
                  var dam =  "0.${originalpaisavalue[1]}";
                  //paisa to dam
                  var damcoverted = double.parse(dam)*4;
                  daamController.text = damcoverted.toStringAsFixed(2);
                  //katha to sqm and sqf
                  sqMeterController.text = (katha * 6772.63).toStringAsFixed(2);
                  sqFeetController.text = (katha * 72900).toStringAsFixed(2);
                });
              },
            ),
            SizedBox(width: 10.w,),
            LandConverterWidget(
              hintText: data2[2],
              width: 102.5.w,
              textController: dhurController,
              onChange: (val){
                setZero();
                setState(() {
                  katthaValue =  double.parse(kathaController.text == "" ? "0.0" : kathaController.text) / 20;
                  bighaValue =  double.parse(bighaController.text == "" ? "0.0" : bighaController.text);

                  final dhurVal = val == "" ? 0.0 : double.parse(val);
                  //dhur to bigha
                  dhurValue = dhurVal / 400;
                  //add all in value in bigha
                  final dhur = katthaValue + bighaValue + dhurValue;
                  //bigha to ropani
                  final ropani = dhur * 13.31;
                  var ropanitoAnna = ropani.toString().split('.');
                  ropaniController.text = ropanitoAnna[0].toString();
                  var ropanainewvalue =  "0.${ropanitoAnna[1]}";
                  //converted ropani to anna
                  var annacoverted = double.parse(ropanainewvalue)*16;
                  var originalannavalue = annacoverted.toString().split('.');
                  annaController.text = originalannavalue[0].toString();
                  var paisa =  "0.${originalannavalue[1]}";
                  //converted anna to paisa
                  var paisacoverted = double.parse(paisa)*4;
                  var originalpaisavalue = paisacoverted.toString().split('.');
                  paisaController.text = originalpaisavalue[0].toString();
                  var dam =  "0.${originalpaisavalue[1]}";
                  //converted paisa to dam
                  var damcoverted = double.parse(dam)*4;
                  daamController.text = damcoverted.toStringAsFixed(2);
                  //dhur to sqm and sqf
                  sqMeterController.text = (dhur * 6772.63).toStringAsFixed(2);
                  sqFeetController.text = (dhur * 72900).toStringAsFixed(2);
                });
              },
            ),
          ],
        ),
        SizedBox(height: 15.0.h,),
        Text("Feet/Meter", style: roboto(black, 14.0, 0.0),),
        SizedBox(
          height: 8.0.h,
        ),
        Row(
          children: [
            LandConverterWidget(  
              width: 159.5.w,
              hintText: "Sq. ft.",
              textController: sqFeetController,
              onChange: (val){
                setZero();
                setState(() {
                  sqMeterValue =  double.parse(sqMeterController.text == "" ? "0.0" : sqMeterController.text);

                  sqFeetValue = val == "" ? 0.0 : double.parse(val);
                  //converting sqfeet to sqm
                  sqMeterController.text = (sqFeetValue / 10.76).toStringAsFixed(2);
                  //converted sqf to ropani
                  final ropani = sqFeetValue / 5476;
                  var ropanitoAnna = ropani.toString().split('.');
                  ropaniController.text = ropanitoAnna[0].toString();
                  var ropanainewvalue =  "0.${ropanitoAnna[1]}";
                  //converted ropani to anna
                  var annacoverted = double.parse(ropanainewvalue)*16;
                  var originalannavalue = annacoverted.toString().split('.');
                  annaController.text = originalannavalue[0].toString();
                  var paisa =  "0.${originalannavalue[1]}";
                   //converted anna to paisa
                  var paisacoverted = double.parse(paisa)*4;
                  var originalpaisavalue = paisacoverted.toString().split('.');
                  paisaController.text = originalpaisavalue[0].toString();
                  var dam =  "0.${originalpaisavalue[1]}";
                  //converted paisa to dam
                  var damcoverted = double.parse(dam)*4;
                  daamController.text = damcoverted.toStringAsFixed(2);
                  //convert sqf to bigha
                  final bigha = sqFeetValue / 72900;
                  var convertBigha = bigha.toString().split('.');
                  bighaController.text = convertBigha[0].toString();
                  var katthavalue = '0.${convertBigha[1]}';
                  // coverting biggha to katha
                  var convertedkathhavalue = double.parse(katthavalue)*20;
                  var dhurvalue =convertedkathhavalue.toString().split('.');
                  kathaController.text = dhurvalue[0].toString();
                  var dhurvalue2 = '0.${dhurvalue[1]}';
                  // converting kattha to dhur
                  var dhurvalue1= double.parse(dhurvalue2)*20;
                  dhurController.text = dhurvalue1.toStringAsFixed(2);
                });
              },
            ),
            SizedBox(width: 10.w,),
            LandConverterWidget(  
              width: 159.5.w,
              hintText: "Sq. m.",
              textController: sqMeterController,
              onChange: (val){
                setZero();
                setState(() {
                  sqFeetValue =  double.parse(sqFeetController.text == "" ? "0.0" : sqFeetController.text);

                  sqMeterValue = val == "" ? 0.0 : double.parse(val);
                  //converting sqm to sqfeet
                  sqFeetController.text = (sqMeterValue * 10.76).toStringAsFixed(2);
                  //converted sqm to ropani
                  final ropani = sqMeterValue / 508.74;
                  var ropanitoAnna = ropani.toString().split('.');
                  ropaniController.text = ropanitoAnna[0].toString();
                  var ropanainewvalue =  "0.${ropanitoAnna[1]}";
                  //converted ropani to anna
                  var annacoverted = double.parse(ropanainewvalue)*16;
                  var originalannavalue = annacoverted.toString().split('.');
                  annaController.text = originalannavalue[0].toString();
                  var paisa =  "0.${originalannavalue[1]}";
                  //converted anna to paisa
                  var paisacoverted = double.parse(paisa)*4;
                  var originalpaisavalue = paisacoverted.toString().split('.');
                  paisaController.text = originalpaisavalue[0].toString();
                  var dam =  "0.${originalpaisavalue[1]}";
                  //converted paisa to dam
                  var damcoverted = double.parse(dam)*4;
                  daamController.text = damcoverted.toStringAsFixed(2); 
                  //convert sqm to bigha
                  final bigha = sqMeterValue / 6772.63;
                  var convertBigha = bigha.toString().split('.');
                  bighaController.text = convertBigha[0].toString();
                  var katthavalue = '0.${convertBigha[1]}';
                  // coverting biggha to katha
                  var convertedkathhavalue = double.parse(katthavalue)*20;
                  var dhurvalue =convertedkathhavalue.toString().split('.');
                  kathaController.text = dhurvalue[0].toString();
                  var dhurvalue2 = '0.${dhurvalue[1]}';
                  // converting kattha to dhur
                  var dhurvalue1= double.parse(dhurvalue2)*20;
                  dhurController.text = dhurvalue1.toStringAsFixed(2);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
  
  //details of popular engineers
  enginnersDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text("POPULAR ENGINEERS", style: roboto(black, 16.0, 0.0),),
        ),
        SizedBox(
          height: 28.0.h,
        ),
        ListView.builder(
          padding: EdgeInsets.only(left: 1.8.w, right: 0.0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 1,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Wrap(
              children: List.generate(viewAll == false ? 4 : enginners.length, (index) => 
                EngineerTile(
                  imageUrl: enginners[index]['image'].toString(), 
                  name: enginners[index]['name'].toString(), 
                  description: enginners[index]['description'].toString(), 
                  icon: enginners[index]['rating'] == 'Vip'
                        ? Icon(Icons.star_border_outlined, color: white, size: 20.sp,) 
                        : Icon(Icons.thumb_up_outlined, color: white, size: 20.sp,),
                  backgroundColor: enginners[index]['rating'] == 'Vip' ?  const Color(0xffECB9F9) : white,
                  onTap: (){
                    userInfoList[0]["isRegistered"] == true ? 
                      Navigator.push(
                        context, MaterialPageRoute(
                          builder: (context) {
                            return PortFolioDetail(
                              userId: widget.registerId.toString(),
                              imgUrl: enginners[index]['image'].toString(),
                              name: enginners[index]['name'].toString(), 
                              descreption: enginners[index]['description'].toString(), 
                            );
                          },
                        )
                      )
                    : showDialog(context: context, builder: (BuildContext context) =>  
                      CustomDialog(
                        onOkpressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const LoginAndRegister(indx: 1,)))); 
                        },
                      )
                    );
                  }
                )
              ),
            );
          }
        ),
        SizedBox(
          height: 50.0.h,
          child: CustomButton(
            onPressed: (){
              setState(() {
                viewAll = !viewAll;
              });
            }, 
            text: viewAll == false ? "View All" : "View Less", 
            buttonBgColor: red, 
            fontColor: white,
            buttonRadius: 30.r,
            textStyle: roboto(white, 20.0, 0.0, FontWeight.w600),
          ),
        ),
      ],
    );
  }

  //contractor section
  contractorDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text("POPULAR CONTRACTORS", style: roboto(black, 16.0, 0.0),),
        ),
        SizedBox(
          height: 24.0.h,
        ),
        SizedBox(
          height: 140.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: enginners.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ContractorTile(
                img: enginners[index]['image'].toString(), 
                text: enginners[index]['name'].toString(),
                onTap: (){
                  userInfoList[0]["isRegistered"] == true ? 
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context) {
                          return PortFolioDetail(
                            userId: widget.registerId.toString(),
                            imgUrl: enginners[index]['image'].toString(),
                            name: enginners[index]['name'].toString(), 
                            descreption: enginners[index]['description'].toString(), 
                          );
                        },
                      )
                    )
                  : 
                  showDialog(context: context, builder: (BuildContext context) =>  
                    CustomDialog(
                      onOkpressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => const LoginAndRegister(indx: 1,))));
                      },
                    )
                  );
                }
              );
            }
          ),
        ),
      ],
    );
  }

  //Blog section
  blogSection(){
    return Column(
      children: [
        Center(
          child: Text("Latest Blogs".toUpperCase(), style: roboto(black, 16.0, 0.0),),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: blogViewAll == false ? 4 : blogsList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            List blogsImage = blogsList[index]["blogImages"] as List;
            List commentsList = blogsList[index]["comments"] as List;
            return BlogTile(
              hero: blogsList[index]["userId"] as Object,
              blogStatus: blogsList[index]["blogStatus"].toString(),
              blogInfo: blogsList[index]["blogDescription"].toString(),
              blogTitle: blogsList[index]["blogTitle"].toString(),
              profileStatus: "",
              profileImageUrl: blogsList[index]["userProfileImgUrl"].toString(),
              imageUrl: blogsImage[0],
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PostDetailsPage(
                  imgUrls: blogsImage,
                  cmntsList : commentsList,
                  userId: blogsList[index]["userId"].toString(),
                  registerUserId: widget.registerId.toString(),
                  name: blogsList[index]["userName"].toString(),
                  createdAt: blogsList[index]["createdAt"].toString(),
                  heroTag: blogsList[index]["userId"] as Object,
                  blogDescription: blogsList[index]["blogDescription"].toString(),
                  blogTitle: blogsList[index]["blogTitle"].toString(),
                  userProfileUrl: blogsList[index]["userProfileImgUrl"].toString(),)
                  )
                );
              },
            );
          }
        ),
        SizedBox(height: 19.0.h,),
        //View All Button
        SizedBox(
          height: 50.0.h,
          child: CustomButton(
            onPressed: (){
              setState(() {
                blogViewAll = !blogViewAll;
              });
            }, 
            text: blogViewAll ? "View Less" : "View All", 
            buttonBgColor: green, 
            fontColor: white,
            buttonRadius: 30.r,
            textStyle: roboto(white, 18.0, 0.0, FontWeight.w600),
          ),
        ),
      ],
    );
  }

  //set 0 when land converter txtfield is made empty
  setZero() {
    setState(() {
      if(ropaniController.text == ""){
        ropaniValue =0;
      }
      if(annaController.text == ""){
        aanaValue = 0;
      }
      if(paisaController.text == ""){
        paisaValue = 0;
      }
      if(daamController.text == ""){
        damValue = 0;
      }
      if(bighaController.text == ""){
        bighaValue = 0;
      }
      if(kathaController.text == ""){
        katthaValue = 0;
      }
      if(dhurController.text == ""){
        dhurValue = 0;
      }
      if(sqFeetController.text == ""){
        sqFeetValue =0;
      }
      if(sqMeterController.text == ""){
        sqMeterValue = 0;
      }
    });
  }
}