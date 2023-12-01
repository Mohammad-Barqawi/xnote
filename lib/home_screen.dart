import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> noteList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My Notes")),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              addEditItemBottomSheet(callback: (value) {
                noteList.add(value);
                setState(() {});
              });
              // showButtomSheet(
              //     context: context,
              //     //hoon an3amalo callback
              //     callback: (value) {
              //       noteList.add(value);
              //       setState(() {});
              //     });
            },
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey[200],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(noteList[index])),
                      /////////////////////[[ Edit Icon ]]//////////////////////
                      IconButton(
                          onPressed: () {
                            addEditItemBottomSheet(
                                initialValue: noteList[index],
                                callback: (val) {
                                  noteList[index] = val;
                                  setState(() {});
                                });
                            // editItemBottomSheet(
                            //     initialValue: noteList[index],
                            //     callback: (val) {
                            //       noteList[index] = val;
                            //       setState(() {});
                            //     });
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                      ///////////////////[[ Delete Icon ]]//////////////////////
                      IconButton(
                          onPressed: () {
                            deleteItem(index: index);
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            );
          }),
      ////kabseh 3al yameen
      // floatingActionButton: IconButton(
      //   icon: const Icon(Icons.add),
      //   onPressed: () {},
      // ),
    );
  }
  ////////////////////////////[[ Delete Method ]]/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void deleteItem({required int index}) {
    noteList.removeAt(index);
  }
  //////////////////////////////[[ Add Edit Method ]]/////////////////////////////////////////////////////////////////////////////////////////////////////////

  void addEditItemBottomSheet(
      {String? initialValue, required Function(String) callback}) {
    TextEditingController noteController = TextEditingController();
    if (initialValue != null) {
      noteController.text = initialValue;
    }
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel")),
                  Expanded(
                      child: Text(
                    initialValue != null ? "Edit Note" : "Add New Note",
                    textAlign: TextAlign.center,
                  )),
                  TextButton(
                      onPressed: () {
                        //hoon nadena callback Function w raja3 al noteController
                        callback(noteController.text);
                        Navigator.of(context).pop();
                      },
                      child: const Text("Save")),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: noteController,
                  decoration: InputDecoration(
                      hintText:
                          initialValue != null ? "Edit Note" : "Add New Note",
                      border: const OutlineInputBorder()),
                ),
              ),
            ],
          );
        });
  }

  //////////////////////////////[[ Edit Method ]]/////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // void editItemBottomSheet(
  //     {required String initialValue, required Function(String) callback}) {
  //   TextEditingController noteController =
  //       TextEditingController(text: initialValue);
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Column(
  //           children: [
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               children: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("cancel")),
  //                 const Expanded(
  //                     child: Text(
  //                   "Edit Note",
  //                   textAlign: TextAlign.center,
  //                 )),
  //                 TextButton(
  //                     onPressed: () {
  //                       //hoon nadena callback Function w raja3 al noteController
  //                       callback(noteController.text);
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("Save")),
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16),
  //               child: TextField(
  //                 controller: noteController,
  //                 decoration: const InputDecoration(
  //                     hintText: "Edit Note", border: OutlineInputBorder()),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }

  //////////////////////////[[ ShowButtom Method ]]///////////////////////////////////////////////////////////////////////////////////////////////////////////

  // hon bedna ne3mal callback joa al Function
  // void showButtomSheet(
  //     {required BuildContext context, required Function(String) callback}) {
  //   TextEditingController noteController = TextEditingController();
  //   //hay al method betale3 view men ta7et
  //   showModalBottomSheet(
  //       context: context,
  //       // hay bt5aleha 3a gad al shasheh
  //       // isScrollControlled: true,
  //       builder: (BuildContext context) {
  //         return Column(
  //           children: [
  //             const SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               children: [
  //                 TextButton(
  //                     onPressed: () {
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("cancel")),
  //                 const Expanded(
  //                     child: Text(
  //                   "Add New Note",
  //                   textAlign: TextAlign.center,
  //                 )),
  //                 TextButton(
  //                     onPressed: () {
  //                       //hoon nadena callback Function w raja3 al noteController
  //                       callback(noteController.text);
  //                       Navigator.of(context).pop();
  //                     },
  //                     child: const Text("save")),
  //               ],
  //             ),
  //             Padding(
  //               padding: const EdgeInsets.all(16),
  //               child: TextField(
  //                 controller: noteController,
  //                 decoration: const InputDecoration(
  //                     hintText: "Enter New Note", border: OutlineInputBorder()),
  //               ),
  //             ),
  //           ],
  //         );
  //       });
  // }
}
