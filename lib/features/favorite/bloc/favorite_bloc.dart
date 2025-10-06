import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsivity/features/favorite/bloc/favorit_event.dart';
import 'package:responsivity/features/favorite/bloc/favorit_state.dart';
import 'package:responsivity/features/favorite/doctor_model.dart';

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
