import 'package:flutter/material.dart';
import 'package:login_app/screens/home_screen.dart';
import '../models/authentication.dart';
import 'package:provider/provider.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {

  static const routeName = '/cadastrar';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class Company {
  int id;
  String name;

  Company(this.id, this.name);

  static List<Company> getCompanies() {
    return <Company>[
      Company(0, 'Selecione o Tipo Sanguíneo'),
      Company(1, 'A+'),
      Company(2, 'A-'),
      Company(3, 'B+'),
      Company(4, 'B-'),
      Company(5, 'AB+'),
      Company(6, 'AB-'),
      Company(7, 'O+'),
      Company(8, 'O-'),
    ];
  }
}

class _SignupScreenState extends State<SignupScreen> {

  List <Company> _companies = Company.getCompanies();
  List <DropdownMenuItem<Company>> _dropdownMenuItems;
  Company _selectedCompany;

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_companies);
    _selectedCompany = _dropdownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Company>> buildDropdownMenuItems(List companies) {
    List<DropdownMenuItem<Company>> items = List();
    for (Company company in companies) {
      items.add(
        DropdownMenuItem(
          value: company,
          child: Text(company.name),
        ),
      );
    }
    return items;
  }
  onChangeDropdownItem(Company selectedCompany) {
    setState(() {
      _selectedCompany = selectedCompany;
    });
  }


  final GlobalKey <FormState> _formKey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String,String> _authData ={
    'email': '',
    'password': ''
  };

  void _showErrorDialog (String msg){
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text ('Erro ao Logar'),
          content: Text(msg),
          actions: [
            FlatButton(
                child: Text('Voltar'),
                onPressed: (){
                  Navigator.of(ctx).pop();
                }
            )
          ],
        )
    );
  }

  Future <void> _submit() async{
    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    try{
      await Provider.of<Authentication>(context, listen: false).signUp(
          _authData['email'],
          _authData['password']
      );
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }catch(error){
      var errorMessage = 'Erro ao cadastrar';
      _showErrorDialog(errorMessage);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: Text ('Cadastrar Novo Doador'),
        actions: <Widget>[
          FlatButton(
            child: Row (
              children: <Widget> [
                Text ('Login  '),
                Icon (Icons.person)
              ],
            ),
            padding: EdgeInsets.fromLTRB(0,0,25,0),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
          ),
        ],

      ),
      body: Stack (
        children: <Widget> [
          Container (
            decoration: BoxDecoration (
              gradient: LinearGradient(
                colors: [
                  Colors.white10,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: Card (
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container (
                width: 350,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Nome Completo'),
                          keyboardType: TextInputType.name,
                          validator: (value){
                            if (value.isEmpty || value.length<=4) {
                              return 'Nome Inválido';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _authData['email'] = value;
                          },
                        ),

                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value){
                            if (value.isEmpty || !value.contains('@')) {
                              return 'Email Inválido';
                            }
                            return null;
                          },
                          onSaved: (value){
                            _authData['email'] = value;
                          },
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                        //   child: Text(
                        //     "Selecione o Tipo Sanguíneo",
                        //     style: TextStyle(fontSize: 16, color: Colors.black54),
                        //   ),
                        // ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                          child: DropdownButton(
                            value:_selectedCompany,
                            items: _dropdownMenuItems,
                            onChanged: onChangeDropdownItem,
                          ),
                        ),

                        TextFormField(
                            decoration: InputDecoration(labelText: 'Senha'),
                            obscureText: true,
                            controller: _passwordController,
                            validator: (value){
                              if (value.isEmpty || value.length<=4){
                                return 'Senha Inválida';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _authData['password'] = value;
                            }
                        ),

                        TextFormField(
                            decoration: InputDecoration(labelText: 'Confirme a senha'),
                            obscureText: true,
                            validator: (value){
                              if (value.isEmpty || value != _passwordController.text){
                                return 'Senha Inválida';
                              }
                              return null;
                            },
                            onSaved: (value) {

                            }
                        ),

                        SizedBox(
                          height:30,
                        ),
                        RaisedButton(
                          child: Text('Cadastrar'),
                          onPressed: (){
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.red,
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
