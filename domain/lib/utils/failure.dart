import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server Failure']) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure([String message = 'Failed to connect to the network'])
      : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class ArgumentFailure extends Failure {
  const ArgumentFailure(String message) : super(message);
}
