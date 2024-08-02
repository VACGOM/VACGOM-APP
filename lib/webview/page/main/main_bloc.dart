import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vacgom_app/webview/page/main/mainModel.dart';

import '../../../api/api.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final RestClient _restClient;

  MainBloc(
    this._restClient,
  ) : super(MainState(mainModel: null)) {
    on<MainStarted>((event, emit) async {
      final main = await _restClient.getMain();

      emit(MainState(
          mainModel: MainModel(
        required: main.data.inoculationResponse.requiredInoculationCnt,
        inoculated: main.data.inoculationResponse.inoculatedCnt,
        vaccinationId: main.data.requiredVaccinationResponse.vaccinationId,
        diseaseName: main.data.requiredVaccinationResponse.diseaseName,
        vaccineName: main.data.requiredVaccinationResponse.vaccineName,
        icon: main.data.requiredVaccinationResponse.icon,
        score: main.data.vacgomScore,
      )));
    });
  }
}
