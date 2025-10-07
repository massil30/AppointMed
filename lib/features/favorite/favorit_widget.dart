import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsivity/components/appbar.dart';
import 'package:responsivity/components/searchfield.dart';
import 'package:responsivity/features/doctors/doctor_component.dart';
import 'package:responsivity/features/favorite/bloc/favorit_state.dart';
import 'package:responsivity/features/favorite/bloc/favorite_bloc.dart';
import 'package:responsivity/features/favorite/doctor_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  // Using the imported doctors list from doctor_data.dart

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        if (state is FavoritesInitial) {
          return Center(child: Text('The is no Favorites Items'));
        } else if (state is FavoritesUpdated) {
          final List<Doctor> favorites = state.favorites;

          return favorite_items(favorites);
        }
        return Text('Error');
      },
    );
  }

  Scaffold favorite_items(List<Doctor> favorites) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Favorites"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            const SearchField(hintText: "Search for a doctor"),
            SizedBox(height: 16.h),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 900) {
                    // If screen width > 900, show GridView
                    return GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio:
                            3, // adjust ratio for card width/height
                      ),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final doctor = favorites[index];
                        return Doctor_main_card(
                          name: doctor.name,
                          specialty: doctor.specialty,
                          imageUrl: doctor.image,
                        );
                      },
                    );
                  } else {
                    // If screen width ≤ 900, show ListView
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: favorites.length,
                      itemBuilder: (context, index) {
                        final doctor = favorites[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 18.h),
                          child: Doctor_main_card(
                            name: doctor.name,
                            specialty: doctor.specialty,
                            imageUrl: doctor.image,
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
