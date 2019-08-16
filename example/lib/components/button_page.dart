import 'package:flutter/widgets.dart';
import 'package:provider_boilerplate/components/button.dart';

class ButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
      child: Column(
        children: <Widget>[
          Container(
            height: 24,
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            child: Text("Default"),
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            type: ButtonType.primary,
            child: Text("Primary"),
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            type: ButtonType.accent,
            child: Text("Accent"),
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            type: ButtonType.success,
            child: Text("Success"),
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            type: ButtonType.warning,
            child: Text("Warning"),
          ),
          FillButton(
            fullWidth: true,
            onPressed: () {},
            type: ButtonType.danger,
            child: Text("Danger"),
          ),
        ],
      ),
    );
  }
}
