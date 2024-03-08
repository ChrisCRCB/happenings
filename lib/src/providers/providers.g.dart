// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$databaseHash() => r'ca44b2a7c2cff851be88f672d63dc8066ee16c8f';

/// Provide the database.
///
/// Copied from [database].
@ProviderFor(database)
final databaseProvider = AutoDisposeFutureProvider<HappeningsDatabase>.internal(
  database,
  name: r'databaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$databaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DatabaseRef = AutoDisposeFutureProviderRef<HappeningsDatabase>;
String _$noteSubjectsHash() => r'82136df1b4c9a801b993618187d029f7a09f5719';

/// Return all subjects.
///
/// Copied from [noteSubjects].
@ProviderFor(noteSubjects)
final noteSubjectsProvider =
    AutoDisposeFutureProvider<List<NoteSubject>>.internal(
  noteSubjects,
  name: r'noteSubjectsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$noteSubjectsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NoteSubjectsRef = AutoDisposeFutureProviderRef<List<NoteSubject>>;
String _$subjectNotesHash() => r'035d0111b5d195d135e9eb8817dd3a2089acf858';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provide a list of notes.
///
/// If [subjectId] is `null`, then all notes will be returned.
///
/// Copied from [subjectNotes].
@ProviderFor(subjectNotes)
const subjectNotesProvider = SubjectNotesFamily();

/// Provide a list of notes.
///
/// If [subjectId] is `null`, then all notes will be returned.
///
/// Copied from [subjectNotes].
class SubjectNotesFamily
    extends Family<AsyncValue<(NoteSubject?, List<Note>)>> {
  /// Provide a list of notes.
  ///
  /// If [subjectId] is `null`, then all notes will be returned.
  ///
  /// Copied from [subjectNotes].
  const SubjectNotesFamily();

  /// Provide a list of notes.
  ///
  /// If [subjectId] is `null`, then all notes will be returned.
  ///
  /// Copied from [subjectNotes].
  SubjectNotesProvider call(
    int? subjectId,
  ) {
    return SubjectNotesProvider(
      subjectId,
    );
  }

  @override
  SubjectNotesProvider getProviderOverride(
    covariant SubjectNotesProvider provider,
  ) {
    return call(
      provider.subjectId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'subjectNotesProvider';
}

/// Provide a list of notes.
///
/// If [subjectId] is `null`, then all notes will be returned.
///
/// Copied from [subjectNotes].
class SubjectNotesProvider
    extends AutoDisposeFutureProvider<(NoteSubject?, List<Note>)> {
  /// Provide a list of notes.
  ///
  /// If [subjectId] is `null`, then all notes will be returned.
  ///
  /// Copied from [subjectNotes].
  SubjectNotesProvider(
    int? subjectId,
  ) : this._internal(
          (ref) => subjectNotes(
            ref as SubjectNotesRef,
            subjectId,
          ),
          from: subjectNotesProvider,
          name: r'subjectNotesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$subjectNotesHash,
          dependencies: SubjectNotesFamily._dependencies,
          allTransitiveDependencies:
              SubjectNotesFamily._allTransitiveDependencies,
          subjectId: subjectId,
        );

  SubjectNotesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subjectId,
  }) : super.internal();

  final int? subjectId;

  @override
  Override overrideWith(
    FutureOr<(NoteSubject?, List<Note>)> Function(SubjectNotesRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SubjectNotesProvider._internal(
        (ref) => create(ref as SubjectNotesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subjectId: subjectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(NoteSubject?, List<Note>)> createElement() {
    return _SubjectNotesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SubjectNotesProvider && other.subjectId == subjectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subjectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SubjectNotesRef
    on AutoDisposeFutureProviderRef<(NoteSubject?, List<Note>)> {
  /// The parameter `subjectId` of this provider.
  int? get subjectId;
}

class _SubjectNotesProviderElement
    extends AutoDisposeFutureProviderElement<(NoteSubject?, List<Note>)>
    with SubjectNotesRef {
  _SubjectNotesProviderElement(super.provider);

  @override
  int? get subjectId => (origin as SubjectNotesProvider).subjectId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
