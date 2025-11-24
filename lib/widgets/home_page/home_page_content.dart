import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:m2i_cours_flutter/data/models/todo.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.5,
      width: MediaQuery.of(context).size.width / 1.25,
      color: Colors.pink,
      child: Center(
        child: FutureBuilder<List<Todo>>(
          future: launchRequest(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasError) return Text("Error: ${snapshot.data}");
            return ListView.builder(
              itemBuilder: (context, index) => Row(
                children: [
                  Text("Id(${snapshot.data![index].id}): ${snapshot.data![index].title}"),
                  SizedBox(width: 30,),
                  Checkbox(
                    value: snapshot.data![index].completed,
                    onChanged: (value) => {},
                  ),
                ],
              ),
              itemCount: snapshot.data?.length,
            );
          },
        ),
      ),
    );
  }

  Future<List<Todo>> launchRequest() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );
    print(response.body);
    List<Todo> todos = [];

    for(var todo in jsonDecode(response.body)) {
      todos.add(Todo.fromJson(todo));
    }
    return todos;
  }
}
