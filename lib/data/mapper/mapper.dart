import 'package:complete_advanced_flutter/app/extensions.dart';
import 'package:complete_advanced_flutter/data/responses/responses.dart';

// to convert the response into a non nullable object (model)

import 'package:complete_advanced_flutter/domain/model/model.dart';

const EMPTY = "";
const ZERO = 0;

extension MemeResponseMapper on MemeResponse {
  Meme toDomain() {
    return Meme(
      this.id?.orEmpty() ?? EMPTY,
      this.name?.orEmpty() ?? EMPTY,
      this.url?.orEmpty() ?? EMPTY,
      this.width?.orZero() ?? ZERO,
      this.height?.orZero() ?? ZERO,
      this.boxCount?.orZero() ?? ZERO,
    );
  }
}

extension MemedataMapper on MemeHomeResponse {
  MemeObject toDomain() {
    List<Meme> memelist =
        (this.memeDataResponse?.meme?.map((meme) => meme.toDomain()) ??
                Iterable.empty())
            .cast<Meme>()
            .toList();
    return MemeObject(MemeData(memelist));
  }
}
