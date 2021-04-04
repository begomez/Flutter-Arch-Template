import 'package:flutter_template/common/models/ErrorModel.dart';

enum ResourceState { INITIAL, LOADING, SUCCESS, ERROR }

class ResourceResult<T> {
  final T data;
  final ErrorModel error;
  final ResourceState state;

  const ResourceResult(
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
}
