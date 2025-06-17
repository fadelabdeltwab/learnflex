import 'package:bloc/bloc.dart';

import '../../data/api/content_api.dart';
import '../../data/models/content_model.dart';
import '../states/content_states.dart';

class ContentCubit extends Cubit<ContentState> {
  final ContentService contentService;

  ContentCubit({required this.contentService}) : super(ContentInitial());

  late ContentModel contentModel;

  Future<void> loadContent() async {
    emit(ContentLoading());
    try {
      contentModel = await contentService.getContent();
      emit(ContentLoaded());
    } catch (e) {
      emit(ContentError(e.toString()));
    }
  }
}
