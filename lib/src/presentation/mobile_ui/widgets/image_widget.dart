

import 'package:ccts/src/config/style.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageSlider extends StatefulWidget {
  final List imageUrlList;
  final Widget? imageWidget;
  final bool? enlageCenterImage;
  const ImageSlider({ Key? key, required this.imageUrlList, this.imageWidget, this.enlageCenterImage}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}
class _ImageSliderState extends State<ImageSlider> {
  final CarouselController _controller = CarouselController();
  int currentIndex = 0;
  var bannerImageBaseURl = '';
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Image
        CarouselSlider.builder(
          itemCount: widget.imageUrlList.length,
          carouselController: _controller,
          options: CarouselOptions(
            enlargeCenterPage: widget.enlageCenterImage ?? false,
            height: 400.h,
            padEnds: false,
            viewportFraction: 1,
            aspectRatio: 3/2,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            }
          ),
          itemBuilder: (context, index, realIndex){
            return  widget.imageWidget ?? Image.network(
              widget.imageUrlList[index],
              width: double.infinity,
              height: 400.h,
              fit: BoxFit.cover,
            );
          },
        ),
        // Page Indicator
        Positioned(
          bottom: 20.h,
          right: 20.0.w,
          child: Container(
            height: 22.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: black.withOpacity(0.27),
              borderRadius: BorderRadius.circular(11.0.r),
            ),
            child: Center(child: Text('${currentIndex + 1}/${widget.imageUrlList.length}',style: montserrat(white, 12.0, 0.22)))),
        ),
      ],
    );
  }
}