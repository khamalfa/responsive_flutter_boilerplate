import 'package:example/constants/colors.dart';
import 'package:example/model/ContentOfficeClass.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';

class ContentOfficeCard extends StatelessWidget {
  final int index;
  final ContentOfficeClass data;

  const ContentOfficeCard({Key? key, required this.index, required this.data})
      : super(key: key);

  // data.isAvail is an indicotor if current office or data is available.
  // mainly used for bgColor, textColor, function called

  @override
  Widget build(BuildContext context) {
    final responsiveCardDecoration = BreakpointValue(
      xs: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      sm: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
    );
    return Container(
      decoration: responsiveCardDecoration.resolve(context),
      padding: EdgeInsets.all(5),
      alignment: Alignment.center,
      height: 300,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryBackgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                data.imgUrl,
                height: 110,
                width: 95,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  // If image is failed to load
                  return const SizedBox(
                    height: 110,
                    width: 95,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                children: [
                  //Row [name, isAvail]
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          color: data.isAvail
                              ? AppColors.primaryAcceptedColor
                              : AppColors.primaryDeniedColor,
                          padding: EdgeInsets.all(5),
                          child: Text(
                            data.isAvail ? 'Available' : 'Occupied',
                            style: TextStyle(
                                fontSize: 10,
                                color: data.isAvail
                                    ? AppColors.accentAcceptedColor
                                    : AppColors.accentDeniedColor),
                          ),
                        )
                      ]),
                  //Row [timeDesc]
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: data.isAvail
                            ? AppColors.textColorSecondary
                            : AppColors.primaryColor,
                        size: 18,
                      ),
                      Text(
                        data.availDesc,
                        style: TextStyle(
                            color: data.isAvail
                                ? AppColors.textColorSecondary
                                : AppColors.primaryColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Row [address]
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: AppColors.textColorSecondary,
                        size: 18,
                      ),
                      Text(data.address)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //Row [[priceHour, capacity], button]
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // [[PRICE & CAPACITY]]
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // price
                          Text(
                            " \$${data.priceHour}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: data.isAvail
                                    ? null
                                    : AppColors.textColorSecondary),
                          ),
                          Text(
                            " per hr",
                            style:
                                TextStyle(color: AppColors.textColorSecondary),
                          ),
                          //margin from price to capacity
                          SizedBox(
                            width: 10,
                          ),
                          //capacity
                          Icon(
                            Icons.person,
                            color: AppColors.textColorSecondary,
                            size: 18,
                          ),
                          Text(
                            " ${data.capacity}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      // [[BOOK BUTTON]]
                      ElevatedButton(
                        child: Text(
                          'Book',
                          style: TextStyle(fontSize: 13),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: data.isAvail
                                ? AppColors.primaryColor
                                : AppColors.accentBackgroundColor),
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
