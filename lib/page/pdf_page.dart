import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vouncher_pdf/helper/pdf_helper.dart';
import 'package:vouncher_pdf/helper/pdf_vouncher_helper.dart';
import 'package:vouncher_pdf/main.dart';
import 'package:vouncher_pdf/model/vouncher.dart';
import 'package:vouncher_pdf/widget/button_widget.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 48),
                ButtonWidget(
                  text: 'Get Vouncher PDF',
                  onClicked: () async {
                    final vouncher = Vouncher(
                      items: [
                        VouncherItem(
                          description: 'Coffee',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 3,
                          unitPrice: 5,
                        ),
                        VouncherItem(
                          description: 'Water',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 8,
                          unitPrice: 0.99,
                        ),
                        VouncherItem(
                          description: 'Orange',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 3,
                          unitPrice: 2.99,
                        ),
                        VouncherItem(
                          description: 'Apple',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 8,
                          unitPrice: 3,
                        ),
                        VouncherItem(
                          description: 'Mango',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 1,
                          unitPrice: 8,
                        ),
                        VouncherItem(
                          description: 'Blue Berries',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 5,
                          unitPrice: 0.99,
                        ),
                        VouncherItem(
                          description: 'Lemon',
                          date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                          quantity: 4,
                          unitPrice: 1.29,
                        ),
                      ],
                    );

                    final pdfFile = await PdfVouncherHelper.generate(vouncher);

                    PdfHelper.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
