import 'package:example/constants/colors.dart';
import 'package:example/constants/data_dummy_content.dart';
import 'package:example/model/ContentOfficeClass.dart';
import 'package:example/pages/home/widgets/content_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import '../../utils/grid_delegate.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double spacing = BreakpointValue(xs: 3.0, sm: 10.0).resolve(context);
    final double dynamicHeight =
        BreakpointValue(xs: 137.0, sm: 140.0).resolve(context);
    final List<ContentOfficeClass> listContentOffice = ContentOfficeData;

    return Scrollbar(
      child: Container(
        child: CustomScrollView(
          slivers: [
            SliverGutter(),
            SliverToBoxAdapter(
              child: Margin(
                child: Text(
                  'Found ${listContentOffice.length} spaces',
                  style: TextStyle(
                      color: AppColors.textColorPrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverGutter(),
            SliverMargin(
              margin: context.layout.breakpoint == LayoutBreakpoint.xs
                  ? EdgeInsets.zero
                  : null,
              sliver: SliverGrid(
                delegate: SliverChildListDelegate.fixed(
                  List.generate(
                    listContentOffice.length,
                    (index) => ContentOfficeCard(
                        index: index, data: listContentOffice[index]),
                  ),
                ),
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCountAndMainAxisExtent(
                  crossAxisCount: context.layout.value(
                    xs: 1, // one row if screen is xs
                    sm: 1,
                    md: 1,
                    lg: 2,
                    xl: 2, // two row if screen is xl
                  ),
                  mainAxisExtent: dynamicHeight,
                  mainAxisSpacing: spacing,
                  crossAxisSpacing: spacing,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
