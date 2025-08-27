import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../../core/utils/constants/styles_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../../my_library/services/book_pdf/book_pdf_cubit.dart';
import '../../../shared/widgets/custom_network_image.dart';
import '../../../shared/widgets/pdf books/pdf_reader_screen.dart';
import '../../helpers/share_plus_function.dart';
import 'book_image_shader_mask.dart';

class BookDetailsHeader extends StatelessWidget {
  const BookDetailsHeader({ required this.book,super.key});
 final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            height: 460.h,
            child: BookImageShaderMask(
              bookImage: book.coverImage,
            )),
        Positioned(
          top: 40.h,
          right: 30.w,
          child: GestureDetector(
            onTap: () {
              shareBookDetails(
                image: book.coverImage,
                title: book.title,
                author: book.authorName,
                appLink: EndPoint.appLink,
              );
            },
            child:  Icon(
              Icons.share_outlined,
              color: context.colorScheme.onPrimary,


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
            child:  Icon(
              Iconsax.arrow_left,
              color: context.colorScheme.onPrimary,
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
                      imageUrl: book.coverImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                10.spaceH,
                Text(
               book.title,
                  style: StylesConsts.f24BoldBlack,
                ).horizontalPadding,
                10.spaceH,
                Text(
                  book.authorName,
                  style: StylesConsts.f18W400grey,
                ).horizontalPadding
              ],
            ),
          ),
        ),
        if  (book.summary!='')
          Positioned(
            bottom: 30.h,
            right: 20.w,
            child: GestureDetector(
                onTap: ()async{ final Uri uri = Uri.parse(book.summary);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                } else {
                  throw 'Could not launch ';
                }},
                child: Icon(Iconsax.link_25,color: context.colorScheme.onPrimary,size: 25,weight: 10,)),
          ),
        Positioned(
          bottom: 30.h,
          left: 20.w,
          child: GestureDetector(
              onTap: ()async {
                final cubit = context.read<BookPdfCubit>();
                await cubit.getBookPdf(book.id);
                final state = cubit.state;
                if (state is BookPdfSuccess) {
                  final pdf = state.bookPdf;
                  // ignore: use_build_context_synchronously
                  await context.push(
                    PdfReaderScreen(
                      filePath: pdf.pdfUrl,
                      lastReadPage: book.progress ?? 1,
                      bookModel: book,
                    ),
                  );
                } else if (state is BookPdfFailure) {
                  // ignore: use_build_context_synchronously
                  Functions().showSnackBar(
                      context, JsonConsts.theBookFailedToLoad.t(context));
                }
              },
              child: Icon(Iconsax.folder_open,color: context.colorScheme.onPrimary,size: 25,)),
        ),
      ],
    );
  }
}
