part of 'functions.dart';

extension ShowModalSheet on Functions
{
  void showSheet(BuildContext context, Widget sheet) 
  {
    showModalBottomSheet
    (
      
      context: context,
      isScrollControlled: true, 
      isDismissible: false,
      enableDrag: false,
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