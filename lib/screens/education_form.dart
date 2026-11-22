import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _institution = "";
  String _degree = "S1 (Sarjana)";
  String _fieldOfStudy = "";
  String _startYearInput = "";
  String _endYearInput = "";
  String _credentialUrl = "";

  final List<String> _degrees = [
    'SMA/SMK',
    'D3 (Diploma)',
    'S1 (Sarjana)',
    'S2 (Magister)',
    'S3 (Doktor)',
    'Sertifikasi / Kursus',
  ];

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

  String? _validateYear(String? value, String label, {bool isEndYear = false}) {
    final trimmed = value?.trim() ?? "";
    if (trimmed.isEmpty) {
      return "$label tidak boleh kosong!";
    }
    final year = int.tryParse(trimmed);
    if (year == null || trimmed.length != 4 || year < 1950 || year > 2100) {
      return "Masukkan $label valid (4 digit, 1950-2100)!";
    }
    if (isEndYear) {
      final startYear = int.tryParse(_startYearInput.trim());
      if (startYear != null && year < startYear) {
        return "Tahun selesai tidak boleh lebih awal dari tahun mulai!";
      }
    }
    return null;
  }

  String? _validateOptionalUrl(String? value) {
    final trimmed = value?.trim() ?? "";
    if (trimmed.isEmpty) {
      return null;
    }
    final uri = Uri.tryParse(trimmed);
    final hasValidScheme =
        uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
    final hasValidHost = uri != null && uri.host.isNotEmpty;
    if (!hasValidScheme || !hasValidHost) {
      return "Format URL tidak valid (gunakan awalan http:// atau https://)!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Add Education Form'),
        ),
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
                    hintText: "Contoh: Universitas Indonesia",
                    labelText: "Institusi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _institution = value ?? "";
                    });
                  },
                  validator: (String? value) =>
                      _validateRequiredText(value, "Institusi", 120),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: "Jenjang / Gelar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  initialValue: _degree,
                  items: _degrees.map((String degree) {
                    return DropdownMenuItem<String>(
                      value: degree,
                      child: Text(degree),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      setState(() {
                        _degree = newValue;
                      });
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Ilmu Komputer",
                    labelText: "Bidang Studi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _fieldOfStudy = value ?? "";
                    });
                  },
                  validator: (String? value) =>
                      _validateRequiredText(value, "Bidang studi", 100),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "YYYY",
                          labelText: "Tahun Mulai",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _startYearInput = value ?? "";
                          });
                        },
                        validator: (String? value) =>
                            _validateYear(value, "Tahun mulai"),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "YYYY",
                          labelText: "Tahun Selesai",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _endYearInput = value ?? "";
                          });
                        },
                        validator: (String? value) => _validateYear(
                          value,
                          "Tahun selesai",
                          isEndYear: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    hintText: "https://contoh.ac.id/verifikasi (opsional)",
                    labelText: "Tautan Verifikasi / Sertifikat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _credentialUrl = value ?? "";
                    });
                  },
                  validator: _validateOptionalUrl,
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
                        final cleanInstitution = _institution.trim();
                        final cleanField = _fieldOfStudy.trim();
                        final cleanStart = _startYearInput.trim();
                        final cleanEnd = _endYearInput.trim();
                        final cleanUrl = _credentialUrl.trim();

                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Edukasi berhasil ditambahkan!'),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Institusi: $cleanInstitution'),
                                    Text('Jenjang: $_degree'),
                                    Text('Bidang Studi: $cleanField'),
                                    Text('Periode: $cleanStart - $cleanEnd'),
                                    Text(
                                      'Tautan: ${cleanUrl.isEmpty ? "-" : cleanUrl}',
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
                                      _institution = "";
                                      _degree = "S1 (Sarjana)";
                                      _fieldOfStudy = "";
                                      _startYearInput = "";
                                      _endYearInput = "";
                                      _credentialUrl = "";
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