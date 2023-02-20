import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/flutter_full_pdf_viewer.dart';

class Ggmodel extends StatefulWidget {
  const Ggmodel({super.key});

  @override
  State<Ggmodel> createState() => _GgmodelState();
}

class _GgmodelState extends State<Ggmodel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () async {
          // Create a PDF document
          final pdf = pw.Document();

          // Add some text to the document
          pdf.addPage(
            pw.Page(
              build: (context) {
                return pw.Center(
                  child: pw.Text("Hello, World!"),
                );
              },
            ),
          );

          // Save the document to a file
          final output = await getTemporaryDirectory();
          final file = File("${output.path}/example.pdf");
          await file.writeAsBytes(await pdf.save());

          // Display the PDF in a viewer
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFViewerScaffold(
                appBar: AppBar(
                  title: Text("PDF Document"),
                ),
                path: file.path,
              ),
            ),
          );
        },
        child: const Text('Generate PDF'),
      ),
    );
  }
}
