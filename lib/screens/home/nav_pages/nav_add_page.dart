import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

class NavAddPage extends StatefulWidget {
  const NavAddPage({super.key});

  @override
  State<NavAddPage> createState() => _NavAddPageState();
}

class _NavAddPageState extends State<NavAddPage> {
  late TextEditingController _titleController;
  late TextEditingController _artistController;
  late TextEditingController _descriptionController;
  late GlobalKey<FormState> _formState;

  @override
  void initState() {
    _titleController = TextEditingController();
    _artistController = TextEditingController();
    _descriptionController = TextEditingController();
    _formState = GlobalKey<FormState>();
    // TODO: implement initState
    super.initState();
  }

  final ImagePicker _imagePicker = ImagePicker();

  String? _selectedImagePath;
  String? _selectedAudioPath;
  String? _selectedAudioName;

  @override
  void dispose() {
    _titleController.dispose();
    _artistController.dispose();
    _descriptionController.dispose(); // TODO: implement dispose
    super.dispose();
  }

  /// Ouvre la galerie pour choisir une image de couverture.
  Future<void> _pickImage() async {
    final file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null || !mounted) return;

    setState(() {
      _selectedImagePath = file.path;
    });
  }

  /// Ouvre l'explorateur pour choisir un fichier audio.
  Future<void> _pickAudio() async {
    final result = await FilePicker.pickFiles(type: FileType.audio);

    if (result == null || result.files.isEmpty || !mounted) return;

    final file = result.files.single;

    setState(() {
      _selectedAudioPath = file.path;
      _selectedAudioName = file.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      width: double.infinity,
      child: SingleChildScrollView(
        child: Form(
          key: _formState,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add music',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _pickImage,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedImagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            File(_selectedImagePath!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 30,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: _pickAudio,
                child: Container(
                  height: 70,
                  padding: const EdgeInsets.all(7),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _selectedAudioName != null
                      ? Text(
                          'Audio selected: $_selectedAudioName',
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      : const Center(
                          child: Icon(Icons.library_music, size: 30),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: RequiredValidator(errorText: "* Required").call,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _artistController,
                decoration: const InputDecoration(labelText: 'Artist'),
                validator: RequiredValidator(errorText: "* Required").call,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 4,
                validator: RequiredValidator(errorText: "* Required").call,
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                icon: Icon(Icons.add),
                label: Text("add music "),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
