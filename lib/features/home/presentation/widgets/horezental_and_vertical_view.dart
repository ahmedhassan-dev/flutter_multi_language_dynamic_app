import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorezentalAndVerticalView extends StatelessWidget {
  const HorezentalAndVerticalView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(context.tr("horizontal_scroll")),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue,
                  child: Center(child: Text('${context.tr("item")} $index')),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(context.tr("vertical_scroll")),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${context.tr("item")} $index'),
              );
            },
          ),
        ],
      ),
    );
  }
}
