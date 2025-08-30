import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:reading_app/core/utils/extensions/context_extension.dart';
import 'package:reading_app/core/utils/extensions/space_extension.dart';
import 'package:reading_app/core/utils/extensions/string_extension.dart';
import 'package:reading_app/core/utils/extensions/widget_extenstion.dart';
import 'package:reading_app/features/auth/UI/screens/login_page.dart';
import 'package:reading_app/features/home/main_layout.dart';
import 'package:reading_app/features/notifications/logic/notifications_count/notifications_count_cubit.dart';
import 'package:reading_app/features/shared/user/user_cubit.dart';
import '../../../features/complaints/UI/screens/complaints_screen.dart';
import '../../../features/notifications/UI/screens/notifications_screen.dart';
import '../../../features/shared/data/data_source.dart';
import '../../../features/shared/localization/locale_cubit.dart';
import '../../../features/shared/theme/theme_cubit.dart';
import '../../../features/shared/user/user_model.dart';
import '../constants/colors_consts.dart';
import '../constants/json_consts.dart';
import '../constants/styles_consts.dart';

part 'input_validator.dart';
part 'show_error_dialog.dart';
part 'show_modal_sheet.dart';
part 'show_snackbar.dart';
part 'localization.dart';
part 'stagger_list.dart';
part 'build_home_screen.dart';
part 'show_settings_dialog.dart';
part 'formatter.dart';
part 'rate_comment_dialog.dart';
part 'calculator.dart';

class Functions {
  // String locale = DataSource().getLocale() ?? 'ar';
}
