import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';

import '../../../../core/utils/constants/assets_consts.dart';
import '../../../../core/utils/functions/functions.dart';
import '../../service/rate_the_book/rate_the_book_cubit.dart';
import '../../service/rate_the_book/rate_the_book_states.dart';
import 'book_details_button.dart';

class RateButtonBuilder extends StatelessWidget {
  const RateButtonBuilder({required this.bookId,required this.rate,super.key});
 final  int bookId;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RateTheBookCubit,RateState>(
        builder: (BuildContext context,RateState state) {
          if(state is LoadingRateState) {
            return BookDetailsButton(
              borderColoR:context.colorScheme.primary.withAlpha(120),
              color: context.colorScheme.primary.withAlpha(120),
              function: (){},
              buttonText: '',
              child: Lottie.asset(AssetsConsts.loadingAsset,
                  height: 40, width: 40),);
          }
          return BookDetailsButton(
            function: () {
              context
                  .read<RateTheBookCubit>()
                  .rateTheBook(bookId, rate);
            },
            borderColoR:context.colorScheme.primary.withAlpha(150),
            color: context.colorScheme.primary.withAlpha(120) ,
            buttonText: 'Rate',
          );

        },
        listener:(BuildContext context,RateState state){
          if(state is ErrorRateState)
            Functions().showSnackBar(context, "could'nt rate try agin ");
        }
    );
  }
}
