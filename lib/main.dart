import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(Vidente());

class Vidente extends StatelessWidget {
  const Vidente({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.redAccent,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[800],
          title: Text('vidente virtual'),
          centerTitle: true,
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _textoGerado = 'Toque na bola de cristal para ler sua sorte.';
  List<String> _textos = [
    'A persistência é o caminho do êxito.',
    'Toda ação humana, quer se torne positiva ou negativa, precisa depender de motivação.',
    'No meio da dificuldade encontra-se a oportunidade.',
    'Eu faço da dificuldade a minha motivação. A volta por cima vem na continuação.',
    'Pedras no caminho? Eu guardo todas. Um dia vou construir um castelo.',
    'É parte da cura o desejo de ser curado.',
    'Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado.',
    'O que me preocupa não é o grito dos maus. É o silêncio dos bons.'
  ];
  var _imgVidente = 'vidente.png';
  var rng = new Random();

  void geraSorte() {
    setState(() {
      _imgVidente = 'videntex.png';
      _textoGerado = 'Lendo sua sorte, aguarde...';

      Future.delayed(Duration(seconds: 3), () => mostraSorte());
    });
  }

  void mostraSorte() {
    setState(() {
      _imgVidente = 'vidente.png';
      _textoGerado = _textos[rng.nextInt(_textos.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff332b25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                child: InkWell(
                  onTap: () {
                    geraSorte();
                    
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image.asset('imagens/$_imgVidente'),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 25, 50, 10),
                  child: Text(
                    '$_textoGerado',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ], //children Stack
          ),
        ],
      ),
    );
  }
}
