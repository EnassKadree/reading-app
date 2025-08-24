part of 'functions.dart';

extension ShowModalSheet on Functions
{
  void showSheet(BuildContext context, Widget sheet) 
  {
    showModalBottomSheet
    (
      constraints: BoxConstraints(
        minHeight: 600.h,
        maxHeight: 1.sh,
      ),
      context: context,
      isScrollControlled: true, 
      isDismissible: true,
      enableDrag: true,
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (BuildContext context) 
      {
        return PopScope
        (
          canPop: false,
          child: sheet
        );
      }
    );
  }

}