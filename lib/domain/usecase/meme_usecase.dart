import 'package:complete_advanced_flutter/data/network/failure.dart';
import 'package:complete_advanced_flutter/domain/model/model.dart';
import 'package:complete_advanced_flutter/domain/repository/repository.dart';
import 'package:complete_advanced_flutter/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class MemeUseCase extends BaseUseCase {
  Repository _repository;
  MemeUseCase(this._repository);
  @override
  Future<Either<Failure, MemeObject>> execute(void input) async {
    return await _repository.getMeme();
  }
}
