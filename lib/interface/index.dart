class IResponseData<T> {
  late int code;
  late String msg;
  late T data;
  late List<T> rows;
  late int total;
}
