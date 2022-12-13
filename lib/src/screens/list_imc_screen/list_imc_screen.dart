import 'package:calculator_imc/src/constants/styles.dart';
import 'package:calculator_imc/src/dto/imc_dto.dart';
import 'package:calculator_imc/src/enums/button_enum.dart';
import 'package:calculator_imc/src/screens/calculate_imc_screen/calculate_imc_screen.dart';
import 'package:calculator_imc/src/services/imc_service.dart';
import 'package:calculator_imc/src/widgets/block_button.dart';
import 'package:flutter/material.dart';

class ListImcScreen extends StatefulWidget {
  const ListImcScreen({Key? key}) : super(key: key);

  @override
  State<ListImcScreen> createState() {
    return _ListImcScreen();
  }
}

class _ListImcScreen extends State<ListImcScreen> {
  ImcService imcService = ImcService();

  @override
  void initState() {
    super.initState();
  }

  void pushToCalculateImcScreen(ImcDto? imcValue) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CalculateImcScreen(imc: imcValue);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
        ),
        persistentFooterButtons: [
          Container(
            padding: const EdgeInsets.all(8),
            child: BlockButton(
              label: "Calcular novo IMC",
              typeButton: TypeButton.buttonIcon,
              icon: Icons.add,
              onPressed: () {
                pushToCalculateImcScreen(null);
              },
            ),
          )
        ],
        body: StreamBuilder(
          stream: imcService.getValuesImc(),
          builder:
              (BuildContext context, AsyncSnapshot<List<ImcDto>> snapshot) {
            if (snapshot.hasError) {
              return const Text(
                  'Não foi possível obter as informações cadastradas');
            }

            if (snapshot.hasData) {
              final allImcs = snapshot.data!;
              return buildListView(allImcs);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }

  Widget buildListView(List<ImcDto> allImcs) {
    return allImcs.isNotEmpty
        ? ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: allImcs.length,
            itemBuilder: (context, index) => buildImc(context, allImcs[index]),
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          )
        : const Center(
            child: Text(
                'Nenhum registro cadastrado, clique em adicionar para calcular e registrar um IMC'));
  }

  Widget buildImc(BuildContext context, ImcDto imc) {
    return Card(
      color: Colors.white,
      elevation: 2.0,
      child: Column(
        children: [
          ListTile(
              contentPadding: const EdgeInsets.all(8),
              title: Text(imc.name),
              subtitle: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Altura: ${imc.height}'),
                        Text('Peso: ${imc.weight}'),
                        Text('Resultado IMC: ${double.parse(imc.imc).toInt()}')
                      ],
                    ),
                  )
                ],
              ),
              trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.close_rounded,
                        size: 20.0,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        imcService.deleteImc(imc);
                      },
                    ),
                  ]),
              onTap: () {
                pushToCalculateImcScreen(imc);
              })
        ],
      ),
    );
  }
}
