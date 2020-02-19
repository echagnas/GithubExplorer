///
/// Done by E.Brulatout
///

enum ErrorServiceType { Fatal, NotFound, RateLimit, JsonDecode, Server }

class ErrorService {
  String _message;
  ErrorServiceType _type;

  ErrorService(this._type, this._message);

  String get message => _message;
  ErrorServiceType get type => _type;

  @override
  String toString() {
    return "[$_type] $_message";
  }
}
