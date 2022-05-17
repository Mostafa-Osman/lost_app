import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoSlider extends StatelessWidget {
  const PhotoSlider({
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (BuildContext context, state) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: homeCubit.sliderController,
              itemCount: images.length,
              onPageChanged: (index) => homeCubit.onSliderImageChange(index),
              itemBuilder: (c, index) => InkWell(
                onTap: () {
                  // Navigator.of(context).pushNamed(
                  //   Routes.IMAGE_VIEWER,
                  //   arguments: [images, i],
                  // );
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          // if (carDetailsCubit.currentImgIndex != images.length - 1)
          //   Positioned(
          //     left: 9,
          //     child: CarDetailsArrow(
          //       icon: 'assets/images/icons/car_details_image_left_arrow.svg',
          //       onTap: () {
          //         carDetailsCubit.changeImgNext();
          //         carDetailsCubit.sliderController.jumpToPage(
          //           carDetailsCubit.currentImgIndex,
          //         );
          //       },
          //       quarterTurns: 0,
          //     ),
          //   )
          // else
          //   const SizedBox(),
          // if (carDetailsCubit.currentImgIndex == 0)
          //   const SizedBox()
          // else
          //   Positioned(
          //     right: 9,
          //     child: CarDetailsArrow(
          //       icon: 'assets/images/icons/car_details_image_right_arrow.svg',
          //       onTap: () {
          //         carDetailsCubit.changeImgBack();
          //         carDetailsCubit.sliderController.jumpToPage(
          //           carDetailsCubit.currentImgIndex,
          //         );
          //       },
          //       quarterTurns: 2,
          //     ),
          //   ),
          Positioned(
            bottom: 30,
            child: SmoothPageIndicator(
              controller: homeCubit.sliderController,
              count: images.length,
              effect: WormEffect(
                activeDotColor: Theme.of(context).primaryColor,
                dotColor: Colors.grey[300]!,
                dotWidth: 8,
                dotHeight: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}
