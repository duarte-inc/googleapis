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

/// Security Token Service API - v1
///
/// The Security Token Service exchanges Google or third-party credentials for a
/// short-lived access token to Google Cloud resources.
///
/// For more information, see
/// <http://cloud.google.com/iam/docs/workload-identity-federation>
///
/// Create an instance of [CloudSecurityTokenApi] to access these resources:
///
/// - [V1Resource]
library sts.v1;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// The Security Token Service exchanges Google or third-party credentials for a
/// short-lived access token to Google Cloud resources.
class CloudSecurityTokenApi {
  final commons.ApiRequester _requester;

  V1Resource get v1 => V1Resource(_requester);

  CloudSecurityTokenApi(http.Client client,
      {core.String rootUrl = 'https://sts.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class V1Resource {
  final commons.ApiRequester _requester;

  V1Resource(commons.ApiRequester client) : _requester = client;

  /// Exchanges a credential for a Google OAuth 2.0 access token.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [GoogleIdentityStsV1ExchangeTokenResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<GoogleIdentityStsV1ExchangeTokenResponse> token(
    GoogleIdentityStsV1ExchangeTokenRequest request, {
    core.String $fields,
  }) async {
    final _body =
        request == null ? null : convert.json.encode(request.toJson());
    final _queryParams = <core.String, core.List<core.String>>{};
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    const _url = 'v1/token';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
    );
    return GoogleIdentityStsV1ExchangeTokenResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

/// Request message for ExchangeToken.
class GoogleIdentityStsV1ExchangeTokenRequest {
  /// The full resource name of the identity provider; for example:
  /// `//iam.googleapis.com/projects//workloadIdentityPools//providers/`.
  ///
  /// Required when exchanging an external credential for a Google access token.
  core.String audience;

  /// The grant type.
  ///
  /// Must be `urn:ietf:params:oauth:grant-type:token-exchange`, which indicates
  /// a token exchange.
  ///
  /// Required.
  core.String grantType;

  /// A set of features that Security Token Service supports, in addition to the
  /// standard OAuth 2.0 token exchange, formatted as a serialized JSON object
  /// of Options.
  core.String options;

  /// An identifier for the type of requested security token.
  ///
  /// Must be `urn:ietf:params:oauth:token-type:access_token`.
  ///
  /// Required.
  core.String requestedTokenType;

  /// The OAuth 2.0 scopes to include on the resulting access token, formatted
  /// as a list of space-delimited, case-sensitive strings.
  ///
  /// Required when exchanging an external credential for a Google access token.
  core.String scope;

  /// The input token.
  ///
  /// You can use a Google-issued OAuth 2.0 access token with this field to
  /// obtain an access token with new security attributes applied, such as a
  /// Credential Access Boundary. If an access token already contains security
  /// attributes, you cannot apply additional security attributes.
  ///
  /// Required.
  core.String subjectToken;

  /// An identifier that indicates the type of the security token in the
  /// `subject_token` parameter.
  ///
  /// Must be `urn:ietf:params:oauth:token-type:access_token`.
  ///
  /// Required.
  core.String subjectTokenType;

  GoogleIdentityStsV1ExchangeTokenRequest();

  GoogleIdentityStsV1ExchangeTokenRequest.fromJson(core.Map _json) {
    if (_json.containsKey('audience')) {
      audience = _json['audience'] as core.String;
    }
    if (_json.containsKey('grantType')) {
      grantType = _json['grantType'] as core.String;
    }
    if (_json.containsKey('options')) {
      options = _json['options'] as core.String;
    }
    if (_json.containsKey('requestedTokenType')) {
      requestedTokenType = _json['requestedTokenType'] as core.String;
    }
    if (_json.containsKey('scope')) {
      scope = _json['scope'] as core.String;
    }
    if (_json.containsKey('subjectToken')) {
      subjectToken = _json['subjectToken'] as core.String;
    }
    if (_json.containsKey('subjectTokenType')) {
      subjectTokenType = _json['subjectTokenType'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (audience != null) {
      _json['audience'] = audience;
    }
    if (grantType != null) {
      _json['grantType'] = grantType;
    }
    if (options != null) {
      _json['options'] = options;
    }
    if (requestedTokenType != null) {
      _json['requestedTokenType'] = requestedTokenType;
    }
    if (scope != null) {
      _json['scope'] = scope;
    }
    if (subjectToken != null) {
      _json['subjectToken'] = subjectToken;
    }
    if (subjectTokenType != null) {
      _json['subjectTokenType'] = subjectTokenType;
    }
    return _json;
  }
}

/// Response message for ExchangeToken.
class GoogleIdentityStsV1ExchangeTokenResponse {
  /// An OAuth 2.0 security token, issued by Google, in response to the token
  /// exchange request.
  core.String accessToken;

  /// The amount of time, in seconds, between the time when the access token was
  /// issued and the time when the access token will expire.
  ///
  /// This field is absent when the `subject_token` in the request is a
  /// Google-issued, short-lived access token. In this case, the access token
  /// has the same expiration time as the `subject_token`.
  core.int expiresIn;

  /// The token type.
  ///
  /// Always matches the value of `requested_token_type` from the request.
  core.String issuedTokenType;

  /// The type of access token.
  ///
  /// Always has the value `Bearer`.
  core.String tokenType;

  GoogleIdentityStsV1ExchangeTokenResponse();

  GoogleIdentityStsV1ExchangeTokenResponse.fromJson(core.Map _json) {
    if (_json.containsKey('access_token')) {
      accessToken = _json['access_token'] as core.String;
    }
    if (_json.containsKey('expires_in')) {
      expiresIn = _json['expires_in'] as core.int;
    }
    if (_json.containsKey('issued_token_type')) {
      issuedTokenType = _json['issued_token_type'] as core.String;
    }
    if (_json.containsKey('token_type')) {
      tokenType = _json['token_type'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (accessToken != null) {
      _json['access_token'] = accessToken;
    }
    if (expiresIn != null) {
      _json['expires_in'] = expiresIn;
    }
    if (issuedTokenType != null) {
      _json['issued_token_type'] = issuedTokenType;
    }
    if (tokenType != null) {
      _json['token_type'] = tokenType;
    }
    return _json;
  }
}
