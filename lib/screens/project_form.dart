import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";
  String _techStack = "";
  String _projectUrl = "";
  String _projectImageUrl = "";
  bool _isSubmitting = false;

  String? _validateRequiredText(String? value, String label, int maxLength) {
    final trimmed = value?.trim() ?? "";
    if (trimmed.isEmpty) {
      return "$label tidak boleh kosong!";
    }
    if (trimmed.length > maxLength) {
      return "$label maksimal $maxLength karakter!";
    }
    return null;
  }

  String? _validateUrl(String? value, {required bool required}) {
    final trimmed = value?.trim() ?? "";
    if (trimmed.isEmpty) {
      if (!required) {
        return null;
      }
      return "Project URL tidak boleh kosong!";
    }
    if (trimmed.length > 250) {
      return "URL maksimal 250 karakter!";
    }
    final uri = Uri.tryParse(trimmed);
    final hasValidScheme =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    final hasValidHost = uri != null && uri.host.isNotEmpty;
    if (!hasValidScheme || !hasValidHost) {
      return "Masukkan URL valid (awalan http:// atau https://)!";
    }
    return null;
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final allowed = await ensureLoggedIn(context);
    if (!mounted || !allowed) {
      return;
    }

    final token = context.read<AuthState>().token;
    if (token == null) {
      return;
    }

    final newProject = Project(
      title: _title.trim(),
      description: _description.trim(),
      techStack: _techStack.trim(),
      projectUrl: _projectUrl.trim(),
      projectImageUrl: _projectImageUrl.trim(),
    );

    setState(() {
      _isSubmitting = true;
    });

    try {
      final created = await context.read<ApiClient>().createProject(
        newProject,
        token: token,
      );
      if (!mounted) {
        return;
      }

      await showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Proyek berhasil disimpan!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ID: ${created.id ?? "-"}'),
                  Text('Title: ${created.title}'),
                  Text('Description: ${created.description}'),
                  Text('Tech Stack: ${created.techStack}'),
                  Text('Project URL: ${created.projectUrl}'),
                  if (created.projectImageUrl.trim().isNotEmpty)
                    Text('Project Image URL: ${created.projectImageUrl}'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      if (!mounted) {
        return;
      }
      _formKey.currentState!.reset();
      setState(() {
        _title = "";
        _description = "";
        _techStack = "";
        _projectUrl = "";
        _projectImageUrl = "";
      });
    } on ApiException catch (e) {
      if (!mounted) {
        return;
      }
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) {
          return;
        }
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Sesi berakhir (401). Silakan login ulang.'),
            ),
          );
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Text('Gagal menyimpan proyek (HTTP ${e.statusCode}).'),
            ),
          );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Project Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Sewalayan Platform",
                    labelText: "Title",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _title = value,
                  validator: (value) =>
                      _validateRequiredText(value, "Title", 150),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Tuliskan deskripsi proyek",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _description = value,
                  validator: (value) =>
                      _validateRequiredText(value, "Description", 1000),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Django, Flutter, PostgreSQL",
                    labelText: "Tech Stack",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _techStack = value,
                  validator: (value) =>
                      _validateRequiredText(value, "Tech Stack", 250),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "https://contoh.com/proyek",
                    labelText: "Project URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _projectUrl = value,
                  validator: (value) => _validateUrl(value, required: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "https://contoh.com/gambar.png (opsional)",
                    labelText: "Project Image URL (Optional)",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => _projectImageUrl = value,
                  validator: (value) => _validateUrl(value, required: false),
                ),
              ),
              const SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(Colors.indigo),
                  ),
                  onPressed: _isSubmitting ? null : _submit,
                  child: _isSubmitting
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Save",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
