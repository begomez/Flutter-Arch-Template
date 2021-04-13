import 'package:flutter_template/common/models/ErrorModel.dart';

/**
 * Enum with possible result states
 */
enum ResourceState { INITIAL, LOADING, SUCCESS, ERROR }

/**
 * Wrapper around a result (data or error)
 */
class ResourceResult<T> {
  final T data;
  final ErrorModel error;
  ResourceState state;

  ResourceResult(
      {this.data = null,
      this.error = null,
      this.state = ResourceState.INITIAL});

  bool hasData() => this.data != null;

  bool hasError() => this.error != null;

  bool isLoading() => this._isSomeState(ResourceState.LOADING);

  bool isInitial() => this._isSomeState(ResourceState.INITIAL);

  bool isError() => this._isSomeState(ResourceState.ERROR);

  bool isSuccess() => this._isSomeState(ResourceState.SUCCESS);

  bool _isSomeState(ResourceState target) => this.state == target;

  void setState(ResourceState state) => this.state = state;
}
