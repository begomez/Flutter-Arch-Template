import 'dart:async';

import 'package:flutter_template/common/models/core/BaseModel.dart';
import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/result/ResourceResult.dart';
import 'package:flutter_template/data/exception/DataException.dart';
import 'package:flutter_template/domain/ErrorCodes.dart';
import 'package:flutter_template/domain/event/core/BaseEvent.dart';

/**
 * Superclass for BLoC instances
 * 
 * It is a generic class receiving:
 * - Input: model used as bloc input/params
 * - Output: model used as bloc output/result
 */
abstract class BaseBloc<Input extends BaseEvent, Output extends BaseModel> {
  StreamController<ResourceResult<Output>> _controller =
      StreamController<ResourceResult<Output>>();

  BaseBloc();

  /**
   * Performs bloc's main operation (data retrieval, data storage...)
   * 
   * @param dto
   */
  void performOperation(Input dto) async {
    var result;
    try {
      final data = await this.manageData(dto);

      result = this.buildResult(data: data);
    } on DataException catch (de) {
      result = this.buildResult(data: null, errorCode: ErrorCodes.DATA_ERROR);
    } on Exception catch (e) {
      result = this.buildResult(data: null, errorCode: this.getErrorCode());
    } finally {
      this.processNewEvent(result);
    }
  }

  /**
   * Virtual method to manage data.
   * Must be overriden by children.
   * 
   * @param dto
   */
  Future<Output> manageData(Input dto);

  /**
   * Returns specific error code  for this operation.
   * Can/should be overriden by children
   */
  int getErrorCode() => ErrorCodes.INVALID;

  /**
   * Adds a new event to the stream controller 
   * 
   * @param event
   */
  void processNewEvent(ResourceResult event) {
    if (!this._controller.isClosed) {
      this.input.add(event);
    }
  }

  /**
   * Free bloc resources
   */
  void dispose() {
    this.input.close();

    if (!this._controller.isClosed) {
      this._controller.close();
    }
  }

  /**
   * Wrap operation result on a result object, for consistency
   * 
   * @param data
   * @param errorCode
   */
  ResourceResult<Output> buildResult(
      {Output data, int errorCode = ErrorCodes.INVALID}) {
    ResourceResult<Output> res = ResourceResult(
        data: data, error: errorCode >= 0 ? ErrorModel(code: errorCode) : null);

    res.status = res.hasData() ? ResourceStatus.SUCCESS : ResourceStatus.ERROR;

    return res;
  }

  /**
   * Stream accessor
   */
  Stream<ResourceResult<Output>> get output => this._controller.stream;

  /**
   * Sink accessor
   */
  StreamSink<ResourceResult<Output>> get input => this._controller.sink;
}
