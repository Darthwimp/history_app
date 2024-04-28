import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryDialogBox extends StatelessWidget {
  HistoryDialogBox({super.key, required this.context});
  final BuildContext context;
  final TextEditingController yearController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Add History',
        style: Theme.of(context).textTheme.labelMedium,
      ),
      backgroundColor: Colors.black,
      content: SizedBox(
        height: 200.h,
        width: 150.w,
        child: Column(
          children: [
            TextFormField(
              style: GoogleFonts.oswald(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              autofocus: true,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              controller: yearController,
              decoration: InputDecoration(
                hintText: 'Year',
                focusColor: Colors.white,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
              ),
            ),
            TextField(
              style: GoogleFonts.oswald(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
              controller: titleController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Title',
                hintStyle: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 16.sp),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 224, 224),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: SingleChildScrollView(
                child: TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  style: GoogleFonts.oswald(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 8.sp, vertical: 16.sp),
                    hintText: 'Description',
                    hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Colors.black,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        TextButton(
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection('years')
                .doc(yearController.text)
                .set({
              'title': titleController.text,
              'desc': descriptionController.text,
            });
            Navigator.pop(context);
          },
          child: Text(
            'Add',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
      ],
    );
  }
}
