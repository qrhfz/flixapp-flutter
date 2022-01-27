abstract class UseCase<T, Y extends Params> {
  T execute(Y params);
}

abstract class Params {}

class NoParams extends Params {}
