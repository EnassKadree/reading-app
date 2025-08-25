import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/book_details/view/components/book_challenge_builder.dart';
import 'package:reading_app/features/book_details/view/components/book_image_shader_mask.dart';
import 'package:reading_app/features/book_details/view/components/book_comments_builder.dart';
import 'package:reading_app/features/book_details/view/components/scrollable_description_widget.dart';
import '../../shared/models/book.dart';
import '../../shared/widgets/custom_network_image.dart';
import '../helpers/share_plus_function.dart';
import 'components/book_numbers_section.dart';
import 'components/rate_the_book_container.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({required this.book, this.newProgress,  required this.scrollToIndex, super.key});

  final BookModel book;
  final  int  scrollToIndex;
   final int ? newProgress;
  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late ScrollController _scrollController;
  void _scrollToIndex(int index) {
    double offset = index *80;
    _scrollController.jumpTo(offset); // or use _scrollController.animateTo() for smooth scroll
  }
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(widget.scrollToIndex); // Scroll after the screen is built
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Stack(
                        children: [
                          SizedBox(
                              height: 460.h,
                              child: BookImageShaderMask(
                                bookImage: widget.book.coverImage,
                              )),
                          Positioned(
                            top: 40.h,
                            right: 30.w,
                            child: GestureDetector(
                              onTap: () {
                                shareBookDetails(
                                  image: widget.book.coverImage,
                                  title: widget.book.title,
                                  author: widget.book.authorName,
                                  appLink: EndPoint.appLink,
                                );
                              },
                              child: const Icon(
                                Icons.share,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40.h,
                            left: 30.w,
                            child: GestureDetector(
                              onTap: () {
                                context.pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70.h,
                            child: SizedBox(
                              width: 1.sw,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 180.w,
                                    height: 290.h,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(24.r),
                                      child: CustomNetworkImage(
                                        imageUrl: widget.book.coverImage,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  10.spaceH,
                                  Text(
                                    widget.book.title,
                                    style: StylesConsts.f24BoldBlack,
                                  ).horizontalPadding,
                                  10.spaceH,
                                  Text(
                                    widget.book.authorName,
                                    style: StylesConsts.f18W400grey,
                                  ).horizontalPadding
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      30.spaceH,
                      BookNumbersSection(book: widget.book),
                      40.spaceH,
                      ScrollableDescriptionWidget(
                        description: widget.book.description,
                      ),
                      30.spaceH,
                      BookChallengeBuilder(
                        book: widget.book,
                      ),
                      30.spaceH,
                      RateTheBookContainer(
                        book: widget.book,
                        newProgress: widget.newProgress,
                      ),
                      30.spaceH,
                       CommentsSection(),
                      70.spaceH
                    ],
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   height: 80.h,
          //   padding: EdgeInsets.symmetric(vertical: 2),
          //   child:   Row(
          //     children: [
          //
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
