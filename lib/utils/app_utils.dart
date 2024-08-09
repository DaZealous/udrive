import 'dart:math' as math;
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:udrive/core/constants/image_constant.dart';
import 'package:udrive/utils/app_colors.dart';
import 'package:udrive/widgets/custom_image_view.dart';

Future<void> showSendingData(context, {text}) async {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 0,
          contentPadding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: Card(
            color: Colors.transparent,
            elevation: 0,
            child: Wrap(
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                        padding: EdgeInsets.only(
                          bottom: 15.0,
                        ),
                        child: Center(child: SpinKitPumpingHeart())),
                    Text(text ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: AppColors.accent, fontSize: 14))
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

class SpinKitPumpingHeart extends StatefulWidget {
  const SpinKitPumpingHeart({
    super.key,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  });

  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  _SpinKitPumpingHeartState createState() => _SpinKitPumpingHeartState();
}

class _SpinKitPumpingHeartState extends State<SpinKitPumpingHeart>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..repeat();
    _animation = Tween(begin: 1.0, end: 1.25).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 1.0, curve: SpinKitPumpCurve())));
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller?.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: _animation!, child: _itemBuilder(0));
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 8,
            left: 5,
            right: 10,
          ),
          child: CustomImageView(
            imagePath: ImageConstant.appLogo,
            height: 30,
            width: 30,
          ),
        );
}

class SpinKitPumpCurve extends Curve {
  const SpinKitPumpCurve();

  static const magicNumber = 4.54545454;

  @override
  double transform(double t) {
    if (t >= 0.0 && t < 0.22) {
      return math.pow(t, 1.0) * magicNumber;
    } else if (t >= 0.22 && t < 0.44) {
      return 1.0 - (math.pow(t - 0.22, 1.0) * magicNumber);
    } else if (t >= 0.44 && t < 0.5) {
      return 0.0;
    } else if (t >= 0.5 && t < 0.72) {
      return math.pow(t - 0.5, 1.0) * (magicNumber / 2);
    } else if (t >= 0.72 && t < 0.94) {
      return 0.5 - (math.pow(t - 0.72, 1.0) * (magicNumber / 2));
    }
    return 0.0;
  }
}

Future<void> showPopupDialogs(BuildContext context,
    {String? message,
    bool isSuccess = false,
    String? title,
    Color color = const Color(0xFF303030)}) async {
  await Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    flushbarStyle: FlushbarStyle.GROUNDED,
    title: title ?? (isSuccess ? 'Success' : 'Oops 🙊!'),
    message: message ??
        (isSuccess ? 'Request successful ✨' : "Oops 🙊! We've hit a snag."),
    backgroundColor: isSuccess ? Colors.green : color,
    duration: const Duration(seconds: 3),
  ).show(context);
}
