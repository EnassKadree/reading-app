import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_image_shader_mask.dart';
import 'package:reading_app/features/shared/widgets/icon_text_widget.dart';

import '../../shared/models/book.dart';
import '../helpers/share_plus_function.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({required this.book, super.key});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Stack(
                  children: [
                    SizedBox(
                        height: 460.h,
                        child:const BookImageShaderMask()
                    ),
                    Positioned(
                      top: 40.h,right: 30.w,
                      child: GestureDetector(
                        onTap:() {
                          shareBookDetails(
                            title:book.title,
                            author: book.authorName,
                            appLink: "https://play.google.com/store/apps/details?id=com.example.reading_app",
                          );
                        } ,
                        child: const Icon(Icons.share),
                      ),
                    ),
                    Positioned(
                      top: 40.h,left: 30.w,
                      child: GestureDetector(
                        onTap:() {
                          context.pop();
                        } ,
                        child: const Icon(Icons.arrow_back_outlined),
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
                                  child: Image.asset("assets/images/png/book 1.jpg",fit: BoxFit.fill,),),
                            ),
                            10.spaceH,
                            Text(
                              book.title,
                              style:TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                              ) ,).horizontalPadding,
                            10.spaceH,
                            Text(
                              book.authorName,
                              style:TextStyle(
                                color: Colors.grey,
                                fontSize: 18.sp,
                              ) ,).horizontalPadding
                          ],
                        ),
                      ),
                    ),


                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconTextWidget(text:'reads ${book.readersCount} ', icon:(Icons.people)),
                        15.spaceW,
                        IconTextWidget(text:'rating ${book.starRate}', icon:(Icons.star)),
                        15.spaceW,
                        IconTextWidget(text:'pages ${book.numberOfPages}', icon:(Icons.menu_book_outlined))

                      ],),
                    20.spaceH,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconTextWidget(text:book.categoryName, icon:(Icons.sports_basketball)),
                        15.spaceW,
                        IconTextWidget(text:book.sizeCategoryName, icon:(Icons.category_outlined)),
                        15.spaceW,
                        IconTextWidget(text:book.publishDate, icon:(Icons.date_range))


                      ],),
                  ],
                ),
                SizedBox()

              ],
            ),
          )
        ],
      ),
    );
  }
}
