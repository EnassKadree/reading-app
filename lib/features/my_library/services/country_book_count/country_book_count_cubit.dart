import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/country_book_count.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'country_book_count_state.dart';

class CountryBookCountCubit extends BaseCubit<CountryBookCountState> {
  CountryBookCountCubit() : super(CountryBookCountInitial());
  final String countrybookEndPoint =
      '${EndPoint.baseUrl}${EndPoint.countryBook}';
  Future<void> getCountryBook() async {
    emit(CountryBookCountLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> response = await Api().get(
            url: countrybookEndPoint,
            token: user.accessToken,
          );

          List<CountryBookCountModel> country =
              parseResponse<CountryBookCountModel>(
            response: response,
            fromJson: (data) => CountryBookCountModel.fromJson(data),
          );

          emit(CountryBookCountSuccess(country));
        },
        emit: emit,
        failureStateBuilder: (message) => CountryBookCountFailure(message));
  }
}
