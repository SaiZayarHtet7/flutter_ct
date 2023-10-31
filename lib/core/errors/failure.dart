import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class StatusFail extends Failure {}


class LogicError extends Failure {
  final dynamic e;

  const LogicError(this.e);
}
