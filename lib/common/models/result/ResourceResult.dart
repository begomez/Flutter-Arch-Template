import 'package:flutter_template/common/models/ErrorModel.dart';

/*
 * Enum with possible result statuses
 */
enum ResourceStatus { INITIAL, LOADING, SUCCESS, ERROR }

/*
 * Wrapper around a result, either with data or error.
 * 
 * It is a generic class containing:
 *
 * - TargetData: data type for data model wrapped in the result
 */
class ResourceResult<TargetData> {
  final TargetData? data;
  final ErrorModel? error;
  final ResourceStatus status;

  const ResourceResult(
      {this.data, this.error, this.status = ResourceStatus.INITIAL});

  bool hasData() => this.data != null;

  bool hasError() => this.error != null;

  bool isLoading() => this._isSomeStatus(ResourceStatus.LOADING);

  bool isInitial() => this._isSomeStatus(ResourceStatus.INITIAL);

  bool isError() => this._isSomeStatus(ResourceStatus.ERROR);

  bool isSuccess() => this._isSomeStatus(ResourceStatus.SUCCESS);

  bool _isSomeStatus(ResourceStatus target) => this.status == target;
}
