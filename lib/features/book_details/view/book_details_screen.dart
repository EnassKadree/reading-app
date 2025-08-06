import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/constants/assets_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/service/book_challenge/book_challenge_cubit.dart';
import 'package:reading_app/features/book_details/service/book_challenge/book_challenge_states.dart';
import 'package:reading_app/features/book_details/view/components/book_challenge_container.dart';
import 'package:reading_app/features/book_details/view/components/book_icon_text_number.dart';
import 'package:reading_app/features/book_details/view/components/book_image_shader_mask.dart';
import 'package:reading_app/features/book_details/view/components/scrollable_description_widget.dart';
import 'package:reading_app/features/shared/widgets/error_dialog.dart';
import '../../shared/models/book.dart';
import '../../shared/widgets/custom_network_image.dart';
import '../helpers/share_plus_function.dart';
import 'components/book_numbers_section.dart';

class BookDetailsScreen extends StatelessWidget {
  const  BookDetailsScreen({  required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Stack(
                          children: [
                            SizedBox(
                                height: 460.h,
                                child: BookImageShaderMask(bookImage: book.coverImage,)
                            ),
                            Positioned(
                              top: 40.h,right: 30.w,
                              child: GestureDetector(
                                onTap:() {
                                  shareBookDetails(
                                    image: book.coverImage,
                                    title:book.title,
                                    author: book.authorName,
                                    appLink: EndPoint.appLink,
                                  );
                                } ,
                                child: const Icon(Icons.share,color: Colors.black,),
                              ),
                            ),
                            Positioned(
                              top: 40.h,left: 30.w,
                              child: GestureDetector(
                                onTap:() {
                                  context.pop();
                                } ,
                                child: const Icon(Icons.arrow_back_outlined,color: Colors.black,),
                              ),
                            ),
                            Positioned(
                              top: 70.h,
                              child: SizedBox(
                                width: 1.sw,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 180.w,
                                      height: 290.h,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(24.r),
                                          child: CustomNetworkImage(
                                            imageUrl:book.coverImage,
                                            fit: BoxFit.fill,
                                          ),),
                                    ),
                                    10.spaceH,
                                    Text(
                                      book.title,
                                      style:StylesConsts.f24BoldBlack
                                      ,).horizontalPadding,
                                    10.spaceH,
                                    Text(
                                      book.authorName,
                                      style:StylesConsts.f18W400grey
                                      ,).horizontalPadding
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        BookNumbersSection(book:book),
                        30.spaceH,
                      ScrollableDescriptionWidget(description: book.description,),
                        30.spaceH,
                         BlocConsumer<BookChallengeCubit,BookChallengeStates>(
                             builder: (BuildContext  context ,BookChallengeStates state){
                               if(state is BookChallengeSuccess) {
                                 return  BookChallengeContainer(bookChallenge:state.bookChallenge);
                               }
                               else if(state is BookChallengeLoading) {
                            return Lottie.asset(AssetsConsts.loadingAsset);
                          }

                          return const SizedBox();
                             },
                           listener: (BuildContext  context ,BookChallengeStates state){
                               if(state is BookChallengeError) {
                                 showCustomErrorDialog(context: context, message: state.errorMessage, onPressed: (){});
                               }
                           } ,
                             ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 80.h,

            )
          ],
        ),

    );
  }
}
