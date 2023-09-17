import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<String> images = [
    "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://images.unsplash.com/photo-1615807713086-bfc4975801d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2F0JTIwZmFjZXxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpN_4eSqOjkRUhRuNxb5MPvXoFbynICo1i7A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLYcPfJQ255xRKkVat9T-UYlX0KhImj41oWA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMP3fl8_7CbbfeA2Sqa2JVly8qovukphDtqg&usqp=CAU"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Scrollbar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to My Photo Gallery!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
              ),
              SizedBox(
                height: 45,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Search for photos..."),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Photo $index Clicked!"),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          width: 90,
                          height: 90,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          "Photo $index",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: 8,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1615789591457-74a63395c990?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmFieSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                ),
                title: Text("Photo 1"),
                subtitle: Text("Description for photo 1"),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y3V0ZSUyMGNhdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
                ),
                title: Text("Photo 2"),
                subtitle: Text("Description for photo 2"),
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLYcPfJQ255xRKkVat9T-UYlX0KhImj41oWA&usqp=CAU"),
                ),
                title: Text("Photo 3"),
                subtitle: Text("Description for photo 3"),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: SizedBox(
                  height: 52,
                  width: 52,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Photos Uploaded Successfully!'),
                          ),
                        );
                      },
                      child: Icon(Icons.upload)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
