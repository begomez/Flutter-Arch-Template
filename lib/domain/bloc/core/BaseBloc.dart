import 'dart:async';

import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';

/**
 * Superclass for BLoC instances
 * 
 * Generic class receiving:
 * - Params: model used as input
 * - Output: model used as output
 */
abstract class BaseBloc<Params extends BaseDTO, Output extends BaseModel> {
  StreamController<ResourceResult<Output>> _controller =
      StreamController<ResourceResult<Output>>();

  Stream<ResourceResult<Output>> get output => this._controller.stream;

  StreamSink<ResourceResult<Output>> get input => this._controller.sink;

  BaseBloc();

  void performOperation(Params dto) async {
    var result;
    try {
      final data = await this.fetchData(dto);

      result = this.buildResult(data: data);
    } on DataException catch (de) {
      result = this.buildResult(data: null, errorCode: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      result = this.buildResult(data: null, errorCode: this.getErrorCode());
    } finally {
      this.processNewEvent(result);
    }
  }

  Future<Output> fetchData(Params dto);

  int getErrorCode() => ErrorCodes.INVALID;

  void processNewEvent(ResourceResult event) {
    if (!this._controller.isClosed) {
      this.input.add(event);
    }
  }

  void dispose() {
    this.input.close();

    if (!this._controller.isClosed) {
      this._controller.close();
    }
  }

  ResourceResult<Output> buildResult(
      {Output data = null, int errorCode = ErrorCodes.INVALID}) {
    ResourceResult<Output> res = ResourceResult(
        data: data, error: errorCode >= 0 ? ErrorModel(code: errorCode) : null);

    res.state = res.hasData() ? ResourceState.SUCCESS : ResourceState.ERROR;

    return res;
  }
}
