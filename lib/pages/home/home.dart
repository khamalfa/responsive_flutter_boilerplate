import 'package:example/constants/colors.dart';
import 'package:example/model/ListMenuDropdownClass.dart';
import 'package:example/pages/home/home_content.dart';
import 'package:example/pages/home/home_content_side.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:layout/layout.dart';

import '../../widgets/custom_dropdown_with_icon.dart';
import 'home_options_hamburger.dart';

const kAlwaysDisplayDrawer = BreakpointValue(xs: false, md: true);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //[[DATA INIT]]
  List<ListMenuDropdownClass> listTypeMenu = [
    ListMenuDropdownClass(Icons.calendar_today_sharp, 'Meeting Room'),
    ListMenuDropdownClass(Icons.chair_outlined, 'Desk Pass'),
    ListMenuDropdownClass(Icons.calendar_today_sharp, 'More')
  ];

  List<ListMenuDropdownClass> listLocationNav = [
    ListMenuDropdownClass(Icons.location_pin, 'North Strathfield'),
    ListMenuDropdownClass(Icons.location_pin, 'Brisbane'),
    ListMenuDropdownClass(Icons.location_pin, 'North Carolina')
  ];

  List<String> listOptionDay = ['Hourly', 'All day', 'Half Day'];
  List<String> listOptionHour = ['AM', 'PM'];

  // [[STATES INIT]]
  String typeMenuValue = 'Meeting Room';
  String locationNavValue = 'North Strathfield';
  String todayValue = '2020-11-02';
  String hourStartValue = '9:00 AM';
  String hourEndValue = '1:00 AM';
  int optionDayValue = 0;
  int optionHourValue = 0;
  DateTime selectedDate = DateTime.now();

  Future<void> getSelectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final alwaysDisplayDrawer = context.layout.breakpoint > LayoutBreakpoint.sm;

    String formatterDate = DateFormat("y-M-d").format(selectedDate);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.textColorPrimary),
        title: Text(widget.title,
            style: TextStyle(color: AppColors.textColorPrimary)),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          // [[DROPDOWN TYPE [OFFICE,DESK]]]
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: customDropDownWithIcon(
                        listTypeMenu, typeMenuValue, false, (value) {
                  setState(() {
                    typeMenuValue = value!;
                  });
                })),
                Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primaryBackgroundColor,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.credit_card,
                              color: AppColors.primaryColor,
                            ),
                            Text('2 hrs'),
                          ],
                        )),
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.map_outlined)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      endDrawer: alwaysDisplayDrawer
          ? null
          : HomeOptionsHamburger(key: ValueKey('Drawer')),
      body: Container(
        color: Color.fromARGB(231, 170, 208, 255),
        padding: alwaysDisplayDrawer
            ? EdgeInsets.symmetric(horizontal: 20, vertical: 10)
            : EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    // [[TOPBAR]]
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: alwaysDisplayDrawer ? 20 : 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.accentColor,
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        width: double.infinity,
                        child: Column(children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //[[SEGMENTED OPTION DAY]]
                                CupertinoSegmentedControl(
                                  unselectedColor:
                                      AppColors.primaryBackgroundColor,
                                  borderColor: AppColors.primaryBackgroundColor,
                                  selectedColor: AppColors.accentColor,
                                  groupValue: optionDayValue,
                                  children: {
                                    for (int i = 0;
                                        i < listOptionDay.length;
                                        i++)
                                      i: Container(
                                        child: Text(
                                          listOptionDay[i],
                                          style: TextStyle(
                                              color:
                                                  AppColors.textColorPrimary),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                      ),
                                  },
                                  onValueChanged: (int? value) => {
                                    setState(() {
                                      optionDayValue = value!;
                                    })
                                  },
                                ),
                                // [[SEGMENTED AM:PM]]
                                optionDayValue == 2
                                    ? CupertinoSegmentedControl(
                                        groupValue: optionHourValue,
                                        children: {
                                          for (int i = 0;
                                              i < listOptionHour.length;
                                              i++)
                                            i: Container(
                                              child: Text(listOptionHour[i]),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                            ),
                                        },
                                        onValueChanged: (int? value) => {
                                          setState(() {
                                            optionHourValue = value!;
                                          })
                                        },
                                      ) // Hour Options
                                    : SizedBox()
                              ]),
                          SizedBox(height: 10),
                          // [[DROPDOWN TYPE]]
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: customDropDownWithIcon(
                                  listLocationNav, locationNavValue, true,
                                  (value) {
                                setState(() {
                                  locationNavValue = value!;
                                });
                              })),
                          SizedBox(height: 10),
                          // [[DATEPICKER]]
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        await getSelectDate(context);
                                        print(selectedDate);
                                        setState(
                                          () {
                                            formatterDate = DateFormat("yMMMd")
                                                .format(selectedDate);
                                          },
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              border: Border.all(
                                                  width: 2,
                                                  color: AppColors
                                                      .primaryBackgroundColor)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                formatterDate,
                                                style: TextStyle(
                                                    color: AppColors
                                                        .textColorPrimary,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Icon(
                                                Icons.calendar_today_outlined,
                                                size: 15,
                                                color: AppColors
                                                    .textColorSecondary,
                                              )
                                            ],
                                          )),
                                    ),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 7),
                                        decoration: BoxDecoration(
                                            color: optionDayValue == 0
                                                ? AppColors.accentColor
                                                : AppColors.textColorDisabled,
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            border: Border.all(
                                                width: 2,
                                                color: AppColors
                                                    .accentBackgroundColor)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              hourStartValue +
                                                  '  -  ' +
                                                  hourEndValue,
                                              style: TextStyle(
                                                  color: AppColors
                                                      .textColorSecondary,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              Icons.access_time,
                                              size: 15,
                                              color:
                                                  AppColors.textColorSecondary,
                                            )
                                          ],
                                        ))
                                  ])),
                        ]),
                      ),
                    ),
                    //[[CONTENT]]
                    Expanded(
                        key: ValueKey('HomePageBody'), child: HomeContent()),
                  ],
                ),
              ),
            ),
            //[[CONTENT SECTION]]
            if (alwaysDisplayDrawer)
              HomeContentSide(
                key: ValueKey('Drawer'),
              ),
          ],
        ),
      ),
    );
  }
}
