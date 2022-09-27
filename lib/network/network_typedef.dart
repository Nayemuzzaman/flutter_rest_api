import 'package:flutter_rest_api/network/network_enum.dart';

typedef NetworkCallBack<R> = Function(dynamic);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
  NetworkResponseErrorType, String
);
