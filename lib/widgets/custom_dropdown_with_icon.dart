import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../model/ListMenuDropdownClass.dart';

Widget customDropDownWithIcon(List<ListMenuDropdownClass> listItems,
    String valueState, bool isBorder, ValueChanged onChange) {
  return Container(
    padding: isBorder ? EdgeInsets.symmetric(vertical: 10) : null,
    decoration: isBorder
        ? BoxDecoration(
            border: Border.all(color: AppColors.primaryBorderColor, width: 1.0),
            borderRadius: BorderRadius.circular(8.0),
          )
        : null,
    width: isBorder ? double.infinity : null,
    child: DropdownButton<String>(
        padding: EdgeInsets.symmetric(horizontal: 7),
        enableFeedback: false,
        isDense: true,
        isExpanded: isBorder ? true : false,
        underline: Container(),
        value: valueState,
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.primaryColor,
        ),
        items: listItems
            .map<DropdownMenuItem<String>>(
                (ListMenuDropdownClass item) => DropdownMenuItem<String>(
                    value: item.value,
                    child: Row(children: [
                      Icon(
                        item.icon,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        item.value,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ])))
            .toList(),
        onChanged: onChange),
  );
}
