part of 'functions.dart';

extension StaggerList on Functions
{
  List<Widget> staggeredList(List<Widget> widgets) {
    return List.generate(
      widgets.length,
      (index) => widgets[index].staggerListVertical(index),
    );
  }

}