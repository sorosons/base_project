import 'package:complete_advanced_flutter/data/data_source/local_data_source.dart';
import 'package:complete_advanced_flutter/data/data_source/remote_data_source.dart';
import 'package:complete_advanced_flutter/data/network/error_handler.dart';
import 'package:complete_advanced_flutter/data/network/failure.dart';
import 'package:complete_advanced_flutter/data/network/network_info.dart';
import 'package:complete_advanced_flutter/data/request/request.dart';
import 'package:complete_advanced_flutter/domain/model/model.dart';
import 'package:complete_advanced_flutter/domain/repository/repository.dart';
import 'package:complete_advanced_flutter/presentation/resources/font_manager.dart';
import 'package:dartz/dartz.dart';
import 'package:complete_advanced_flutter/data/mapper/mapper.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, MemeObject>> getMeme() async {
    bool isConnectInt = await _networkInfo.isConnected;

    print("XX:" + isConnectInt.toString());
    if (isConnectInt) {
      try {
        final response = await _remoteDataSource.getHome();

        if (response.success == true) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(response.status ?? ResponseCode.DEFAULT,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        print(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      print("XX:" + "ELSE");
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
