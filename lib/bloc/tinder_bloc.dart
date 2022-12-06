import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:screen/bloc/tinder_event.dart';
import 'package:screen/bloc/tinder_state.dart';

import '../repo/tinder_repo.dart';

class TinderBloc extends Bloc<TinderEvent, TinderState> {
  final RepositoryTinder _repository;

  TinderBloc(this._repository) : super(TinderLoadingState()) {
    on<TinderLoadEvent>((event, emit) async {
      emit(TinderLoadingState());
      try {
        final user = await _repository.getLiveTenderDetailsData();
        emit(TinderLoadedState(user));
      } catch (e) {
        emit(TinderErrorState(e.toString()));
      }
    });
  }
}
