import 'package:equatable/equatable.dart';

import 'package:responsivity/features/favorite/doctor_model.dart';

abstract class FavoritesEvent extends Equatable {
  // Initial List
  @override
  List<Object?> get props => [];
}

// 2 Event Add & Remove
class AddFavorite extends FavoritesEvent {
  final Doctor doctor;
  AddFavorite(this.doctor);

  @override
  List<Object?> get props => [doctor];
}

class RemoveFavorite extends FavoritesEvent {
  final Doctor doctor;
  RemoveFavorite(this.doctor);

  @override
  List<Object?> get props => [doctor];
}
