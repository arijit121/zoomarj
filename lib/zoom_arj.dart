import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math_64;

class Zoomarj extends StatefulWidget {
  Zoomarj({Key? key, required this.input_widget, required this.pinchzoom, required this.height, required this.width})
      : super(key: key);
  Widget input_widget;
  int pinchzoom;
  double height;
  double width;

  @override
  State<Zoomarj> createState() => _ZoomarjState();
}

class _ZoomarjState extends State<Zoomarj> with TickerProviderStateMixin{
  TransformationController _transformationController =
      TransformationController();
  Animation<Matrix4> ?_animationReset;
  AnimationController ?_controllerReset;
  int pointer = 0;
  double scale = 0;


  void _onAnimateReset() {
    _transformationController.value = _animationReset!.value;
    if (!_controllerReset!.isAnimating) {
      _animationReset?.removeListener(_onAnimateReset);
      _animationReset = null;
      _controllerReset?.reset();
    }
  }

  void _animateResetInitialize() {
    _controllerReset?.reset();
    _animationReset = Matrix4Tween(
      begin: _transformationController.value,
      end: Matrix4.identity(),
    ).animate(_controllerReset!);
    _animationReset?.addListener(_onAnimateReset);
    _controllerReset?.forward();
  }

// Stop a running reset to home transform animation.
  void _animateResetStop() {
    _controllerReset?.stop();
    _animationReset?.removeListener(_onAnimateReset);
    _animationReset = null;
    _controllerReset?.reset();
  }

  void _onInteractionStart(ScaleStartDetails details) {
    // If the user tries to cause a transformation while the reset animation is
    // running, cancel the reset animation.
    if (_controllerReset?.status == AnimationStatus.forward) {
      _animateResetStop();
    }
  }

  void _onInteractionEnd(ScaleEndDetails details) {
    if(widget.pinchzoom==1){
      _animateResetInitialize();
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerReset = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controllerReset?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: !(kIsWeb)
          ? InteractiveViewer(
              clipBehavior: Clip.hardEdge,
              transformationController: _transformationController,
              boundaryMargin: EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 1.6,
              onInteractionStart: _onInteractionStart,
              onInteractionEnd: _onInteractionEnd,
              child: widget.input_widget)
          : GestureDetector(
              onScaleEnd: (details) {
                print("onScaleEnd::>> " + details.toString());

                if (widget.pinchzoom == 1) {
                  setState(() {
                    pointer = details.pointerCount;
                    scale = 0.0;
                  });
                } else {
                  setState(() {
                    pointer = details.pointerCount;
                    scale = scale;
                  });
                }
              },
              onScaleStart: (details) {
                setState(() {
                  pointer = details.pointerCount;
                  print("onScaleStart::>> " + pointer.toString());
                  scale = scale;
                });
              },
              onScaleUpdate: (details) {
                print("onScaleUpdate::>> " + details.toString());

                setState(() {
                  pointer = details.pointerCount;
                  if (pointer == 2) {
                    scale = details.scale.clamp(1.0, 5.0);
                  }
                });

                // controller.scale.value = details.scale.clamp(1.0, 5.0);
                // controller.scale.value =
                //     controller.previousScale.value * (details.scale * .35);
              },
              child: Transform(
                  alignment: FractionalOffset.center,

                  // transform: vector_math_64.Matrix4.diagonal3(
                  //     vector_math_64.Vector3(controller.scale.value,
                  //         controller.scale.value, controller.scale.value)),

                  transform: vector_math_64.Matrix4.diagonal3(
                      vector_math_64.Vector3(scale.clamp(1.0, 5.0),
                          scale.clamp(1.0, 5.0), scale.clamp(1.0, 5.0))),
                  child: widget.input_widget)),
    );
  }
}
