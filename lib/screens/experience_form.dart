import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _title = "";
  String _description = "";
  String _techStack = "";
  String _projectUrl = "";
  DateTime? _startDate;
  DateTime? _endDate;

  String _formatDate(DateTime? date) {
    if (date == null) {
      return "";
    }
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return "$year-$month-$day";
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initialDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950, 1, 1),
      lastDate: DateTime(2100, 12, 31),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
          }
        } else {
          _endDate = picked;
        }
      });
    }
  }

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

  String? _validateRequiredUrl(String? value) {
    final trimmed = value?.trim() ?? "";
    if (trimmed.isEmpty) {
      return "Project URL tidak boleh kosong!";
    }
    if (trimmed.length > 250) {
      return "Project URL maksimal 250 karakter!";
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

  String? _validateStartDate() {
    if (_startDate == null) {
      return "Tanggal mulai wajib dipilih!";
    }
    return null;
  }

  String? _validateEndDate() {
    if (_endDate == null) {
      return "Tanggal selesai wajib dipilih!";
    }
    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
      return "Tanggal selesai tidak boleh lebih awal dari tanggal mulai!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Experience Form')),
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
              // 1. Judul Pengalaman (Wajib)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Software Engineer Intern",
                    labelText: "Judul Pengalaman",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _title = value ?? "";
                    });
                  },
                  validator: (String? value) =>
                      _validateRequiredText(value, "Judul pengalaman", 120),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: "Tuliskan ringkasan peran atau pencapaian",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) =>
                      _validateRequiredText(value, "Deskripsi", 500),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Flutter, Django, WordPress",
                    labelText: "Tech Stack",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _techStack = value ?? "";
                    });
                  },
                  validator: (String? value) =>
                      _validateRequiredText(value, "Tech stack", 200),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "https://contoh.com/proyek-pengalaman",
                    labelText: "Project URL",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _projectUrl = value ?? "";
                    });
                  },
                  validator: _validateRequiredUrl,
                ),
              ),

              // Implementasi showDatePicker
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        key: ValueKey('exp_start_${_formatDate(_startDate)}'),
                        readOnly: true,
                        initialValue: _formatDate(_startDate),
                        decoration: InputDecoration(
                          hintText: "Pilih tanggal mulai",
                          labelText: "Tanggal Mulai",
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onTap: () => _pickDate(isStart: true),
                        validator: (_) => _validateStartDate(),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        key: ValueKey('exp_end_${_formatDate(_endDate)}'),
                        readOnly: true,
                        initialValue: _formatDate(_endDate),
                        decoration: InputDecoration(
                          hintText: "Pilih tanggal selesai",
                          labelText: "Tanggal Selesai",
                          suffixIcon: const Icon(Icons.calendar_today),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onTap: () => _pickDate(isStart: false),
                        validator: (_) => _validateEndDate(),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12.0),

              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final cleanTitle = _title.trim();
                        final cleanDescription = _description.trim();
                        final cleanTechStack = _techStack.trim();
                        final cleanProjectUrl = _projectUrl.trim();
                        final formattedStart = _formatDate(_startDate);
                        final formattedEnd = _formatDate(_endDate);

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text(
                                'Pengalaman berhasil ditambahkan!',
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Judul: $cleanTitle'),
                                    Text('Deskripsi: $cleanDescription'),
                                    Text('Tech Stack: $cleanTechStack'),
                                    Text('Project URL: $cleanProjectUrl'),
                                    Text(
                                      'Periode: $formattedStart s.d. $formattedEnd',
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    _formKey.currentState!.reset();
                                    setState(() {
                                      _title = "";
                                      _description = "";
                                      _techStack = "";
                                      _projectUrl = "";
                                      _startDate = null;
                                      _endDate = null;
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
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
