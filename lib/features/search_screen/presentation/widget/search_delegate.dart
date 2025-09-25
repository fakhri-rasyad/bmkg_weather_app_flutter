import 'dart:async';

import 'package:bmkg_weather_app_flutter/features/search_screen/presentation/cubit/search_delegate_cubit.dart';
import 'package:bmkg_weather_app_flutter/shared/widgets/snackbar_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMKGSearchDelegate extends SearchDelegate {
  final SearchDelegateCubit cubit;

  Timer? _debounce;

  BMKGSearchDelegate(this.cubit);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.of(context).pop(),
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  void _onQueryChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      cubit.searchLocation(query);
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return BlocBuilder<SearchDelegateCubit, SearchDelegateState>(
      builder: (context, state) {
        if (state is SearchDelegateSuccess) {
          if (state.wilayahEntity.isEmpty) {
            return ListTile(title: Text("Wilayah Tidak Ditemukan"));
          } else {
            return ListView.builder(
              itemCount: state.wilayahEntity.length,
              itemBuilder: (context, index) {
                final wilayah = state.wilayahEntity[index];
                return ListTile(
                  onTap: () => SnackbarHandlerHandler.showSnackbarHandler(
                    wilayah.name,
                    context,
                  ),
                  title: Text(wilayah.name),
                );
              },
            );
          }
        } else if (state is SearchDelegateLoading) {
          return SizedBox();
        } else if (state is SearchDelegateInitial) {
          return ListTile(title: Text("Cari lokasi anda disini"));
        }
        return ListTile(title: Text("Cari lokasi anda disini"));
      },
    );
  }
}
