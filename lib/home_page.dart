import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

enum Fruit {
  apple, banana
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final dogs = [
    "https://statig2.akamaized.net/bancodeimagens/bm/s7/6b/bms76blg2zaea6p7625cszwjp.jpg",
    "https://www.petlove.com.br/images/breeds/193103/profile/original/pastor_alemao-p.jpg?1532539270",
    "https://t1.ea.ltmcdn.com/pt/images/9/4/4/img_nomes_para_cachorros_pastor_alemao_21449_600.jpg",
    "https://www.estimacao.com.br/wp-content/uploads/2011/12/pastor-alem%C3%A3o.jpg",
    "https://www.clubeparacachorros.com.br/wp-content/uploads/2014/08/pastor-alemao-sentado.jpg",
  ];

  // Índice do indicator
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView + DotsIndicator"),
      ),
      body: Container(
        height: 300,
        child: Stack(
          children: <Widget>[
            _pageView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: dots_indicator(context),
            ),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return PageView.builder(
      itemCount: dogs.length,
      itemBuilder: (context, idx) {
        String urlFoto = dogs[idx];
        print(urlFoto);
        return Image.network(
          urlFoto,
          fit: BoxFit.cover,
        );
      },
      onPageChanged: (idx) => onPageChanged(idx),
    );
  }

  dots_indicator(context) {
    return DotsIndicator(
      dotsCount: dogs.length,
      position: _currentIndex,
      decorator: DotsDecorator(
        color: Colors.white,
        activeColor: Colors.red,
        size: Size.square(12),
        activeSize: Size.square(14),
      ),
    );
  }

  onPageChanged(int value) {
    setState(() {
      this._currentIndex = value;
    });
  }
}
