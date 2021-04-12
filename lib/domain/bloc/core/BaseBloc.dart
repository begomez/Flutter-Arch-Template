import 'dart:async';

import 'package:flutter_template/common/models/BaseModel.dart';
import 'package:flutter_template/common/models/ErrorModel.dart';
import 'package:flutter_template/common/models/ResourceResult.dart';
import 'package:flutter_template/domain/dto/core/BaseDTO.dart';

abstract class BaseBloc<Params extends BaseDTO, Data extends BaseModel> {
  StreamController<ResourceResult<Data>> _controller =
      StreamController<ResourceResult<Data>>();

  Stream<ResourceResult<Data>> get output => this._controller.stream;

  StreamSink<ResourceResult<Data>> get input => this._controller.sink;

  BaseBloc();

  void performOperation(Params dto);

  void processNewEvent(ResourceResult event) {
    if (!this._controller.isClosed) {
      this.input.add(event);
    }
  }

  void dispose() {
    this.input.close();

    if (this._controller.isClosed) {
      this._controller.close();
    }
  }

  ResourceResult<Data> buildResult(
          {Data data = null, ErrorModel error = null}) =>
      ResourceResult(data: data, error: error);
}
