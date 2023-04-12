// respuesta de la peticion

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    /// aqui tenemos que hacer la peticion al servidor, lo podemos hacer todo
    /// con codigo de dart pero seria algo tedioso, en su lugar usaremos un
    /// paquete que nos proporsiona flutter para simplificar dicha tarea.
    /// los dos paquetes mas populares son http y dio, en este caso usaremos dio
    /// por ser un poco mas ligera que http
    /// https://pub.dev/packages/dio

    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
