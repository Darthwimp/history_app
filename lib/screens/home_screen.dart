import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_app/widgets/history_timeline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "THE BEGINNINGS",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: const HistoryTimeline(
        itemCount: 1,
        description:
            "The Indian Rebellion of 1857 was a major uprising against the British East India Company's rule in India. The revolt lasted from May 10, 1857 to July 8, 1859.",
        title: "Indian Rebellion of 1857",
        year: "1857",
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32.sp,
        ),
      ),
    );
  }
}
