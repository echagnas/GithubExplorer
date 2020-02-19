///
/// Done by E.Brulatout
///

import './error.dart';

enum _ViewModelStatusType { empty, loading, issue, loaded }

abstract class ViewModelStatus<T> {
  _ViewModelStatusType get _statusType;

  R join<R>({R empty(), R loading(), R issue(ErrorService error), R loaded(T value)}) {
    switch (_statusType) {
      case _ViewModelStatusType.empty:
        return empty();
      case _ViewModelStatusType.loading:
        return loading();
      case _ViewModelStatusType.issue:
        return issue((this as Issue<T>)._err);
      default:
        return loaded((this as Loaded<T>)._value);
    }
  }
}

class Empty<T> extends ViewModelStatus<T> {
  @override
  _ViewModelStatusType get _statusType => _ViewModelStatusType.empty;
}

class Loading<T> extends ViewModelStatus<T> {
  @override
  _ViewModelStatusType get _statusType => _ViewModelStatusType.loading;
}

class Issue<T> extends ViewModelStatus<T> {
  Issue(this._err);

  final ErrorService _err;

  ErrorServiceType get type => _err.type;
  String get message => _err.message;

  @override
  _ViewModelStatusType get _statusType => _ViewModelStatusType.issue;
}

class Loaded<T> extends ViewModelStatus<T> {
  Loaded(this._value);

  final T _value;
  T get value => _value;

  @override
  _ViewModelStatusType get _statusType => _ViewModelStatusType.loaded;
}
