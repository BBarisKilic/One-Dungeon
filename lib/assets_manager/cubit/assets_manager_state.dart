part of 'assets_manager_cubit.dart';

/// {@template assets_manager_state}
/// The state of the [AssetsManagerCubit].
/// {@endtemplate}
class AssetsManagerState extends Equatable {
  /// {@macro assets_manager_state}
  const AssetsManagerState({
    required this.assetsCount,
    required this.loaded,
  });

  /// The initial state of the [AssetsManagerCubit].
  const AssetsManagerState.initial() : this(assetsCount: 0, loaded: 0);

  /// The total number of assets to load.
  final int assetsCount;

  /// The number of assets that have been loaded.
  final int loaded;

  /// The progress of the asset loading, from 0 to 1.
  double get progress => loaded == 0 ? 0 : loaded / assetsCount;

  /// Whether the assets are still loading.
  bool get isLoading => progress != 1;

  /// Returns a copy of the current state with the given values updated.
  AssetsManagerState copyWith({
    int? assetsCount,
    int? loaded,
  }) {
    return AssetsManagerState(
      assetsCount: assetsCount ?? this.assetsCount,
      loaded: loaded ?? this.loaded,
    );
  }

  @override
  List<Object?> get props => [assetsCount, loaded];
}
