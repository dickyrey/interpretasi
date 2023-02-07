import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/entities/category.dart';
import 'package:interpretasi/src/domain/usecases/category/get_categories.dart';

part 'category_watcher_event.dart';
part 'category_watcher_state.dart';
part 'category_watcher_bloc.freezed.dart';

class CategoryWatcherBloc
    extends Bloc<CategoryWatcherEvent, CategoryWatcherState> {
  CategoryWatcherBloc(this._getCategories)
      : super(CategoryWatcherState.initial()) {
    on<CategoryWatcherEvent>((event, emit) async {
      await event.map(
        fetch: (_) async {
          emit(state.copyWith(state: RequestState.loading));

          final result = await _getCategories.execute();

          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
              ),
            ),
            (data) => emit(
              state.copyWith(
                state: RequestState.loaded,
                categoryList: data,
              ),
            ),
          );
        },
      );
    });
  }

  final GetCategories _getCategories;
}
