import 'dart:async';
import 'dart:developer' as dev;
import 'package:calculator_imc/src/dto/imc_dto.dart';
import 'package:calculator_imc/src/dto/response_request_dto.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImcService {
  final String imc = "imc";

  CollectionReference<Map<String, dynamic>> instanceDatabase =
      FirebaseFirestore.instance.collection("imc");

  Future<ResponseSuccessRequest> insertValuesImc(ImcDto values) async {
    ResponseSuccessRequest request = const ResponseSuccessRequest(
        message: 'Valores inseridos com sucesso.', success: true);

    try {
      final docImc = instanceDatabase.doc();
      values.id = docImc.id;

      final imcInJson = values.toJson();

      await docImc.set(imcInJson);
    } catch (error) {
      dev.log('Error insert imc: $error');
      request = const ResponseSuccessRequest(
          message: 'Erro ao inserir valor no firebase, table imc',
          success: false);
    }

    return request;
  }

  Stream<List<ImcDto>> getValuesImc() {
    return instanceDatabase.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => ImcDto.fromJson(doc.data())).toList());
  }

  Future<ResponseSuccessRequest> updateImc(ImcDto imc) async {
    ResponseSuccessRequest request =
        const ResponseSuccessRequest(success: true, message: 'OK');

    try {
      final docImc = instanceDatabase.doc(imc.id);
      final json = imc.toJson();
      await docImc.update(json);
    } catch (error) {
      dev.log('Error update imc: $error');
      request = const ResponseSuccessRequest(
          message: 'Erro ao atualizar o valor no firebase, table imc',
          success: false);
    }

    return request;
  }

  Future<ResponseSuccessRequest> deleteImc(ImcDto imc) async {
    ResponseSuccessRequest request =
        const ResponseSuccessRequest(success: true, message: 'OK');

    try {
      final imcDoc = instanceDatabase.doc(imc.id);
      await imcDoc.delete();
    } catch (error) {
      dev.log('Erro ao deletar usuario');
      request = const ResponseSuccessRequest(
          message: 'Erro ao deletar o valor no firebase, table imc',
          success: false);
    }

    return request;
  }
}
