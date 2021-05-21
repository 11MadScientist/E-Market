import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ImageRow extends StatefulWidget {
  MediaQueryData queryData;

  ImageRow({this.queryData});

  @override
  _ImageRowState createState() => _ImageRowState(this.queryData);
}

class _ImageRowState extends State<ImageRow> {
  String imageData;
  int count = 1;
  MediaQueryData queryData;
  List<Widget> list;

  void _addImage(int length) {
    setState(() {
      count = count + length;
    });
  }

  _ImageRowState(this.queryData);

  Future _openFileExplorer() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.image,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path)).toList();
      _addImage(files.length);

      // PRINTING THE RESULTS
      // FIRST FILE IN THE LIST
      PlatformFile file = result.files.first;
      setState(() {
        imageData = file.name.toString();
      });
      return print(file.name.toString());
      // print(file.bytes);
      // print(file.size);
      // print(file.extension);
      // print(file.path);
    } else {
      // User canceled the picker
      return ("nothing");
    }
  }

  Widget _itemRowButtonHeaderClone() {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        width: queryData.size.width * .35,
        height: queryData.size.height * .15,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
        ),
        child: IconButton(
          onPressed: () => _openFileExplorer(),
          icon: Icon(
            Icons.add_photo_alternate_rounded,
            color: Colors.white,
          ),
          iconSize: 50,
        ),
      ),
    );
  }

  Widget _itemRowButtonHeader(int index, List<Widget> list) {
    if (index < 1) {
      return Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Container(
          width: queryData.size.width * .35,
          height: queryData.size.height * .15,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () => _openFileExplorer(),
            icon: Icon(
              Icons.add_photo_alternate_rounded,
              color: Colors.white,
            ),
            iconSize: 50,
          ),
        ),
      );
    } else {
      return _itemRow(index, list);
    }
  }

  Widget _itemRow(int index, List<Widget> list) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Container(
            width: queryData.size.width * .35,
            height: queryData.size.height * .15,
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/images/meat.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: queryData.size.width * .19,
          child: RawMaterialButton(
            onPressed: () {
              setState(() {
                list.removeAt(index);
                count = count - 1;
              });
            },
            elevation: 2.0,
            fillColor: Colors.red,
            child: Icon(
              Icons.delete_outline,
              size: 20.0,
              color: Colors.white,
            ),
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }

  // Widget _itemRowButton(List<Widget> list, int index) {
  //   list.add(_itemRow());
  //   return list.elementAt(index);
  // }

  @override
  Widget build(BuildContext context) {
    //FAKING THE LIST FOR INSTANTIATING PURPOSES
    List<Widget> _imageData =
        new List.generate(1, (index) => _itemRowButtonHeaderClone());

    //INSTANTIATING IT AGAIN ORIGINALLY FOR MANIPULATION
    _imageData = new List.generate(
        count, (index) => _itemRowButtonHeader(index, _imageData));

    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _imageData.length,
        itemBuilder: (context, index) {
          // print(count.toString());
          return _itemRowButtonHeader(index, _imageData);
        });
  }
}

// Container(
//   width: queryData.size.width * .35,
//   height: queryData.size.height * .15,
//   decoration: BoxDecoration(
//     color: Colors.orange,
//     borderRadius: BorderRadius.circular(20),
//   ),
//   child: IconButton(
//     onPressed: () => _openFileExplorer(),
//     icon: Icon(
//       Icons.add_photo_alternate_rounded,
//       color: Colors.white,
//     ),
//     iconSize: 50,
//   ),
// ),
