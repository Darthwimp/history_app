import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HistoryTimeline extends StatelessWidget {
  const HistoryTimeline({
    super.key,
    required this.itemCount,
    required this.title,
    required this.description,
    required this.year,
  });

  final int itemCount;
  final String year;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: Card(
                margin: const EdgeInsets.all(20.0),
                child: Container(
                  width: double.infinity,
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.sp, vertical: 16.sp),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(253, 117, 55, 1),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 35.0,
              child: Container(
                height: double.infinity,
                width: 1.0,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 50.h,
              left: 15.0,
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.all(3.w),
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      year,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
              ),
            )
          ],
        );
      },
      itemCount: itemCount,
    );
  }
}
