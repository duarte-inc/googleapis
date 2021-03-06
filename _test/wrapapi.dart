// This is a generated file (see the discoveryapis_generator project).

// ignore_for_file: camel_case_types
// ignore_for_file: comment_references
// ignore_for_file: file_names
// ignore_for_file: library_names
// ignore_for_file: lines_longer_than_80_chars
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: prefer_interpolation_to_compose_strings
// ignore_for_file: unnecessary_brace_in_string_interps
// ignore_for_file: unnecessary_cast
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: unnecessary_string_interpolations

library wrapApi.D0_1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

const userAgent = 'dart-api-client wrapApi/0.1';

class WrapApi {
  final commons.ApiRequester _requester;

  WrapApi(http.Client client,
      {core.String rootUrl = 'http://localhost:9090/',
      core.String servicePath = 'api/wrapApi/0.1/'})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);

  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// Completes with a [WrapResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<WrapResponse> helloPost(WrapRequest request) async {
    final _body =
        request == null ? null : convert.json.encode(request.toJson());
    const _url = 'helloPost';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
    );
    return WrapResponse.fromJson(
        _response['data'] as core.Map<core.String, core.dynamic>);
  }
}

/// A generic empty message that you can re-use to avoid defining duplicated
/// empty messages in your APIs.
///
/// A typical example is to use it as the request or the response type of an API
/// method. For instance: service Foo { rpc Bar(google.protobuf.Empty) returns
/// (google.protobuf.Empty); } The JSON representation for `Empty` is empty JSON
/// object `{}`.
class Empty {
  Empty();

  Empty.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

class WrapRequest {
  core.int age;
  core.String name;

  WrapRequest();

  WrapRequest.fromJson(core.Map _json) {
    if (_json.containsKey('age')) {
      age = _json['age'] as core.int;
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (age != null) {
      _json['age'] = age;
    }
    if (name != null) {
      _json['name'] = name;
    }
    return _json;
  }
}

class WrapResponse {
  core.String result;

  WrapResponse();

  WrapResponse.fromJson(core.Map _json) {
    if (_json.containsKey('result')) {
      result = _json['result'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (result != null) {
      _json['result'] = result;
    }
    return _json;
  }
}
