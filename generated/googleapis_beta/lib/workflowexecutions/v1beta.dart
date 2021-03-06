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

/// Workflow Executions API - v1beta
///
/// Execute workflows created with Workflows API.
///
/// For more information, see <https://cloud.google.com/workflows>
///
/// Create an instance of [WorkflowExecutionsApi] to access these resources:
///
/// - [ProjectsResource]
///   - [ProjectsLocationsResource]
///     - [ProjectsLocationsWorkflowsResource]
///       - [ProjectsLocationsWorkflowsExecutionsResource]
library workflowexecutions.v1beta;

import 'dart:async' as async;
import 'dart:convert' as convert;
import 'dart:core' as core;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

import '../src/user_agent.dart';

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart'
    show ApiRequestError, DetailedApiRequestError;

/// Execute workflows created with Workflows API.
class WorkflowExecutionsApi {
  /// View and manage your data across Google Cloud Platform services
  static const cloudPlatformScope =
      'https://www.googleapis.com/auth/cloud-platform';

  final commons.ApiRequester _requester;

  ProjectsResource get projects => ProjectsResource(_requester);

  WorkflowExecutionsApi(http.Client client,
      {core.String rootUrl = 'https://workflowexecutions.googleapis.com/',
      core.String servicePath = ''})
      : _requester =
            commons.ApiRequester(client, rootUrl, servicePath, userAgent);
}

class ProjectsResource {
  final commons.ApiRequester _requester;

  ProjectsLocationsResource get locations =>
      ProjectsLocationsResource(_requester);

  ProjectsResource(commons.ApiRequester client) : _requester = client;
}

class ProjectsLocationsResource {
  final commons.ApiRequester _requester;

  ProjectsLocationsWorkflowsResource get workflows =>
      ProjectsLocationsWorkflowsResource(_requester);

  ProjectsLocationsResource(commons.ApiRequester client) : _requester = client;
}

class ProjectsLocationsWorkflowsResource {
  final commons.ApiRequester _requester;

  ProjectsLocationsWorkflowsExecutionsResource get executions =>
      ProjectsLocationsWorkflowsExecutionsResource(_requester);

  ProjectsLocationsWorkflowsResource(commons.ApiRequester client)
      : _requester = client;
}

class ProjectsLocationsWorkflowsExecutionsResource {
  final commons.ApiRequester _requester;

  ProjectsLocationsWorkflowsExecutionsResource(commons.ApiRequester client)
      : _requester = client;

