import 'package:equatable/equatable.dart';
import 'package:responsivity/features/favorite/doctor_model.dart';

abstract class FavoritesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesUpdated extends FavoritesState {
  final List<Doctor> favorites;
  FavoritesUpdated(this.favorites);

  @override
  List<Object?> get props => [favorites];
}
