import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:vouncher_pdf/helper/pdf_helper.dart';
import 'package:vouncher_pdf/model/vouncher.dart';
import 'package:vouncher_pdf/utils.dart';

class PdfVouncherHelper {
  static Future<File> generate(Vouncher vouncher) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildTitle(vouncher),
        buildVouncher(vouncher),
        Divider(),
        buildTotal(vouncher),
      ],
      footer: (context) => buildFooter(vouncher),
    ));

    return PdfHelper.saveDocument(name: 'my_vouncher.pdf', pdf: pdf);
  }

  static Widget buildTitle(Vouncher vouncher) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("02000-1 Stop Kitchen9 (Pan Hla)",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Text("Tel : 09772557759", style: TextStyle(fontSize: 14)),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
          Text(
            'Date: 01-Mar-24 05:35 PM',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Text(
            'Cashier Name - ThetHtoo',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Text(
            'Order No - POS-01-21',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildVouncher(Vouncher vouncher) {
    final headers = [
      'Quantity',
      "Date",
      'Item Name',
      'Unit Price',
      'Amount',
    ];
    final data = vouncher.items.map((item) {
      final total = item.unitPrice * item.quantity;

      return [
        '${item.quantity}',
        "${item.date}",
        item.description,
        '\$ ${item.unitPrice}',
        '\$ ${total.toStringAsFixed(2)}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
        4: Alignment.centerRight,
        5: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(Vouncher vouncher) {
    final netTotal = vouncher.items
        .map((item) => item.unitPrice * item.quantity)
        .reduce((item1, item2) => item1 + item2);
    final total = netTotal;

    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 9),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Net total :',
                  value: Utils.formatPrice(total),
                  unite: true,
                ),
                buildText(
                  title: 'Payment Type :',
                  value: "Cash",
                  unite: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildFooter(Vouncher vouncher) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(),
          SizedBox(height: 2 * PdfPageFormat.mm),
          Text("Thanks for Shopping with 1 Stop Mart"),
        ],
      );

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}
