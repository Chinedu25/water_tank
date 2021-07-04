import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomClipTest extends AnimatedWidget {
  final Animation<double> anim;





  CustomClipTest(this.anim):super(listenable: anim);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Custom"),
        toolbarHeight: 50,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(anim.value.toString()),
          Center(
            child: Stack(
              children: [ClipPath(
                clipper: BackgroundClip(),
                child: Container(
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: -100,
                        //left: anim.value/2,

                        child: ClipPath(
                          clipper:SineWaveTest(-anim.value/2),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Color(0xff8E93FF),

                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -100,
                        // right: anim.value,

                        child: ClipPath(
                          clipper: SineWaveTest(anim.value),
                          child: Container(
                            child: Stack(
                              children: [
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 1),
                                  bottom: 10 * (anim.value*10),
                                  left: 120,
                                  //bubble
                                  child: ClipPath(
                                    clipper: Ecllipse(),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.05,
                                      height: MediaQuery.of(context).size.height * 0.029,
                                      color: Color(0xff8E93FF),
                                    ),

                                  ),

                                  // child: Container(
                                  //   //margin: EdgeInsets.all(MediaQuery.of(context).size.width/2 - 40),
                                  //   decoration: BoxDecoration(
                                  //     color:Color(0xff8E93FF),
                                  //     shape: BoxShape.circle,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            color: Color(0xff686EF5),
                          ),
                        ),
                      ),


                      Center(child: Text("30%", style: TextStyle(color: Colors.white,fontSize: 60),
                      )
                      ),


                    ],
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [ Color(0xffE1ECE9), Color(0xffF3F8F7) ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,

                    )
                  ),

                ),
              ),


              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// class WaveClipper extends CustomClipper<Path> {
//   final double animation;
//
//   List<Offset> waveList1 = [];
//
//   WaveClipper(this.animation, this.waveList1);
//
//   @override
//   Path getClip(Size size) {
//     Path path = new Path();
//
//     path.addPolygon(waveList1, false);
//
//     path.lineTo(size.width, size.height);
//     path.lineTo(0.0, size.height);
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(WaveClipper oldClipper) =>
//       animation != oldClipper.animation;
// }

class Ecllipse extends CustomClipper<Path> {


  @override
  Path getClip(Size size) {
    Path path = new Path();

    path.lineTo(size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.78, size.width * 0.78, size.height, size.width / 2, size.height);
    path.cubicTo(size.width * 0.22, size.height, 0, size.height * 0.78, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.22, size.width * 0.22, 0, size.width / 2, 0);
    path.cubicTo(size.width * 0.78, 0, size.width, size.height * 0.22, size.width, size.height / 2);
    //path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

// class ComplexCurve extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//
//     // path.lineTo(0, 0);
//     // path.lineTo(0, size.height);
//     //
//     // // Offset firstControlPoint = new Offset(size.width / 4, size.height /3);
//     // // Offset firstEndPoint = new Offset(size.width / 2, size.height / 4.25);
//     // // Offset secondControlPoint = new Offset(size.width - (size.width / 4), size.height / 4 - 65);
//     // // Offset secondEndPoint = new Offset(size.width, size.height / 3 - 40);
//     // //
//     // // path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
//     // //     firstEndPoint.dx, firstEndPoint.dy);
//     // // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
//     // //     secondEndPoint.dx, secondEndPoint.dy);
//     // path.lineTo(size.width,size.height);
//     path.lineTo(size.width * 0.13, size.height * 0.03);
//     path.cubicTo(size.width * 0.08, 0, size.width * 0.03, 0, 0, size.height * 0.03);
//     path.cubicTo(0, size.height * 0.03, 0, size.height * 0.97, 0, size.height * 0.97);
//     path.cubicTo(0, size.height * 0.97, size.width, size.height, size.width, size.height);
//     path.cubicTo(size.width, size.height, size.width, size.height * 0.03, size.width, size.height * 0.03);
//     path.cubicTo(size.width * 0.97, 0, size.width * 0.92, 0, size.width * 0.87, size.height * 0.03);
//     path.cubicTo(size.width * 0.82, size.height * 0.05, size.width * 0.77, size.height * 0.06, size.width * 0.75, size.height * 0.03);
//     path.cubicTo(size.width * 0.72, 0, size.width * 0.67, 0, size.width * 0.62, size.height * 0.03);
//     path.cubicTo(size.width * 0.57, size.height * 0.05, size.width * 0.55, 0, size.width / 2, 0);
//     path.cubicTo(size.width * 0.46, 0, size.width * 0.43, size.height * 0.05, size.width * 0.38, size.height * 0.03);
//     path.cubicTo(size.width / 3, 0, size.width * 0.28, 0, size.width / 4, size.height * 0.03);
//     path.cubicTo(size.width * 0.23, size.height * 0.06, size.width * 0.18, size.height * 0.05, size.width * 0.13, size.height * 0.03);
//     path.cubicTo(size.width * 0.13, size.height * 0.03, size.width * 0.13, size.height * 0.03, size.width * 0.13, size.height * 0.03);
//
//
//
//     path.close();
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     return true;
//   }
//
// }

class BackgroundClip extends CustomClipper <Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.04, size.height * 0.79);
    path.cubicTo(-0.02, size.height * 0.65, size.width * 0.01, size.height / 5, size.width * 0.04, 0);
    path.cubicTo(size.width * 0.04, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.79, size.width, size.height * 0.79);
    path.cubicTo(size.width, size.height * 0.82, size.width * 0.94, size.height * 0.91, size.width * 0.88, size.height * 0.95);
    path.cubicTo(size.width * 0.82, size.height, size.width * 0.77, size.height, size.width * 0.76, size.height);
    path.cubicTo(size.width * 0.76, size.height, size.width * 0.32, size.height, size.width * 0.32, size.height);
    path.cubicTo(size.width * 0.26, size.height, size.width * 0.11, size.height * 0.92, size.width * 0.04, size.height * 0.79);
    path.cubicTo(size.width * 0.04, size.height * 0.79, size.width * 0.04, size.height * 0.79, size.width * 0.04, size.height * 0.79);
    path.cubicTo(size.width * 0.04, 0, size.width, 0, size.width, 0);
    path.cubicTo(size.width, 0, size.width, size.height * 0.79, size.width, size.height * 0.79);
    path.cubicTo(size.width, size.height * 0.82, size.width * 0.94, size.height * 0.91, size.width * 0.88, size.height * 0.95);
    path.cubicTo(size.width * 0.82, size.height, size.width * 0.77, size.height, size.width * 0.76, size.height);
    path.cubicTo(size.width * 0.76, size.height, size.width * 0.32, size.height, size.width * 0.32, size.height);
    path.cubicTo(size.width * 0.26, size.height, size.width * 0.11, size.height * 0.92, size.width * 0.04, size.height * 0.79);
    path.cubicTo(size.width * 0.04, size.height * 0.79, size.width * 0.04, size.height * 0.79, size.width * 0.04, size.height * 0.79);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {

    return true;
  }

}
//
// class WavyClip extends CustomClipper <Path>{
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(size.width * 0.1, 0);
//     path.cubicTo(size.width * 0.05, 0, size.width * 0.01, size.height * 0.07, 0, size.height * 0.11);
//     path.cubicTo(0, size.height * 0.11, 0, size.height * 0.97, 0, size.height * 0.97);
//     path.cubicTo(0, size.height * 0.97, size.width, size.height, size.width, size.height);
//     path.cubicTo(size.width, size.height, size.width, size.height * 0.11, size.width, size.height * 0.11);
//     path.cubicTo(size.width, size.height * 0.23, size.width * 0.89, size.height * 0.18, size.width * 0.84, size.height * 0.14);
//     path.cubicTo(size.width * 0.84, size.height * 0.09, size.width * 0.82, 0, size.width * 0.77, 0);
//     path.cubicTo(size.width * 0.72, 0, size.width * 0.68, size.height * 0.07, size.width * 0.67, size.height * 0.11);
//     path.cubicTo(size.width * 0.65, size.height * 0.23, size.width * 0.55, size.height * 0.18, size.width * 0.51, size.height * 0.14);
//     path.cubicTo(size.width / 2, size.height * 0.09, size.width * 0.48, 0, size.width * 0.43, 0);
//     path.cubicTo(size.width * 0.38, 0, size.width * 0.35, size.height * 0.07, size.width / 3, size.height * 0.11);
//     path.cubicTo(size.width * 0.32, size.height * 0.23, size.width * 0.22, size.height * 0.18, size.width * 0.17, size.height * 0.14);
//     path.cubicTo(size.width * 0.17, size.height * 0.09, size.width * 0.15, 0, size.width * 0.1, 0);
//     path.cubicTo(size.width * 0.1, 0, size.width * 0.1, 0, size.width * 0.1, 0);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//
//     return true;
//   }
//
// }

class SineWaveTest extends CustomClipper <Path>{
  double value = 1;
  double amplitude = 2;

  List<Offset> waveList = [];

  SineWaveTest(this.value);
  @override
  Path getClip(Size size) {

    Path path = new Path();
    waveList.clear();



    // List<Offset> waveList1 = [];
    //
    //y(t) = A\sin(2pi f t + O)
    for (int i = 0; i <= size.width; i++) {
      waveList.add(new Offset(i.toDouble(),
          // sin((value/6 * 360 - i) % 360 * (pi / 180.0)) * 10 + 50 )) ;
     // print((value * 360 - i) % 360 );
          //sin(value * 10 * (2 *pi) + i * (0.01 * 2)) * 10 + 50
          //sin(value * 100 - (2 *pi) * (i*0.001 * 3)) * 10 + 50
         sin( amplitude* 0.01 * i - value * 15 *(2 *pi)) * 15 + size.height * 0.4
      )) ;
    }


    path.addPolygon(waveList, false);

    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    // TODO: implement getClip

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}

// class CustomWavyClip extends CustomClipper <Path>{
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, 40);
//     path.lineTo(0, size.height);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width, 510);
//     for (int i =0; i < 200; i++){
//       if (i % 2 == 0) {
//         path.quadraticBezierTo(size.width - (size.width/16) - (i * size.width/8),
//             510,
//             size.width - ((i + 1) * size.width/8 ),
//         size.height - 160);
//       }
//
//       else{
//         path.quadraticBezierTo(size.width - (size.width/16) - (i * size.width/8),
//             size.height - 150,
//             size.width - ((i + 1) * size.width/8 ),
//             size.height - 160);
//       }
//
//     }
//
//     path.lineTo(0.0, 40);
//     path.close();
//
//     return path;
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//
//     return true;
//   }
//
// }


class WaveAnimation extends StatefulWidget {


  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation> with
  SingleTickerProviderStateMixin{

  Animation<double> anim;
  Animation<double> anim2;
  AnimationController animCtrl;
  List<Offset> waveList;

  @override
  void initState() {

    super.initState();
    animCtrl = AnimationController(
        duration: Duration(seconds: 360),
        vsync: this)..repeat();

    anim = Tween<double>(begin: 0, end: 2*pi).animate(animCtrl);




    // anim = Tween<double>(begin: 0, end: 1).animate(animCtrl)..addStatusListener((status) {
    //   if (status == AnimationStatus.completed){
    //     animCtrl.reverse();
    //   }
    //   if (status == AnimationStatus.dismissed){
    //     animCtrl.forward();
    //   }
    // });

    // animCtrl.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animCtrl.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return CustomClipTest(
      anim
    );
  }
}
