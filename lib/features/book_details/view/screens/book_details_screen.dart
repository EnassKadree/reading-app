import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/core/utils/functions/open_link.dart';
import 'package:reading_app/features/book_details/service/add_to_read/add_to_read_cubit.dart';
import 'package:reading_app/features/book_details/service/add_to_read/add_to_read_states.dart';
import 'package:reading_app/features/book_details/view/components/book_challenge_builder.dart';
import 'package:reading_app/features/book_details/view/components/book_details_button.dart';
import 'package:reading_app/features/book_details/view/components/book_details_header.dart';
import 'package:reading_app/features/book_details/view/components/book_image_shader_mask.dart';
import 'package:reading_app/features/book_details/view/components/book_comments_builder.dart';
import 'package:reading_app/features/book_details/view/components/scrollable_description_widget.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/constants/colors_consts.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../my_library/services/book_pdf/book_pdf_cubit.dart';
import '../../../shared/models/book.dart';
import '../../../shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';
import '../../../shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';
import '../../../shared/widgets/custom_network_image.dart';
import '../../../shared/widgets/pdf books/pdf_reader_screen.dart';
import '../../helpers/share_plus_function.dart';
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
    _scrollController.jumpTo(
        offset); // or use _scrollController.animateTo() for smooth scroll
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
                      BookDetailsHeader(book: widget.book),
                      20.spaceH,
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
                      CommentsSection(
                          currentPage: widget.book.progress,
                          bookPages: widget.book.numberOfPages,
                          bookId: widget.book.id),
                      10.spaceH,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          BlocConsumer<BookFavoriteCubit,BookFavoriteStates>(
                              builder: (BuildContext context ,BookFavoriteStates state) {
                                widget.book.isFavourite=state.isFavorite;
                                bool favorite= widget.book.isFavourite;
                              return BookDetailsButton(
                                function: (){
                                  (!favorite)? context.read<BookFavoriteCubit>().addToFavorite(widget.book.id):
                                  context.read<BookFavoriteCubit>().removeFromFavorite(widget.book.id);
                                  },
                                buttonText: "favorite",
                                borderColoR: context.colorScheme.primary.withAlpha(150),
                                color: (favorite)?context.colorScheme.primary.withAlpha(120):null,
                                textColor: (favorite)?context.colorScheme.surfaceContainer:context.colorScheme.primary,
                              ).horizontalPadding;
                            }, listener: (BuildContext context ,BookFavoriteStates state) {
                                if(state is ErrorFavoriteState) {
                                Functions()
                                    .showSnackBar(context, state.errorMessage);
                              }
                            },
                          ),

                          BlocConsumer<AddToReadCubit,AddToReadStates>(
                            builder: (BuildContext context ,AddToReadStates state) {
                              if(state is SuccessAddToReadState) {
                                bool isInLibrary=widget.book.isInLibrary;
                                widget.book.isInLibrary = !isInLibrary;
                              }
                              bool inLibrary= widget.book.isInLibrary;
                              return BookDetailsButton(
                                function: (){
                                 context.read<AddToReadCubit>().addBookToRead(widget.book.id);

                                },
                                buttonText: "to read",
                                borderColoR: context.colorScheme.primary.withAlpha(150),
                                color: (inLibrary)?context.colorScheme.primary.withAlpha(120):null,
                                textColor: (inLibrary)?context.colorScheme.surfaceContainer:context.colorScheme.primary,
                              ).horizontalPadding;
                            }, listener: (BuildContext context ,AddToReadStates state) {  },
                          ),
                        ],
                      ),
                      30.spaceH,
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
