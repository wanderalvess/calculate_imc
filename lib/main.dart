import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Indíce de Massa Corporal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final alturaController = MaskedTextController(mask: '0.00');
  final pesoController = MaskedTextController(mask: '000.0');

  double _imc;
  double _lastIMC;

  void _calculateIMC() {
    setState(() {
      double altura = double.parse(alturaController.text);
      double peso = double.parse(pesoController.text);
      _imc = peso / (altura * altura);
    });
  }

  void _registerIMC() {
    setState(() {
      _lastIMC = _imc;
    });
  }

  void _clearIMC() {
    setState(() {
      _lastIMC = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Informe sua altura e peso:',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateIMC,
              child: Text('Calcular Indíce de Massa Corporal'),
            ),
            SizedBox(height: 16.0),
            _imc != null
                ? Column(
              children: [
                Text(
                  'Seu IMC é ${_imc.toStringAsFixed(2)}',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  _getIMCMessage(_imc),
                  textAlign: TextAlign.center,
                ),
              ],
            ) : const Text(
              'Informe sua altura e seu peso, para que possamos calcular seu Indíce de massa corporal.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _getIMCMessage(double imc) {
    if (imc < 18.5) {
      return 'Você está abaixo do peso ideal';
    } else if (imc < 25.0) {
      return 'Seu peso está dentro da faixa saudável';
    } else if (imc < 30.0) {
      return 'Você está acima do peso ideal';
    } else if (imc < 35.0) {
      return 'Você está na faixa de Obesidade Leve (Grau I)';
    }else if (imc < 40.0) {
      return 'Você está na faixa de Obesidade Severa (Grau II)';
    }else if (imc > 40.0) {
      return 'Você está na faixa de Obesidade Mórbida (Grau III)';
    }
  }
}
