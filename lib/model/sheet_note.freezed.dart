// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sheet_note.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SheetNote {

 ToneType get name; int get octave; ProjectDuration get duration; bool get dotted;
/// Create a copy of SheetNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SheetNoteCopyWith<SheetNote> get copyWith => _$SheetNoteCopyWithImpl<SheetNote>(this as SheetNote, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SheetNote&&(identical(other.name, name) || other.name == name)&&(identical(other.octave, octave) || other.octave == octave)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.dotted, dotted) || other.dotted == dotted));
}


@override
int get hashCode => Object.hash(runtimeType,name,octave,duration,dotted);

@override
String toString() {
  return 'SheetNote(name: $name, octave: $octave, duration: $duration, dotted: $dotted)';
}


}

/// @nodoc
abstract mixin class $SheetNoteCopyWith<$Res>  {
  factory $SheetNoteCopyWith(SheetNote value, $Res Function(SheetNote) _then) = _$SheetNoteCopyWithImpl;
@useResult
$Res call({
 ToneType name, int octave, ProjectDuration duration, bool dotted
});




}
/// @nodoc
class _$SheetNoteCopyWithImpl<$Res>
    implements $SheetNoteCopyWith<$Res> {
  _$SheetNoteCopyWithImpl(this._self, this._then);

  final SheetNote _self;
  final $Res Function(SheetNote) _then;

/// Create a copy of SheetNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? octave = null,Object? duration = null,Object? dotted = null,}) {
  return _then(SheetNote(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as ToneType,octave: null == octave ? _self.octave : octave // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as ProjectDuration,dotted: null == dotted ? _self.dotted : dotted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SheetNote].
extension SheetNotePatterns on SheetNote {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
