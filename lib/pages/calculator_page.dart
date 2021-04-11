import 'package:calculator/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Calculadora', style: TextStyle(
          color: Colors.greenAccent
        ),),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.send_outlined),
            onPressed: (){Share.share("Enviar");},
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.greenAccent,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplay(result: _controller.result, resultX: _controller.resultX),
          Divider(color: Colors.green),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 500,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: 'AC', color: Colors.green),
                _buildButton(label: 'DEL', color: Colors.green),
                _buildButton(label: '%', color: Colors.green),
                _buildButton(label: '/', color: Colors.green),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '7'),
                _buildButton(label: '8'),
                _buildButton(label: '9'),
                _buildButton(label: 'x', color: Colors.green),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '4'),
                _buildButton(label: '5'),
                _buildButton(label: '6'),
                _buildButton(label: '+', color: Colors.green),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '1'),
                _buildButton(label: '2'),
                _buildButton(label: '3'),
                _buildButton(label: '-', color: Colors.green),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildButton(label: '0', flex: 2),
                _buildButton(label: ','),
                _buildButton(label: '=', color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildDisplay({String result, String resultX}) {
    return Expanded(
        flex: 1,
        child: Container(
            color: Colors.black,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      resultX,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        decoration: TextDecoration.none,
                        fontSize: 60.0,
                        color: Colors.green,
                         fontFamily: 'Calculator',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      result,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none,
                        fontSize: 80.0,
                        color: Colors.greenAccent,
                        fontFamily: 'Calculator',
                      ),
                    ),
                  ),
                ])));
  }

  _buildButton({String label, int flex = 1, Color color = Colors.greenAccent}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label ?? '',
          style: TextStyle(
            color: color,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            _controller.applyCommand(label);
          });
        },
      ),
    );
  }
}
