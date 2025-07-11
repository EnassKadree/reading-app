import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/colors_consts.dart';
import 'package:reading_app/core/utils/constants/styles_consts.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';

class CardInProgress extends StatelessWidget {
  const CardInProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.14,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                child: GestureDetector(
                  onTap: () async {
    // هنا تفتح شاشة قراءة PDF
    // final lastPage = await Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => PdfReaderScreen(
    //       filePath: 'assets/pdf/book1.pdf',
    //       lastReadPage: 100, // تجيبها من الـ backend لاحقًا
    //     ),
    //   ),
    // );

    // // ترجع الصفحة الأخيرة المقروءة وتبعتها للباكند
    // if (lastPage != null) {
    //   // TODO: send lastPage to your backend
    //   print('User stopped at page: $lastPage');
    // }
  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 130, right: 16, top: 6, bottom: 16),
                    decoration: BoxDecoration(
                      color: ColorsConsts.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("title title",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: StylesConsts.f16W600Black),
                        12.spaceH,
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < 3 ? Icons.star : Icons.star_border,
                              color: Colors.yellow[700],
                              size: 20,
                            ),
                          ),
                        ),
                        8.spaceH,
                        LinearProgressIndicator(
                          value: 100 / 200,
                          backgroundColor: Colors.grey.shade200,
                          color: ColorsConsts.purple,
                          minHeight: 6,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        8.spaceH,
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            ' 100 / 200',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -30,
                left: 15,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorsConsts.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/png/book 1.jpg",
                      width: 95,
                      height: 120,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
