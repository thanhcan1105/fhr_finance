import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyStep extends StatefulWidget {
  MyStep({
    Key? key,
    required this.listStep,
    this.nextPress,
    this.current,
    this.isEnableSubmit = false,
    this.validatedStep,
  }) : super(key: key);

  final List<Widget> listStep;
  final VoidCallback? nextPress;
  final int? current;
  final bool? isEnableSubmit;
  final List<int>? validatedStep;

  @override
  State<MyStep> createState() => _MyStepState();
}

class _MyStepState extends State<MyStep> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  widget.listStep.length,
                  (int index) => _incator(index: index + 1, lastItem: index == widget.listStep.length - 1 ? true : false),
                )
              ],
            ),
          ),
        ),
        widget.listStep[_currentStep],
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _currentStep > 0
                  ? ElevatedButton(
                      onPressed: () {
                        if (_currentStep > 0) {
                          _currentStep -= 1;
                        }
                        setState(() {});
                      },
                      child: Container(
                        width: 100,
                        alignment: Alignment(0, 0),
                        child: Text('Back'),
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                      ),
                    )
                  : Container(),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: _currentStep < (widget.listStep.length - 1)
                    ? () {
                        _currentStep += 1;
                        setState(() {});
                      }
                    : widget.nextPress,
                child: Container(
                  // color: widget.validatedStep!.contains(_currentStep) ? Colors.blue : Colors.grey,
                  width: _currentStep > 0 ? 100 : 200,
                  alignment: Alignment(0, 0),
                  child: Text(_currentStep == widget.listStep.length - 1 ? 'Submit' : 'Continue'),
                ),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: widget.validatedStep!.contains(_currentStep + 1) ? Colors.blue : Colors.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // ignore: unused_element
  Row _incator({int? index, bool? lastItem}) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          alignment: Alignment(0, 0),
          decoration: BoxDecoration(
            color: _currentStep + 1 < index! ? Colors.grey[400] : Colors.blue,
            shape: BoxShape.circle,
          ),
          child: _currentStep + 1 > index
              ? Icon(
                  Icons.check,
                  color: Colors.white,
                )
              : Text(
                  index.toString(),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
        ),
        lastItem!
            ? Container()
            : Container(
                height: 3,
                width: 50,
                color: _currentStep < index ? Colors.grey[400] : Colors.blue,
              ),
      ],
    );
  }
}
