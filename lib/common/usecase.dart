abstract class UseCase<T, Y> {
  T execute(covariant Y params);
}

abstract class Params {}

class NoParams extends Params {}
