import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

enum DioMethod {
  get,
  post,
  put,
  delete,
  patch,
  head,
}

class DioResponse<T> {
  /// 消息(例如成功消息文字/错误消息文字)
  final String message;

  /// 自定义code(可根据内部定义方式)
  final int code;

  /// 接口返回的数据
  final T data;

  DioResponse({
    required this.message,
    required this.data,
    required this.code,
  });

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write("\"message\":\"$message\"");
    sb.write(",\"errorMsg\":\"$code\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

class HttpUtil {
  static HttpUtil? _instance;
  factory HttpUtil() => _instance ??= HttpUtil._init();

  /// 声明Dio变量
  static late final Dio dio;

  HttpUtil._init() {
    /// 初始化基本选项
    BaseOptions options = BaseOptions(
        // baseUrl: "http://kas.rxjt.co:7000/rxzc",
        baseUrl: 'http://192.168.31.102:8086',
        connectTimeout: 60 * 1000,
        receiveTimeout: 60 * 1000);

    /// 初始化dio
    dio = Dio(options);

    dio.interceptors.add(RequestInterceptor());
    dio.interceptors.add(ResponseInterceptor());
    dio.interceptors.add(ErrorInterceptor());
  }

  /// 请求类
  Future<T> request<T>(
    String path, {
    DioMethod method = DioMethod.get,
    Map<String, dynamic>? params,
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    const _methodValues = {
      DioMethod.get: 'get',
      DioMethod.post: 'post',
      DioMethod.put: 'put',
      DioMethod.delete: 'delete',
      DioMethod.patch: 'patch',
      DioMethod.head: 'head'
    };

    options ??= Options(method: _methodValues[method]);
    try {
      Response response;
      response = await dio.request(path,
          data: data,
          queryParameters: params,
          cancelToken: cancelToken,
          options: options,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on DioError {
      rethrow;
    }
  }
}

// 请求拦截
class RequestInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['token'] = '';
    debugPrint('request===>:' + options.baseUrl.toString());
    handler.next(options);
  }
}

// 响应拦截
class ResponseInterceptor extends InterceptorsWrapper {
  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    // debugPrint('response===>:' + response.toString());
    // debugPrint('response data===>:' + response.data.toString());
    response.data = Map<String, dynamic>.from(response.data);
    handler.next(response);
  }
}

// 错误拦截
class ErrorInterceptor extends InterceptorsWrapper {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('error===>:' + err.error + err.response.toString());
    switch (err.type) {
      case DioErrorType.connectTimeout:
        break;
      case DioErrorType.response:
        debugPrint('error response===>:' + err.error + err.response.toString());
        break;
      default:
        break;
    }
    // super.onError(err, handler);
  }
}
