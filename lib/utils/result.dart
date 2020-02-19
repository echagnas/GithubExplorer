///
/// Done by E.Brulatout
///

enum _Result { error, ok }

abstract class Result<E, O> {
  _Result get _type;

  T join<T>({T error(E e), T ok(O o)}) {
    switch (_type) {
      case _Result.error:
        return error((this as Error).error);
      default:
        return ok((this as Ok).value);
    }
  }

  bool isOk() => _type == _Result.ok;
  bool isError() => _type == _Result.error;

  @override
  bool operator ==(Object other) =>
      other is Error<E, O> && this is Error<E, O> && other.error == (this as Error<E, O>).error ||
      other is Ok<E, O> && this is Ok<E, O> && other.value == (this as Ok<E, O>).value;

  Object _valueObject() {
    if (this is Error<E, O>) {
      return (this as Error<E, O>).error;
    }
    return (this as Ok<E, O>).value;
  }

  @override
  int get hashCode => _type.hashCode ^ _valueObject()?.hashCode;
}

class Error<E, O> extends Result<E, O> {
  Error(this._err);

  final E _err;

  E get error => _err;

  _Result get _type => _Result.error;

  @override
  String toString() {
    return "Error<$_err>";
  }
}

class Ok<E, O> extends Result<E, O> {
  Ok(this._value);

  final O _value;

  O get value => _value;

  _Result get _type => _Result.ok;

  @override
  String toString() {
    return "Ok<$_value>";
  }
}
