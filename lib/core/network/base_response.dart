class BaseResponse<T> {
  List<T>? data;
  bool? hasErrored;
  String? message;
  int? statusCode;

  BaseResponse({
    this.data,
    this.hasErrored,
    this.message,
    this.statusCode,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> jsonData, Function fromJsonData) {
    List<T> data = [];
    if (jsonData["data"] is List) {
      data = jsonData["data"].map((e) => fromJsonData(e));
    } else {
      data = fromJsonData(jsonData["data"]);
    }
    return BaseResponse(
      data: data,
      hasErrored: jsonData["hasErrored"],
      message: jsonData["message"],
      statusCode: jsonData["statusCode"],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["data"] = this.data?.map((dynamic e) => e?.toJson()).toList();
    data["hasErrored"] = hasErrored;
    data["message"] = message;
    data["statusCode"] = statusCode;
    return data;
  }
}
