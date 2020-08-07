import 'package:flutter/material.dart';

class SlideUpPanel extends StatefulWidget {
  final Widget body;
  final Widget panel;
  final Widget panelChild;
  final Duration duration;

  SlideUpPanel({this.body, this.panel, this.duration, this.panelChild});

  @override
  _SlideUpPanelState createState() => _SlideUpPanelState();
}

class _SlideUpPanelState extends State<SlideUpPanel> {
  double offset = 0;

  double maxOffset;
  double minOffset;
  bool isOpne = false;

  final double limit = -400;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      maxOffset = MediaQuery.of(context).size.height * 0.65;
      minOffset = MediaQuery.of(context).size.height - 150;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        widget.body,
        AnimatedPositioned(
          top: size.height - 185 + offset,
          child: GestureDetector(
            onVerticalDragEnd: (details) {
              setState(() {
                if (details.primaryVelocity < 0) {
                  offset = limit;
                  isOpne = true;
                }
                if (details.primaryVelocity > 0) {
                  offset = 1;
                  isOpne = false;
                }
              });
            },
            onVerticalDragUpdate: (details) {
              setState(() {
                if (details.primaryDelta < -2.5 && offset > limit) {
                  offset += details.primaryDelta * 1.3;
                }
                if (details.primaryDelta > 2.5 && offset < 0) {
                  offset += details.primaryDelta * 1.3;
                }
                if (offset < -150) {
                  isOpne = true;
                } else {
                  isOpne = false;
                }
              });
            },
            child: (!isOpne)
                ? Container(
                    height: 300,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -4),
                          blurRadius: 15,
                          color: Colors.black.withOpacity(0.08),
                        ),
                      ],
                    ),
                    child: widget.panel,
                  )
                : Container(
                    height: size.height * 0.7,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, -4),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.18),
                        ),
                      ],
                    ),
                    child: widget.panelChild,
                  ),
          ),
          duration: widget.duration,
        ),
      ],
    );
  }
}
