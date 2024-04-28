import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:history_app/widgets/history_input_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final Map<String, dynamic> data = {};

  final List<String> year = [];

  // Future<void> getHistoryData() async {
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
      body: StreamBuilder(
        stream: firestore.collection("years").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 50.0),
                      child: Card(
                        color: Colors.transparent,
                        margin: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.sp,
                            vertical: 16.sp,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(253, 117, 55, 1),
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]["title"]
                                        as String,
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  GestureDetector(
                                    onTap: () => firestore
                                        .collection("years")
                                        .doc(snapshot.data!.docs[index].id)
                                        .delete(),
                                    child: Icon(
                                      Icons.delete_forever,
                                      size: 24.sp,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Text(
                                snapshot.data!.docs[index]["desc"] as String,
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
                              snapshot.data!.docs[index].id,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
              itemCount: snapshot.data!.docs.length,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => const HistoryInput(),
            ),
          );
        },
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
