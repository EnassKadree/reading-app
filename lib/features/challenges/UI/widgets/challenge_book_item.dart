import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/book_details/view/screens/book_details_wrapper.dart';
import 'package:reading_app/features/shared/models/book.dart';

import '../../../../core/utils/constants/styles_consts.dart';
import '../../../shared/widgets/custom_network_image.dart';

class ChallengeBookItem extends StatelessWidget {
  const ChallengeBookItem(
      {super.key, required this.book, required this.isLast});
  final BookModel book;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(BookDetailsWrapper(book: book));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Book cover
            Container(
              width: 60,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomNetworkImage(imageUrl: book.coverImage),
              ),
            ),

            16.spaceW,

            // Book details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title,
                    style: StylesConsts.f14W600Black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  4.spaceH,
                  Text(
                    '${JsonConsts.by.t(context)} ${book.authorName}',
                    style: StylesConsts.f15W400Grey.copyWith(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  8.spaceH,
                  Row(
                    children: [
                      Icon(
                        Iconsax.book,
                        size: 14,
                        color: Colors.blue[600],
                      ),
                      4.spaceW,
                      Text(
                        '${book.numberOfPages} ${JsonConsts.pages.t(context)}',
                        style: StylesConsts.f15W400Grey.copyWith(
                          fontSize: 11,
                          color: Colors.blue[600],
                        ),
                      ),
                      16.spaceW,
                      Icon(
                        Iconsax.star,
                        size: 14,
                        color: Colors.amber[600],
                      ),
                      4.spaceW,
                      Text(
                        book.starRate.toStringAsFixed(1),
                        style: StylesConsts.f15W400Grey.copyWith(
                          fontSize: 11,
                          color: Colors.amber[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
