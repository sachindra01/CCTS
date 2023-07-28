import 'dart:async';

import 'package:ccts/src/config/style.dart';
import 'package:ccts/src/data/json_asset/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gantt_chart/gantt_chart.dart';

class ProjectTimeline extends StatefulWidget {
  const ProjectTimeline({super.key});

  @override
  State<ProjectTimeline> createState() => _ProjectTimelineState();
}

class _ProjectTimelineState extends State<ProjectTimeline> {
  final scrollController = ScrollController();

  double dayWidth = 30;
  bool showDaysRow = true;
  bool showStickyArea = true;
  bool customStickyArea = false;
  bool customWeekHeader = false;
  bool customDayHeader = false;
  bool shouldChangeOrientation = false;
  bool firstLoading = false;
  dynamic startdt,startdt1;
  dynamic enddt,enddt1;

  void onZoomIn() {
    setState(() {
      dayWidth += 5;
    });
  }

  void onZoomOut() {
    if (dayWidth <= 10) return;
    setState(() {
      dayWidth -= 5;
    });
  }
  List projectDetails =[];

   getUserData(){
    for(var data in projectDetail){
        projectDetails.add(data);
        setState(() {  });
      }
      startdt =DateTime.parse(projectDetails[0]['est_plastering_start_date']);
      enddt =DateTime.parse(projectDetails[0]['est_plastering_end_date']);
      startdt1 =DateTime.parse(projectDetails[0]['est_brick_join_start_date']);
      enddt1 =DateTime.parse(projectDetails[0]['est_brick_join_end_date']);
    }
  

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        firstLoading = true;
      });
    });
    getUserData();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return firstLoading == false ?
    const Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox()
    ) :
    RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          if (scrollController.offset <
              scrollController.position.maxScrollExtent) {
            scrollController.jumpTo(scrollController.offset + 50);
          }
        }
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          if (scrollController.offset >
              scrollController.position.minScrollExtent) {
            scrollController.jumpTo(scrollController.offset - 50);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55.0,
          backgroundColor: appBarColor,
          title: Text('Project Timeline'.toUpperCase(), style: roboto(black, 18.0, 0.0, FontWeight.w600),),
          centerTitle: false,
          elevation: 0.0,
          titleTextStyle:  roboto(black, 18.0, 0.0, FontWeight.w500),
          leadingWidth: 48,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context, true);
            },
            child: Icon(Icons.arrow_back, color: appBarIconCol, size: 25.sp,)
          )
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SwitchListTile.adaptive(
              //   value: showDaysRow,
              //   title: const Text('Show Days Row ?'),
              //   onChanged: (v) => setState(() => showDaysRow =v),
              // ),
              // SwitchListTile.adaptive(
              //   value: showStickyArea,
              //   title: const Text('Show Sticky Area ?'),
              //   onChanged: (v) => setState(() => showStickyArea = v),
              // ),
              // SwitchListTile.adaptive(
              //   value: customStickyArea,
              //   title: const Text('Custom Sticky Area ?'),
              //   onChanged: (v) => setState(() => customStickyArea = v),
              // ),
              // SwitchListTile.adaptive(
              //   value: customWeekHeader,
              //   title: const Text('Custom Week Header ?'),
              //   onChanged: (v) => setState(() => customWeekHeader = v),
              // ),
              // SwitchListTile.adaptive(
              //   value: customDayHeader,
              //   title: const Text('Custom Day Header ?'),
              //   onChanged: (v) => setState(() => customDayHeader = v),
              // ),
              // const Text(
              //   'Try navigating with keyboard arrow keys',
              //   style: TextStyle(
              //     color: Colors.red,
              //     fontSize: 24,
              //   ),
              // ),
              const Divider(),
              GanttChartView(
                scrollPhysics: const BouncingScrollPhysics(),
                stickyAreaWeekBuilder: (context) {
                  return const Text(
                    ' Show project timeline',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  );
                },
                stickyAreaDayBuilder: (context) {
                  return Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // bottom: 0,
                        children: [
                          IconButton(
                            onPressed: 
                                () {
                                    scrollController
                                        .jumpTo(scrollController.offset - 50);
                                  },
                            color: Colors.black,
                            icon: const Icon(
                              Icons.arrow_left,
                              size: 28,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: 
                                  () {
                                    scrollController
                                        .jumpTo(scrollController.offset + 50);
                                  },
                            color: Colors.black,
                            icon: const Icon(
                              Icons.arrow_right,
                              size: 28,
                            ),
                          ),
                        ],
                      );
                },
                scrollController: scrollController,
                maxDuration: const Duration(days: 30 * 2),
                startDate: DateTime(2023, 6, 7),
                dayWidth: dayWidth,
                eventHeight: 40,
                stickyAreaWidth: 200,
                showStickyArea: showStickyArea,
                stickyAreaEventBuilder: customStickyArea
                    ? (context, eventIndex, event, eventColor) => eventIndex ==
                            0
                        ? Container(
                            color: Colors.yellow,
                            child: Center(
                              child:
                                  Text("${event.displayName}"),
                            ),
                          )
                        : GanttChartDefaultStickyAreaCell(
                            event: event,
                            eventIndex: eventIndex,
                            eventColor: eventColor,
                            widgetBuilder: (context) => Text(
                              "Default Widget with custom colors: ${event.displayName}",
                              textAlign: TextAlign.center,
                            ),
                          )
                    : null,
                weekHeaderBuilder: customWeekHeader
                    ? (context, weekDate) => GanttChartDefaultWeekHeader(
                        weekDate: weekDate,
                        color: Colors.black,
                        backgroundColor: Colors.yellow,
                        border: const BorderDirectional(
                          end: BorderSide(color: Colors.green),
                        ))
                    : null,
                dayHeaderBuilder: customDayHeader
                    ? (context, date, bool isHoliday) =>
                        GanttChartDefaultDayHeader(
                          date: date,
                          isHoliday: isHoliday,
                          color: isHoliday ? Colors.yellow : Colors.black,
                          backgroundColor:
                              isHoliday ? Colors.grey : Colors.yellow,
                        )
                    : null,
                showDays: showDaysRow,
                weekEnds: const {WeekDay.friday, WeekDay.saturday},
                isExtraHoliday: (context, day) { 
                  //define custom holiday logic for each day
                  return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
                },
                startOfTheWeek: WeekDay.sunday,
                events: [
                  GanttAbsoluteEvent(
                    displayNameBuilder: (context) {
                      return 'name';
                    },
                    displayName: 'plastering work',
                    startDate:startdt,
                    endDate:enddt,
                  ),
                  GanttAbsoluteEvent(
                    displayNameBuilder: (context) {
                      return 'name';
                    },
                    displayName: 'brick joing',
                    startDate:startdt1,
                    endDate:enddt1,
                  )
                ],
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: onZoomIn,
        //   tooltip: 'Increment',
        //   child: const Icon(Icons.add),
        // ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}