  /// Cancels an execution of the given name.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Name of the execution to be cancelled. Format:
  /// projects/{project}/locations/{location}/workflows/{workflow}/executions/{execution}
  /// Value must have pattern
  /// `^projects/\[^/\]+/locations/\[^/\]+/workflows/\[^/\]+/executions/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Execution].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Execution> cancel(
    CancelExecutionRequest request,
    core.String name, {
    core.String $fields,
  }) async {
    final _body =
        request == null ? null : convert.json.encode(request.toJson());
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    final _queryParams = <core.String, core.List<core.String>>{};
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    final _url =
        'v1beta/' + commons.Escaper.ecapeVariableReserved('$name') + ':cancel';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
    );
    return Execution.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Creates a new execution using the latest revision of the given workflow.
  ///
  /// [request] - The metadata request object.
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Name of the workflow for which an execution should be
  /// created. Format:
  /// projects/{project}/locations/{location}/workflows/{workflow} The latest
  /// revision of the workflow will be used.
  /// Value must have pattern
  /// `^projects/\[^/\]+/locations/\[^/\]+/workflows/\[^/\]+$`.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Execution].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Execution> create(
    Execution request,
    core.String parent, {
    core.String $fields,
  }) async {
    final _body =
        request == null ? null : convert.json.encode(request.toJson());
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    final _queryParams = <core.String, core.List<core.String>>{};
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    final _url = 'v1beta/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/executions';

    final _response = await _requester.request(
      _url,
      'POST',
      body: _body,
      queryParams: _queryParams,
    );
    return Execution.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Returns an execution of the given name.
  ///
  /// Request parameters:
  ///
  /// [name] - Required. Name of the execution to be retrieved. Format:
  /// projects/{project}/locations/{location}/workflows/{workflow}/executions/{execution}
  /// Value must have pattern
  /// `^projects/\[^/\]+/locations/\[^/\]+/workflows/\[^/\]+/executions/\[^/\]+$`.
  ///
  /// [view] - Optional. A view defining which fields should be filled in the
  /// returned execution. The API will default to the FULL view.
  /// Possible string values are:
  /// - "EXECUTION_VIEW_UNSPECIFIED" : The default / unset value.
  /// - "BASIC" : Includes only basic metadata about the execution. Following
  /// fields are returned: name, start_time, end_time, state and
  /// workflow_revision_id.
  /// - "FULL" : Includes all data.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [Execution].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<Execution> get(
    core.String name, {
    core.String view,
    core.String $fields,
  }) async {
    if (name == null) {
      throw core.ArgumentError('Parameter name is required.');
    }
    final _queryParams = <core.String, core.List<core.String>>{};
    if (view != null) {
      _queryParams['view'] = [view];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    final _url = 'v1beta/' + commons.Escaper.ecapeVariableReserved('$name');

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
    );
    return Execution.fromJson(_response as core.Map<core.String, core.dynamic>);
  }

  /// Returns a list of executions which belong to the workflow with the given
  /// name.
  ///
  /// The method returns executions of all workflow revisions. Returned
  /// executions are ordered by their start time (newest first).
  ///
  /// Request parameters:
  ///
  /// [parent] - Required. Name of the workflow for which the executions should
  /// be listed. Format:
  /// projects/{project}/locations/{location}/workflows/{workflow}
  /// Value must have pattern
  /// `^projects/\[^/\]+/locations/\[^/\]+/workflows/\[^/\]+$`.
  ///
  /// [pageSize] - Maximum number of executions to return per call. Max
  /// supported value depends on the selected Execution view: it's 10000 for
  /// BASIC and 100 for FULL. The default value used if the field is not
  /// specified is 100, regardless of the selected view. Values greater than the
  /// max value will be coerced down to it.
  ///
  /// [pageToken] - A page token, received from a previous `ListExecutions`
  /// call. Provide this to retrieve the subsequent page. When paginating, all
  /// other parameters provided to `ListExecutions` must match the call that
  /// provided the page token.
  ///
  /// [view] - Optional. A view defining which fields should be filled in the
  /// returned executions. The API will default to the BASIC view.
  /// Possible string values are:
  /// - "EXECUTION_VIEW_UNSPECIFIED" : The default / unset value.
  /// - "BASIC" : Includes only basic metadata about the execution. Following
  /// fields are returned: name, start_time, end_time, state and
  /// workflow_revision_id.
  /// - "FULL" : Includes all data.
  ///
  /// [$fields] - Selector specifying which fields to include in a partial
  /// response.
  ///
  /// Completes with a [ListExecutionsResponse].
  ///
  /// Completes with a [commons.ApiRequestError] if the API endpoint returned an
  /// error.
  ///
  /// If the used [http.Client] completes with an error when making a REST call,
  /// this method will complete with the same error.
  async.Future<ListExecutionsResponse> list(
    core.String parent, {
    core.int pageSize,
    core.String pageToken,
    core.String view,
    core.String $fields,
  }) async {
    if (parent == null) {
      throw core.ArgumentError('Parameter parent is required.');
    }
    final _queryParams = <core.String, core.List<core.String>>{};
    if (pageSize != null) {
      _queryParams['pageSize'] = ['${pageSize}'];
    }
    if (pageToken != null) {
      _queryParams['pageToken'] = [pageToken];
    }
    if (view != null) {
      _queryParams['view'] = [view];
    }
    if ($fields != null) {
      _queryParams['fields'] = [$fields];
    }

    final _url = 'v1beta/' +
        commons.Escaper.ecapeVariableReserved('$parent') +
        '/executions';

    final _response = await _requester.request(
      _url,
      'GET',
      queryParams: _queryParams,
    );
    return ListExecutionsResponse.fromJson(
        _response as core.Map<core.String, core.dynamic>);
  }
}

/// Request for the CancelExecution method.
class CancelExecutionRequest {
  CancelExecutionRequest();

  CancelExecutionRequest.fromJson(
      // ignore: avoid_unused_constructor_parameters
      core.Map _json);

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    return _json;
  }
}

/// Error describes why the execution was abnormally terminated.
class Error {
  /// Human readable stack trace string.
  core.String context;

  /// Error message and data returned represented as a JSON string.
  core.String payload;

  /// Stack trace with detailed information of where error was generated.
  StackTrace stackTrace;

  Error();

  Error.fromJson(core.Map _json) {
    if (_json.containsKey('context')) {
      context = _json['context'] as core.String;
    }
    if (_json.containsKey('payload')) {
      payload = _json['payload'] as core.String;
    }
    if (_json.containsKey('stackTrace')) {
      stackTrace = StackTrace.fromJson(
          _json['stackTrace'] as core.Map<core.String, core.dynamic>);
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (context != null) {
      _json['context'] = context;
    }
    if (payload != null) {
      _json['payload'] = payload;
    }
    if (stackTrace != null) {
      _json['stackTrace'] = stackTrace.toJson();
    }
    return _json;
  }
}

/// A running instance of a
/// \[Workflow\](/workflows/docs/reference/rest/v1beta/projects.locations.workflows).
class Execution {
  /// Input parameters of the execution represented as a JSON string.
  ///
  /// The size limit is 32KB. *Note*: If you are using the REST API directly to
  /// run your workflow, you must escape any JSON string value of `argument`.
  /// Example:
  /// `'{"argument":"{\"firstName\":\"FIRST\",\"lastName\":\"LAST\"}"}'`
  core.String argument;

  /// Marks the end of execution, successful or not.
  ///
  /// Output only.
  core.String endTime;

  /// The error which caused the execution to finish prematurely.
  ///
  /// The value is only present if the execution's state is `FAILED` or
  /// `CANCELLED`.
  ///
  /// Output only.
  Error error;

