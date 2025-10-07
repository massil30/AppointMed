import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsivity/components/toast.dart';
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
        showToast(
          'Already Exists',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      } else {
        _favorites.add(doctor);
        _favorites.add(doctor);
        showToast(
          'Added to favorites',
          backgroundColor: Colors.green,
          textColor: Colors.white,
        );
      }

      emit(FavoritesUpdated(List.from(_favorites)));
    });

    on<RemoveFavorite>((event, emit) {
      _favorites.removeWhere((item) => item.name == event.doctor.name);
      showToast(
        'Removed from favorites',
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );
      emit(FavoritesUpdated(List.from(_favorites)));
    });
  }
}
