import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

import '../../../../core/utils/constants/colors_consts.dart';
import '../../../profile/UI/widgets/profile_circle_avatar.dart';
import '../../../shared/models/author.dart';

class ImageNameContainer extends StatelessWidget {
  const ImageNameContainer({required this.author, super.key});

  final Author author;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: ColorsConsts.gradientColors),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfileCircleAvatar(picture: author.image),
                  12.spaceW,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: AutoSizeText(
                          author.name,
                          maxLines: 2,
                          style: StylesConsts.f20BoldWhite,
                        ),
                      ),
                      4.spaceH,
                      Row(
                        children: [
                          Text(
                            author.countryName,
                            style: StylesConsts.f15W400Grey.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                          30.spaceW,
                          Text(
                              "${ author.numberOfBooks.toString() } book",
                            style: StylesConsts.f15W400Grey.copyWith(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