  /// The resource name of the execution.
  ///
  /// Format:
  /// projects/{project}/locations/{location}/workflows/{workflow}/executions/{execution}
  ///
  /// Output only.
  core.String name;

  /// Output of the execution represented as a JSON string.
  ///
  /// The value can only be present if the execution's state is `SUCCEEDED`.
  ///
  /// Output only.
  core.String result;

  /// Marks the beginning of execution.
  ///
  /// Output only.
  core.String startTime;

  /// Current state of the execution.
  ///
  /// Output only.
  /// Possible string values are:
  /// - "STATE_UNSPECIFIED" : Invalid state.
  /// - "ACTIVE" : The execution is in progress.
  /// - "SUCCEEDED" : The execution finished successfully.
  /// - "FAILED" : The execution failed with an error.
  /// - "CANCELLED" : The execution was stopped intentionally.
  core.String state;

  /// Revision of the workflow this execution is using.
  ///
  /// Output only.
  core.String workflowRevisionId;

  Execution();

  Execution.fromJson(core.Map _json) {
    if (_json.containsKey('argument')) {
      argument = _json['argument'] as core.String;
    }
    if (_json.containsKey('endTime')) {
      endTime = _json['endTime'] as core.String;
    }
    if (_json.containsKey('error')) {
      error =
          Error.fromJson(_json['error'] as core.Map<core.String, core.dynamic>);
    }
    if (_json.containsKey('name')) {
      name = _json['name'] as core.String;
    }
    if (_json.containsKey('result')) {
      result = _json['result'] as core.String;
    }
    if (_json.containsKey('startTime')) {
      startTime = _json['startTime'] as core.String;
    }
    if (_json.containsKey('state')) {
      state = _json['state'] as core.String;
    }
    if (_json.containsKey('workflowRevisionId')) {
      workflowRevisionId = _json['workflowRevisionId'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (argument != null) {
      _json['argument'] = argument;
    }
    if (endTime != null) {
      _json['endTime'] = endTime;
    }
    if (error != null) {
      _json['error'] = error.toJson();
    }
    if (name != null) {
      _json['name'] = name;
    }
    if (result != null) {
      _json['result'] = result;
    }
    if (startTime != null) {
      _json['startTime'] = startTime;
    }
    if (state != null) {
      _json['state'] = state;
    }
    if (workflowRevisionId != null) {
      _json['workflowRevisionId'] = workflowRevisionId;
    }
    return _json;
  }
}

/// Response for the ListExecutions method.
class ListExecutionsResponse {
  /// The executions which match the request.
  core.List<Execution> executions;

  /// A token, which can be sent as `page_token` to retrieve the next page.
  ///
  /// If this field is omitted, there are no subsequent pages.
  core.String nextPageToken;

  ListExecutionsResponse();

  ListExecutionsResponse.fromJson(core.Map _json) {
    if (_json.containsKey('executions')) {
      executions = (_json['executions'] as core.List)
          .map<Execution>((value) =>
              Execution.fromJson(value as core.Map<core.String, core.dynamic>))
          .toList();
    }
    if (_json.containsKey('nextPageToken')) {
      nextPageToken = _json['nextPageToken'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (executions != null) {
      _json['executions'] = executions.map((value) => value.toJson()).toList();
    }
    if (nextPageToken != null) {
      _json['nextPageToken'] = nextPageToken;
    }
    return _json;
  }
}

/// A collection of stack elements (frames) where an error occurred.
class StackTrace {
  /// An array of Stack elements.
  core.List<StackTraceElement> elements;

  StackTrace();

  StackTrace.fromJson(core.Map _json) {
    if (_json.containsKey('elements')) {
      elements = (_json['elements'] as core.List)
          .map<StackTraceElement>((value) => StackTraceElement.fromJson(
              value as core.Map<core.String, core.dynamic>))
          .toList();
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (elements != null) {
      _json['elements'] = elements.map((value) => value.toJson()).toList();
    }
    return _json;
  }
}

/// A single stack element (frame) where an error occurred.
class StackTraceElement {
  /// The source code column position (of the line) the current instruction was
  /// generated from.
  core.String column;

  /// The source code line number the current instruction was generated from.
  core.String line;

  /// The routine where the error occurred.
  core.String routine;

  /// The step the error occurred at.
  core.String step;

  StackTraceElement();

  StackTraceElement.fromJson(core.Map _json) {
    if (_json.containsKey('column')) {
      column = _json['column'] as core.String;
    }
    if (_json.containsKey('line')) {
      line = _json['line'] as core.String;
    }
    if (_json.containsKey('routine')) {
      routine = _json['routine'] as core.String;
    }
    if (_json.containsKey('step')) {
      step = _json['step'] as core.String;
    }
  }

  core.Map<core.String, core.Object> toJson() {
    final _json = <core.String, core.Object>{};
    if (column != null) {
      _json['column'] = column;
    }
    if (line != null) {
      _json['line'] = line;
    }
    if (routine != null) {
      _json['routine'] = routine;
    }
    if (step != null) {
      _json['step'] = step;
    }
    return _json;
  }
}
