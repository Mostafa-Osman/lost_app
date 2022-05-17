import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lost_app/presentations/home/bloc/home_cubit.dart';
import 'package:lost_app/presentations/home/widgets/post_pop_up_menu.dart';
import 'package:lost_app/presentations/route/route_constants.dart';
import 'package:lost_app/shared/components/navigator.dart';
import 'package:lost_app/shared/components/text_class.dart';
import 'package:lost_app/shared/styles/color.dart';

class PostCard extends StatelessWidget {
  String userPhoto;
  String username;
  String personName;
  int lostAge;
  String lostGender;
  String lostAddressCity;
  String lostAddressDistrict;
  String lostMainPhoto;
  bool isOwner;
  bool isSaved;
  int postId;
  int index;
  String userPhoneNumber;

  PostCard({
    required this.userPhoto,
    required this.username,
    required this.personName,
    required this.lostAge,
    required this.lostGender,
    required this.lostAddressCity,
    required this.lostAddressDistrict,
    required this.lostMainPhoto,
    required this.isOwner,
    required this.isSaved,
    required this.postId,
    required this.index,
    required this.userPhoneNumber,
   
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final postCardCubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Column(
        children: [
          Material(
            color: lightBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                topLeft: Radius.circular(15),
              ),
            ),
            child: InkWell(
              onTap: () {
                navigateWithArgument(context, RouteConstant.commentRoute, [
                  false,
                  postId,
                ]);
              },
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              splashColor: grey,
              child: SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width >= 500 ? 40 : size.width / 10,
                            height: size.width >= 500 ? 40 : size.width / 10,
                            child: ClipOval(
                              child: Image.network(
                                userPhoto,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextClass(
                              text: username,
                              fontSize:
                                  size.width >= 500 ? 20 : size.width / 20,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const Spacer(),
                          if (isOwner)
                            PostPopUpMenu(postId: postId,navigate: false,),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: TextClass(
                                    text: 'مفقود منذ 3 ايام فى دار السلام',
                                    textAlign: TextAlign.right,
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextClass(
                                        text: 'الاسم : $personName',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      TextClass(
                                        text: 'السن : $lostAge',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      TextClass(
                                        text: 'الجنس : $lostGender',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      TextClass(
                                        text:
                                            'العنوان : ${"$lostAddressCity - $lostAddressDistrict"}',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      TextClass(
                                        text: 'هاتف التواصل : $userPhoneNumber',
                                        textAlign: TextAlign.right,
                                        fontSize: 15,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: SizedBox(
                              height: 120,
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  lostMainPhoto,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => navigateWithArgument(
                      context,
                      RouteConstant.commentRoute,
                      [
                        true,
                        postId,
                      ],
                    ),
                    //splashColor: grey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: TextClass(
                                text: 'التعليق',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: SvgPicture.asset(
                              'assets/icons/comment_icon.svg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(width: 2, color: white),
                Expanded(
                  child: InkWell(
                    onTap: () => postCardCubit.isSavedPost(postId: postId),
                    splashColor: grey,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Padding(
                              padding: EdgeInsets.only(top: 5.0),
                              child: TextClass(
                                text: 'حفظ',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2.0),
                            child: isSaved
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(Icons.favorite_border),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
