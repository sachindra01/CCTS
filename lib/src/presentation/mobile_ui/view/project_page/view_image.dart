
import 'dart:io';

import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewImages extends StatelessWidget {
  final dynamic imagesFiles;
  const ViewImages({super.key, this.imagesFiles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top:12.0.h),
                  child: Icon(Icons.clear, color: Colors.white.withOpacity(0.8),),
                ),
                SizedBox(width: 12.w,)
              ],
            ),
          )
        ],
      ),
      body: SafeArea(
        child: 
        imagesFiles != null ?
        ListView.builder(
          itemCount: imagesFiles.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top:6.0),
              child: Image.file(File(imagesFiles[index].path), 
                height: 400.h, 
                width: double.infinity, 
                fit: BoxFit.cover,
              ),
            );
          },
        ) :
        Center(
          child: Image.network(
            "https://images.unsplash.com/photo-1619418602850-35ad20aa1700?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGRvY3VtZW50c3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
            height: 400.h, 
            width: double.infinity, 
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}