// lib/features/favorites/logic/favorites_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'doctor_model.dart';

// --- Events ---
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

// --- States ---
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

// --- BLoC ---
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final List<Doctor> _favorites = [];

  FavoritesBloc() : super(FavoritesInitial()) {
    on<AddFavorite>((event, emit) {
      final doctor = event.doctor;
      final alreadyExists = _favorites.any((item) => item.name == doctor.name);

      if (alreadyExists) {
        Fluttertoast.showToast(msg: 'Already added to favorites ❤️');
      } else {
        _favorites.add(doctor);
        Fluttertoast.showToast(msg: 'Added to favorites ❤️');
      }

      emit(FavoritesUpdated(List.from(_favorites)));
    });

    on<RemoveFavorite>((event, emit) {
      _favorites.removeWhere((item) => item.name == event.doctor.name);
      Fluttertoast.showToast(msg: 'Removed from favorites 💔');
      emit(FavoritesUpdated(List.from(_favorites)));
    });
  }
}
