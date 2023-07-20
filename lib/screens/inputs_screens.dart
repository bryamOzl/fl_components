import 'package:flutter/material.dart';

import 'package:fl_components/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Gabriel',
      'last_name': 'Mora',
      'email': 'gabriel@gmail.com',
      'password': '123456',
      'role': 'Admin'
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre de usuario',
                  formValues: formValues,
                  formProperty: 'first_name',
                  // helperText: 'Solo letras',
                  // suffixIcon: Icons.group_outlined,
                  // icon: Icons.assignment_ind_outlined,
                ),
                SizedBox(height: 30.0),
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido del usuario',
                  formValues: formValues,
                  formProperty: 'last_name',
                ),
                SizedBox(height: 30.0),
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formValues: formValues,
                  formProperty: 'email',
                ),
                SizedBox(height: 30.0),
                CustomInputField(
                  labelText: 'Contrasenia',
                  hintText: 'Contrasenia del usuario',
                  obscureText: true,
                  formValues: formValues,
                  formProperty: 'password',
                ),
                SizedBox(height: 30.0),
                DropdownButtonFormField<String>(
                  items: [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Superuser', child: Text('Superuser')),
                    DropdownMenuItem(
                        value: 'Developer', child: Text('Developer')),
                    DropdownMenuItem(
                        value: 'Jr Developer', child: Text('Jr Developer')),
                  ],
                  onChanged: (value) {
                    print(value);
                    formValues['role'] = value ?? 'Admin';
                  },
                ),
                ElevatedButton(
                  child: SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar')),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no valido');
                      return;
                    }

                    print(formValues);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
