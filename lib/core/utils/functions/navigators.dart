part of 'functions.dart';

extension Navigators on  Functions
{
  void navigateTo(BuildContext context, Widget page) 
  {
    Navigator.of(context).push(SlideRight(page: page));
  }

  void navigateReplace(BuildContext context, Widget page) 
  {
    Navigator.of(context).pushReplacement(SlideRight(page: page));
  }

  void navigateRemoveUntil(BuildContext context, Widget page) 
  {
    Navigator.of(context).pushAndRemoveUntil(SlideRight(page: page), (route) => false);
  }

  void pop(BuildContext context) 
  {
    if(Navigator.of(context).canPop())
    {
      Navigator.of(context).pop();
    }
  }
}

