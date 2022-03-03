import 'package:flutter/material.dart';

class StepForm extends StatefulWidget {
  static const routeName = '/step_form';

  const StepForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return StepFormState();
  }
}

enum SingingCharacter { lafayette, jefferson }

class StepFormState extends State<StepForm> {
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  SingingCharacter? _character = SingingCharacter.lafayette;

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'ONE';

  // Group Value for Radio Button.
  int id = 1;

  String dropdownValue = 'One';

  List <String> spinnerItems = [
    'One',
    'Two',
    'Three',
    'Four',
    'Five'
  ];

  double _currentSliderValue = 1;

  List<Step> stepList() => [
    Step(
      state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeStepIndex >= 0,
      title: const Text('Account'),
      content: Container(
        child: Column(
          children: [
            TextField(
              controller: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: email,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: pass,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    ),
    Step(
        state:
        _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeStepIndex >= 1,
        title: const Text('Address'),
        content: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: address,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full House Address',
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: pincode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pin Code',
                ),
              ),
              const SizedBox(height: 8,),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Lafayette'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.lafayette,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Thomas Jefferson'),
                    leading: Radio<SingingCharacter>(
                      value: SingingCharacter.jefferson,
                      groupValue: _character,
                      onChanged: (SingingCharacter? value) {
                        setState(() {
                          _character = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text('Selected Radio Item = ' + '$radioButtonItem',
                          style: const TextStyle(fontSize: 21))
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'ONE';
                            id = 1;
                          });
                        },
                      ),
                      const Text(
                        'ONE',
                        style: TextStyle(fontSize: 17.0),
                      ),

                      Radio(
                        value: 2,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'TWO';
                            id = 2;
                          });
                        },
                      ),
                      const Text(
                        'TWO',
                        style: TextStyle(
                          fontSize: 17.0,
                        ),
                      ),

                      Radio(
                        value: 3,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'THREE';
                            id = 3;
                          });
                        },
                      ),
                      const Text(
                        'THREE',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      Radio(
                        value: 4,
                        groupValue: id,
                        onChanged: (val) {
                          setState(() {
                            radioButtonItem = 'FOUR';
                            id = 4;
                          });
                        },
                      ),
                      const Text(
                        'FOUR',
                        style: TextStyle(fontSize: 17.0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Column(children: <Widget>[

                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.red, fontSize: 18),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? data) {
                    setState(() {
                      dropdownValue = data!;
                    });
                  },
                  items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),

                Text('Selected Item = ' + '$dropdownValue',
                    style: const TextStyle
                      (fontSize: 22,
                        color: Colors.black)),
              ]),
              const SizedBox(height: 8,),
              Slider(
                value: _currentSliderValue,
                max: 8,
                divisions: 8,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              )
            ],
          ),
        )),
    Step(
        state: StepState.complete,
        isActive: _activeStepIndex >= 2,
        title: const Text('Confirm'),
        content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Name: ${name.text}'),
                Text('Email: ${email.text}'),
                const Text('Password: *****'),
                Text('Address : ${address.text}'),
                Text('PinCode : ${pincode.text}'),
              ],
            )))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form'),),
      body: Stepper(
        type: StepperType.vertical,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if(_activeStepIndex < (stepList().length -1)) {
            setState(() {
              _activeStepIndex +=1;
            });
          } else {
            print('Submited');
          }
        },
        onStepCancel: () {
          if(_activeStepIndex == 0) {
            return;
          }
          setState(() {
            _activeStepIndex -=1;
          });
        },
        onStepTapped: (int index) {
          setState(() {
            _activeStepIndex = index;
          });
        },
        controlsBuilder: (context, controls) {
          final isLastStep = _activeStepIndex == stepList().length -1;
          final ButtonStyle _style = ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              padding: const EdgeInsets.all(14.0)
          );
          return Container(
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: controls.onStepContinue,
                    child: (isLastStep)
                        ? const Text('Submit')
                        : const Text('Next'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                if (_activeStepIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controls.onStepCancel,
                      child: const Text('Back'),
                      style: _style,
                    ),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}