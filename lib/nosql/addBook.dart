import 'package:flutter/material.dart';
import 'package:flutter_app_aula2_banco/nosql/model/book.dart';
import 'package:flutter_app_aula2_banco/sqlite/model/person.dart';

class AddBook extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _authorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Livro"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Nome",
                      labelText: "Nome"
                  ),
                  controller: _nameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira o nome do livro';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Autor",
                      labelText: "Autor"
                  ),
                  controller: _authorController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Insira o autor do livro';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Book book = Book(
                            name: _nameController.text,
                            author: _authorController.text
                        );
                        Navigator.pop(context, book);
                      }
                    },
                    child: Text('Salvar'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}