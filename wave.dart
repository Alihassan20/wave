import 'package:flutter/material.dart';
import 'package:quran_kareem/Color/color.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class WaveDemoHomePage extends StatefulWidget {



  @override
  _WaveDemoHomePageState createState() => _WaveDemoHomePageState();
}

class _WaveDemoHomePageState extends State<WaveDemoHomePage> {
  _buildCard({
    required Config config,
    Color backgroundColor = Colors.transparent,

  })
  {
    return Container(
      child: WaveWidget(
        config: config,
        backgroundColor: backgroundColor,
        size:  Size(MediaQuery.of(context).size.height/1, MediaQuery.of(context).size.height/1),
        waveAmplitude: 0,

      ),
    );
  }

   MaskFilter? _blur;
  final List<MaskFilter> _blurs = [
    const MaskFilter.blur(BlurStyle.normal, 10.0),
    const MaskFilter.blur(BlurStyle.inner, 10.0),
    const MaskFilter.blur(BlurStyle.outer, 10.0),
    const MaskFilter.blur(BlurStyle.solid, 16.0),
  ];
  int _blurIndex = 0;
  MaskFilter _nextBlur() {
    if (_blurIndex == _blurs.length - 1) {
      _blurIndex = 0;
    } else {
      _blurIndex = _blurIndex + 1;
    }
    _blur = _blurs[_blurIndex];
    return _blurs[_blurIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        alignment: Alignment.topCenter,
        child:  _buildCard(
          config: CustomConfig(
            gradients: [
              [const Color.fromRGBO(132, 223, 255, 1),  const Color.fromRGBO(148, 218, 255, 1)],
              [Colors.white, const Color.fromRGBO(148, 179, 253, 1)],
              [Colors.white, const Color.fromRGBO(132, 223, 255, 1)],
              [kContainerColor,  const Color.fromRGBO(214, 229, 250, 1)]
            ],
            durations: [32000, 21000, 18000, 6000],
            heightPercentages: [0.20, 0.23, 0.25, 0.30],
            blur: _blur,
            gradientBegin: Alignment.bottomLeft,
            gradientEnd: Alignment.topRight,
          ),
        ),
      )
    );
  }
}