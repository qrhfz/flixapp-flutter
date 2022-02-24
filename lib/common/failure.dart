import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure([String message = 'Server Failure']) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure([String message = 'Failed to connect to the network'])
      : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}

class ArgumentFailure extends Failure {
  ArgumentFailure(String message) : super(message);
}
