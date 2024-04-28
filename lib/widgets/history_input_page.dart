import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryInput extends StatelessWidget {
  const HistoryInput({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController yearController = TextEditingController();
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp),
                    child: TextFormField(
                      controller: yearController,
                      decoration: InputDecoration(
                        hintText: 'Year',
                        counterText: "",
                        hintStyle: GoogleFonts.oswald(
                          fontSize: 16.sp,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.sp,
                          ),
                        ),
                      ),
                      cursorColor: Colors.black,
                      style: GoogleFonts.oswald(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.number,
                      keyboardAppearance: Brightness.dark,
                      autofocus: true,
                      maxLength: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.sp),
                    child: TextFormField(
                      controller: titleController,
                      cursorColor: Colors.black,
                      style: GoogleFonts.oswald(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLength: 32,
                      autocorrect: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Title',
                        hintStyle: GoogleFonts.oswald(
                          fontSize: 16.sp,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.sp),
                    ),
                    child: TextFormField(
                      controller: descriptionController,
                      maxLines: 4,
                      cursorColor: Colors.black,
                      style: GoogleFonts.oswald(
                        fontSize: 16.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLength: 128,
                      autocorrect: true,
                      textCapitalization: TextCapitalization.sentences,
                      decoration: InputDecoration(
                        hintText: 'Description',
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8.sp,
                          vertical: 16.sp,
                        ),
                        hintStyle: GoogleFonts.oswald(
                          fontSize: 16.sp,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('years')
                      .doc(yearController.text)
                      .set({
                    'title': titleController.text,
                    'desc': descriptionController.text,
                  });
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
                  child: Text(
                    'Add History',
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
