// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchStateTearOff {
  const _$SearchStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _MovieResult movieResult(List<Movie> result) {
    return _MovieResult(
      result,
    );
  }

  _TVResult tvResult(List<TVShow> result) {
    return _TVResult(
      result,
    );
  }

  _Error error(String message) {
    return _Error(
      message,
    );
  }
}

/// @nodoc
const $SearchState = _$SearchStateTearOff();

/// @nodoc
mixin _$SearchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SearchState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SearchState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'SearchState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements SearchState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$MovieResultCopyWith<$Res> {
  factory _$MovieResultCopyWith(
          _MovieResult value, $Res Function(_MovieResult) then) =
      __$MovieResultCopyWithImpl<$Res>;
  $Res call({List<Movie> result});
}

/// @nodoc
class __$MovieResultCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$MovieResultCopyWith<$Res> {
  __$MovieResultCopyWithImpl(
      _MovieResult _value, $Res Function(_MovieResult) _then)
      : super(_value, (v) => _then(v as _MovieResult));

  @override
  _MovieResult get _value => super._value as _MovieResult;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_MovieResult(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
    ));
  }
}

/// @nodoc

class _$_MovieResult implements _MovieResult {
  const _$_MovieResult(this.result);

  @override
  final List<Movie> result;

  @override
  String toString() {
    return 'SearchState.movieResult(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MovieResult &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$MovieResultCopyWith<_MovieResult> get copyWith =>
      __$MovieResultCopyWithImpl<_MovieResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) {
    return movieResult(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) {
    return movieResult?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (movieResult != null) {
      return movieResult(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) {
    return movieResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) {
    return movieResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (movieResult != null) {
      return movieResult(this);
    }
    return orElse();
  }
}

abstract class _MovieResult implements SearchState {
  const factory _MovieResult(List<Movie> result) = _$_MovieResult;

  List<Movie> get result;
  @JsonKey(ignore: true)
  _$MovieResultCopyWith<_MovieResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$TVResultCopyWith<$Res> {
  factory _$TVResultCopyWith(_TVResult value, $Res Function(_TVResult) then) =
      __$TVResultCopyWithImpl<$Res>;
  $Res call({List<TVShow> result});
}

/// @nodoc
class __$TVResultCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$TVResultCopyWith<$Res> {
  __$TVResultCopyWithImpl(_TVResult _value, $Res Function(_TVResult) _then)
      : super(_value, (v) => _then(v as _TVResult));

  @override
  _TVResult get _value => super._value as _TVResult;

  @override
  $Res call({
    Object? result = freezed,
  }) {
    return _then(_TVResult(
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<TVShow>,
    ));
  }
}

/// @nodoc

class _$_TVResult implements _TVResult {
  const _$_TVResult(this.result);

  @override
  final List<TVShow> result;

  @override
  String toString() {
    return 'SearchState.tvResult(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TVResult &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$TVResultCopyWith<_TVResult> get copyWith =>
      __$TVResultCopyWithImpl<_TVResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) {
    return tvResult(result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) {
    return tvResult?.call(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (tvResult != null) {
      return tvResult(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) {
    return tvResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) {
    return tvResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (tvResult != null) {
      return tvResult(this);
    }
    return orElse();
  }
}

abstract class _TVResult implements SearchState {
  const factory _TVResult(List<TVShow> result) = _$_TVResult;

  List<TVShow> get result;
  @JsonKey(ignore: true)
  _$TVResultCopyWith<_TVResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Error(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SearchState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Movie> result) movieResult,
    required TResult Function(List<TVShow> result) tvResult,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Movie> result)? movieResult,
    TResult Function(List<TVShow> result)? tvResult,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_MovieResult value) movieResult,
    required TResult Function(_TVResult value) tvResult,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_MovieResult value)? movieResult,
    TResult Function(_TVResult value)? tvResult,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements SearchState {
  const factory _Error(String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}
