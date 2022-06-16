import 'dart:ffi';

import 'package:complete_advanced_flutter/domain/model/model.dart';
import 'package:complete_advanced_flutter/domain/usecase/meme_usecase.dart';
import 'package:complete_advanced_flutter/presentation/base/baseviewmodel.dart';
import 'package:complete_advanced_flutter/presentation/common/state_renderer/state_render_impl.dart';
import 'package:complete_advanced_flutter/presentation/common/state_renderer/state_renderer.dart';
import 'package:rxdart/rxdart.dart';

class MemeViewModel extends BaseViewModel
    with MemeViewModelInput, MemeViewModelOutput {
  MemeUseCase _memeUseCase;
  MemeViewModel(this._memeUseCase);

  final _dataStreamController = BehaviorSubject<MemeData>();

  final _memeStreamController = BehaviorSubject<Meme>();

  @override
  void start() {
    _getMemes();
  }

  @override
  Sink get inputsMeme => _dataStreamController.sink;

  @override
  // TODO: implement outputMemes
  Stream<MemeData> get outputMemes =>
      _dataStreamController.stream.map((data) => data);

  @override
  dispose() {
    _dataStreamController.close();
    _memeStreamController.close();
    return super.dispose();
  }

  _getMemes() async {
    //Loading Screen with Full screen State
    inputState.add(LoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));

    (await _memeUseCase.execute(Void)).fold((failure) {
      inputState.add(ErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, failure.message));
    }, (success) {
      inputState.add(ContentState());

      inputsMeme.add(success.memeData);
    });
  }

  //listen meme
  @override
  Stream<Meme> get outputmemeItems =>
      _memeStreamController.stream.map((meme) => meme);

  @override
  Sink get inputgetMeme => _memeStreamController.sink;

  @override
  selectMeme(Meme meme) {
    inputgetMeme.add(meme);
  }
}

abstract class MemeViewModelInput {
  Sink get inputsMeme;
  Sink get inputgetMeme;
  selectMeme(Meme meme);
}

abstract class MemeViewModelOutput {
  dispose();
  Stream<MemeData> get outputMemes;

  Stream<Meme> get outputmemeItems;
}
