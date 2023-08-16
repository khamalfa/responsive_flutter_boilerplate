import 'package:example/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeContentSide extends StatefulWidget {
  const HomeContentSide({Key? key}) : super(key: key);
  @override
  _HomeContentSideState createState() => _HomeContentSideState();
}

class _HomeContentSideState extends State<HomeContentSide> {
  Map<String, bool?> checkboxes = {};

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Drawer(
        // width: MediaQuery.of(context).size.width * 0.35,
        width: 500,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset("assets/map_area.png")),
            ),
            Card(
              child: Container(
                padding:
                    EdgeInsets.only(left: 20, right: 20, top: 16, bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bondi Junction, Sydney NSW",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "33 Bondi Road, Bondi Junction NSW 2000",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textColorSecondary),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Open hours",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Mon to Fri 9am - 6pm",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textColorSecondary),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "After hours bookings",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textColorSecondary),
                                    ),
                                    TextButton(
                                      // style: TextButton.styleFrom(),
                                      onPressed: () {},
                                      child: Text(
                                        "Request here",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.primaryColor),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.call,
                                size: 18,
                                color: AppColors.textColorPrimary,
                              ),
                              SizedBox(width: 16),
                              Text(
                                "+61 02 924 577",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.email,
                                size: 18,
                                color: AppColors.textColorPrimary,
                              ),
                              SizedBox(width: 16),
                              Text(
                                "reception@space.com",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.language,
                                size: 18,
                                color: AppColors.textColorPrimary,
                              ),
                              SizedBox(width: 16),
                              Text(
                                "www.space.com",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: AppColors.primaryColor),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 240,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://live.staticflickr.com/3122/2290703872_2d85d62829_b.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
