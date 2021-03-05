import 'package:capyba_challenge/components/custom_input_field.dart';
import 'package:capyba_challenge/components/rounded_button.dart';
import 'package:capyba_challenge/global/styles/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dmlld3xlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80"),
                ),
                SizedBox(
                  height: 38.0,
                ),
                CustomInputField(
                  hint: "Descrição",
                  iconData: FeatherIcons.italic,
                  inputType: TextInputType.text,
                ),
                Row(
                  children: [
                    Transform.translate(
                      offset: Offset(-14, 0),
                      child: Checkbox(
                        value: true,
                        checkColor: Theme.of(context).primaryColor,
                        onChanged: (bool value) {
                          print(value);
                        },
                      ),
                    ),
                    Text(
                      "Imagem pública",
                      style: TextTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 38.0,
                ),
                RoundedButton(
                  text: "Salvar",
                  color: Theme.of(context).primaryColor,
                  onPress: () => print("SALVOU"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
