import 'dart:async';

import 'package:calculator_imc/src/constants/styles.dart';
import 'package:calculator_imc/src/dto/imc_dto.dart';
import 'package:calculator_imc/src/dto/response_request_dto.dart';
import 'package:calculator_imc/src/enums/button_enum.dart';
import 'package:calculator_imc/src/mixins/validations.dart';
import 'package:calculator_imc/src/services/imc_service.dart';
import 'package:calculator_imc/src/utils/calculate_utils.dart';
import 'package:calculator_imc/src/widgets/block_button.dart';
import 'package:flutter/material.dart';

class CalculateImcScreen extends StatefulWidget {
  const CalculateImcScreen({this.imc, Key? key}) : super(key: key);

  final ImcDto? imc;

  @override
  State<StatefulWidget> createState() {
    return _CalculateImcScreen();
  }
}

class _CalculateImcScreen extends State<CalculateImcScreen> with InputMixin {
  final formKey = GlobalKey<FormState>();
  final inputHeightController = TextEditingController();
  final inputWeightController = TextEditingController();
  final inputNameUserController = TextEditingController();

  ImcService imcService = ImcService();

  late ResponseSuccessRequest response;

  late ImcDto? imcDto;
  String imc = '0';
  late String titleScreen;

  @override
  void initState() {
    super.initState();
    imcDto = widget.imc;
    buildValuesInput();
  }

  @override
  void dispose() {
    inputHeightController.dispose();
    inputWeightController.dispose();
    super.dispose();
  }

  void handleImc(String valueImc) async {
    setState(() {
      imc = valueImc;
    });

    ImcDto insertImc = ImcDto(
        imc: imc,
        weight: double.parse(inputWeightController.text),
        height: double.parse(inputHeightController.text),
        name: inputNameUserController.text);

    if (imcDto == null) {
      await imcService.insertValuesImc(insertImc);
    } else {
      insertImc.id = imcDto!.id;

      await imcService.updateImc(insertImc);
    }
  }

  void buildValuesInput() {
    bool imcIsNotNull = imcDto != null;

    if (imcIsNotNull) {
      inputHeightController.text = imcDto!.height.toString();
      inputWeightController.text = imcDto!.weight.toString();
      inputNameUserController.text = imcDto!.name;
    }

    titleScreen = imcIsNotNull ? 'Edição' : 'Criação';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular seu IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: paddingForm,
                  child: TextFormField(
                      controller: inputNameUserController,
                      validator: (value) => isNotEmpty(
                          value, "Informe um valor para o campo de nome"),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite seu nome',
                      )),
                ),
                Padding(
                  padding: paddingForm,
                  child: TextFormField(
                      controller: inputWeightController,
                      keyboardType: TextInputType.number,
                      validator: (value) => isNotEmpty(
                          value, "Informe um valor para o campo de peso"),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite seu peso',
                      )),
                ),
                Padding(
                  padding: paddingForm,
                  child: TextFormField(
                      controller: inputHeightController,
                      keyboardType: TextInputType.number,
                      validator: (value) => isNotEmpty(
                          value, "Informe um valor para o campo de altura"),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Digite sua altura',
                      )),
                ),
                Padding(
                  padding: paddingForm,
                  child: Container(
                    color: Colors.green,
                    height: 32.0,

                    child: Row(
                      children: [
                        Column(
                          children: [Text('O resultado do seu IMC: $imc')],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: paddingForm,
                  child: BlockButton(
                      label: 'Calcular ($titleScreen)',
                      typeButton: TypeButton.buttonDefault,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String resultImc = CalculateUtils.calculateImc(
                              double.parse(inputHeightController.text),
                              double.parse(inputWeightController.text));

                          handleImc(resultImc);
                        }
                      }),
                )
              ],
            )),
      ),
    );
  }
}
