import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/features/author_details/view/widgets/author_info_container.dart';
import '../../../profile/UI/widgets/profile_circle_avatar.dart';
import '../../../shared/models/author.dart';

class ImageNameContainer extends StatelessWidget {
  const ImageNameContainer({required this.author, super.key});

  final Author author;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:300.w,
      child: Column(
        children: [
          35.spaceH,
          Row(
           children: [IconButton(onPressed: (){context.pop();}, icon: const Icon(Iconsax.arrow_left_2))],
          ),
          Hero(
            tag: author.id,
            child: ProfileCircleAvatar(picture: author.image,height: 180,borderColor: context.colorScheme.primary.withOpacity(0.2),),
          ),
          24.spaceH,
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(
              author.name,
              style: StylesConsts.f20BoldBlack.copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          16.spaceH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthorInfoContainer(iconData: Iconsax.global, text: author.countryName),

              20.spaceW,

              // Books count info
              AuthorInfoContainer(iconData: Iconsax.book_1, text:"${author.numberOfBooks} ${JsonConsts.books.t(context)}"),


            ],
          ),
        ],
      ),
    );
  }
}
