import 'package:flutter_template/common/models/ErrorModel.dart';

/**
 * Enum with possible result states
 */
enum ResourceStatus { INITIAL, LOADING, SUCCESS, ERROR }

/**
 * Wrapper around a result (either with data or error).
 * 
 * It is a generic class:
 * - TargetData: data model wrapped
 */
class ResourceResult<TargetData> {
  final TargetData data;
  final ErrorModel error;
  ResourceStatus status;

  ResourceResult({this.data, this.error, this.status = ResourceStatus.INITIAL});

  bool hasData() => this.data != null;

  bool hasError() => this.error != null;

  bool isLoading() => this._isSomeState(ResourceStatus.LOADING);

  bool isInitial() => this._isSomeState(ResourceStatus.INITIAL);

  bool isError() => this._isSomeState(ResourceStatus.ERROR);

  bool isSuccess() => this._isSomeState(ResourceStatus.SUCCESS);

  bool _isSomeState(ResourceStatus target) => this.status == target;

  void setState(ResourceStatus state) => this.status = state;
}
