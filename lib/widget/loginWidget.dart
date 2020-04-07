import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:netflikss/video_player.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}


class _SignUpFormState extends State<SignUpForm>
    with SingleTickerProviderStateMixin {
  bool _formCompleted = false;
  // STEP 3: Add an AnimationController and add the
  // AnimatedBuilder with a LinearProgressIndicator to the Column

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    void _showWelcomeScreen() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VideoPlayerApp()));
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SignUpFormBody(
          onProgressChanged: (progress) {
            setState(() {                          // NEW
              _formCompleted = progress == 1;      // NEW
            });
          },
        ),
        Container(
            height: 40,
            width: double.infinity,
            margin: EdgeInsets.all(12),
            child: FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: _formCompleted ? _showWelcomeScreen : null,
              //onPressed: _testGraphQl,
              child: Text('Sign up'),
            )
        ),
      ],
    );
  }
}



class SignUpFormBody extends StatefulWidget {
  final ValueChanged<double> onProgressChanged;

  SignUpFormBody({
    @required this.onProgressChanged,
  }) : assert(onProgressChanged != null);

  @override
  _SignUpFormBodyState createState() => _SignUpFormBodyState();
}

class _SignUpFormBodyState extends State<SignUpFormBody> {
  static const EdgeInsets padding = EdgeInsets.all(8);
  final TextEditingController emailController = TextEditingController();

  List<TextEditingController> get controllers =>
      [emailController];

  @override
  void initState() {
    super.initState();
    controllers.forEach((c) => c.addListener(() => _updateProgress()));
  }

  double get _formProgress {
    var progress = 0.0;
    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }
    return progress;
  }

  void _updateProgress() {
    widget.onProgressChanged(_formProgress);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Text('Sign up', style: Theme.of(context).textTheme.display1),
          ),
          SignUpField(
            hintText: 'E-mail address',
            controller: emailController,
          ),
        ],
      ),
    );
  }
}

class SignUpField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  SignUpField({
    @required this.hintText,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText),
        controller: controller,
      ),
    );
  }
}