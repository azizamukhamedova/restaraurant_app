abstract class BaseException {
  String? message;
}

class ServerUnknownException implements BaseException {
  @override
  String? message;
  ServerUnknownException({this.message});
}

class CacheException implements BaseException {
  @override
  String? message;
  CacheException({this.message});
}
