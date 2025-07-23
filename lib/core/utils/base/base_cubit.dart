import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reading_app/features/shared/data/data_source.dart';
import 'package:reading_app/features/shared/user/user_model.dart';


abstract class BaseCubit<State> extends Cubit<State> {
  BaseCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  Future<void> executeWithCatch<E>
  ({
    required Future<void> Function() action,
    required Function(E) emit,
    required E Function(String) failureStateBuilder,
  }) async 
  {
    try 
    {
      await action();
    } on SocketException catch (e) {
      handleSocketException(e, emit, failureStateBuilder);
    } catch (e) {
      handleGenericException(e, emit, failureStateBuilder);
    }
  }

  List<T> parseResponse<T>
  ({
    required Map<String, dynamic> response,
    required T Function(Map<String, dynamic>) fromJson,
  }) 
  {
    if (response['data'] is List) 
    {
      return (response['data'] as List)
          .map((data) => fromJson(data as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception('Invalid data format.');
    }
  }

  // ! till we setup auth
  Future<User> requireUser() async {
    User? user = DataSource().getUser();
    if (user == null) {
      throw Exception('يرجى تسجيل الدخول أولاً');
    }
    return user;
  }

  void handleSocketException<E>
  (
    SocketException e,
    Function(E) emit,
    E Function(String) failureStateBuilder,
  )
  {
    if (e.osError != null && e.osError!.message.contains('Failed host lookup')) {
      emit(failureStateBuilder('لا يوجد اتصال بالإنترنت'));
    } else {
      emit(failureStateBuilder('خطأ في الاتصال بالشبكة'));
    }
  }

  void handleGenericException<E>(
    Object e,
    Function(E) emit,
    E Function(String) failureStateBuilder,
  ) {
    emit(failureStateBuilder(e.toString().substring(10)));
  }
}
