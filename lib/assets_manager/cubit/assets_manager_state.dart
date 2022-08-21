part of 'assets_manager_cubit.dart';

class AssetsManagerState extends Equatable {
  const AssetsManagerState({
    required this.assetsCount,
    required this.loaded,
  });

  const AssetsManagerState.initial() : this(assetsCount: 0, loaded: 0);

  final int assetsCount;
  final int loaded;

  double get progress => loaded == 0 ? 0 : loaded / assetsCount;
  bool get isLoading => progress != 1;

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
