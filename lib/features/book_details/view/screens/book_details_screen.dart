import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/features/book_details/view/components/book_challenge_builder.dart';
import 'package:reading_app/features/book_details/view/components/book_details_header.dart';
import 'package:reading_app/features/book_details/view/components/book_comments_builder.dart';
import 'package:reading_app/features/book_details/view/components/scrollable_description_widget.dart';
import 'package:reading_app/features/book_details/view/components/user_action_buttons.dart';
import '../../../shared/models/book.dart';
import '../components/book_numbers_section.dart';
import '../components/rate_the_book_container.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen(
      {required this.book,
      this.newProgress,
      required this.scrollToIndex,
      super.key});

  final BookModel book;
  final int scrollToIndex;
  final int? newProgress;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late ScrollController _scrollController;

  void _scrollToIndex(int index) {
    double offset = index * 80;
    _scrollController.jumpTo(offset);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToIndex(widget.scrollToIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BookDetailsHeader(book: widget.book),
                      25.spaceH,
                      BookNumbersSection(book: widget.book),
                      30.spaceH,
                      ScrollableDescriptionWidget(
                        description: widget.book.description+widget.book.description+widget.book.description,
                      ),
                      UserActionButtons(book:widget.book,),
                      30.spaceH,
                      BookChallengeBuilder(
                        book: widget.book,
                      ),
                      40.spaceH,
                      RateTheBookWrapper(
                        book: widget.book,
                        newProgress: widget.newProgress,
                      ),
                      40.spaceH,
                      CommentsSection(
                        parentContext:context,
                          currentPage: widget.book.progress,
                          bookPages: widget.book.numberOfPages,
                          bookId: widget.book.id),
                      20.spaceH,
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
