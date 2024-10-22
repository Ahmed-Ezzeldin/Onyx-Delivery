import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:onyx_delivery/services/api/app_failure.dart';
import 'package:onyx_delivery/services/api/either.dart';
import 'package:onyx_delivery/utils/app_environment.dart';
import 'package:onyx_delivery/utils/logger.dart';

enum RequestType {
  post,
  get,
  put,
  patch,
  delete,
}

class HttpService {
  static Future<Either<AppFailure, dynamic>> request({
    required RequestType requestType,
    required Map<String, String> header,
    String endPoint = "",
    String? serverURL,
    Map<String, dynamic>? body,
    Map<String, String>? queryParams,
    bool isFirstTime = true,
  }) async {
    try {
      http.Response? response;
      Duration timeoutDuration = const Duration(seconds: 30);
      Uri uri = Uri.parse((serverURL ?? AppEnvironment.instance.serverURL) + endPoint);
      uri = uri.replace(queryParameters: queryParams);

      Logger.printt("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
      Logger.printt("URI: $uri");
      Logger.printt("EndPoint: $endPoint");
      Logger.printt("Request Type: ${requestType.name.toUpperCase()}");
      Logger.printt("Header: $header");
      Logger.printt("Body: $body");
      Logger.printt("QueryParams: $queryParams");
      Logger.printt("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");

      switch (requestType) {
        case RequestType.post:
          {
            response = await http
                .post(
                  uri,
                  headers: header,
                  encoding: Encoding.getByName("utf-8"),
                  body: json.encode(body),
                )
                .timeout(timeoutDuration);
          }
          break;
        case RequestType.put:
          {
            response = await http
                .put(
                  uri,
                  headers: header,
                  encoding: Encoding.getByName("utf-8"),
                  body: json.encode(body),
                )
                .timeout(timeoutDuration);
          }
          break;
        case RequestType.patch:
          {
            response = await http
                .patch(
                  uri,
                  headers: header,
                  encoding: Encoding.getByName("utf-8"),
                  body: json.encode(body),
                )
                .timeout(timeoutDuration);
          }
          break;
        case RequestType.get:
          {
            response = await http
                .get(
                  uri,
                  headers: header,
                )
                .timeout(timeoutDuration);
          }
          break;
        case RequestType.delete:
          {
            response = await http
                .delete(
                  uri,
                  headers: header,
                )
                .timeout(timeoutDuration);
          }
          break;
      }
      dynamic responseJson = json.decode(response.body);
      Either<AppFailure, dynamic> responseResult = Either();
      switch (response.statusCode) {
        case 200:
        case 201:
          Logger.printt("✅ Request Success ( ${response.statusCode} ) ✅");
          Logger.printObject(responseJson, title: "HTTP request 🛎️🛎️");
          if (responseJson["Result"]["ErrNo"] == 0) {
            responseResult = Either(right: responseJson);
          } else {
            String message = responseJson["Result"]["ErrMsg"] ?? "Something went wrong";
            responseResult = Either(left: ApiFailure(message: message, statusCode: response.statusCode));
          }
          break;
        default:
          Logger.printt("❌❌ Request Failed (${response.statusCode}) ❌❌");
          Logger.printObject(responseJson, title: "HTTP request 🛎️🛎️");
          String message = responseJson["Result"]["ErrMsg"] ?? "Something went wrong";
          responseResult = Either(left: ApiFailure(message: message, statusCode: response.statusCode));
      }
      return responseResult;
    } on TimeoutException catch (error) {
      Logger.printt("<<Timeout Exception>> ⌛⌛ ${error.toString()} ⌛⌛", isError: true);
      return Either(left: TimeoutFailure(message: AppFailure.getMessage(AppFailureType.timeout)));
    } on SocketException catch (error) {
      Logger.printt("<<Socket Exception>> 🧨🧨 ${error.toString()} 🧨🧨", isError: true);
      return Either(left: SocketFailure(message: AppFailure.getMessage(AppFailureType.socket)));
    } on HttpException catch (error) {
      Logger.printt("<<Http Exception>> 💥💥 ${error.toString()} 💥💥", isError: true);
      return Either(left: HttpFailure(message: AppFailure.getMessage(AppFailureType.http)));
    } on FormatException catch (error) {
      Logger.printt("<<Format Exception>> 📄❗️ ${error.toString()} ❗️📄", isError: true);
      return Either(left: FormatFailure(message: AppFailure.getMessage(AppFailureType.format)));
    } on Error catch (error) {
      Logger.printt("<<Error Exception>> 💣💣 ${error.toString()} 💣💣", isError: true);
      return Either(left: ErrorFailure(message: AppFailure.getMessage(AppFailureType.error)));
    } catch (error) {
      Logger.printt("<<Exception>> 🚨🚨 ${error.toString()} 🚨🚨", isError: true);
      return Either(left: OtherFailure(message: AppFailure.getMessage(AppFailureType.other)));
    }
  }
}
