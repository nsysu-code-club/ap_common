import 'dart:typed_data';

import 'package:ap_common_flutter_ui/ap_common_flutter_ui.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

enum PdfState { loading, finish, error }

class PdfView extends StatefulWidget {
  const PdfView({
    super.key,
    required this.state,
    this.onRefresh,
    this.data,
    this.fileName,
    this.errorMessage,
  });

  final PdfState state;
  final Function()? onRefresh;
  final Uint8List? data;
  final String? fileName;
  final String? errorMessage;

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  @override
  void initState() {
    AnalyticsUtil.instance.setCurrentScreen(
      'PdfView',
      'pdf_view.dart',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.state) {
      case PdfState.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case PdfState.error:
        return errorContent;
      default:
        return Scaffold(
          body: PdfPreview(
            build: (PdfPageFormat format) {
              return widget.data!;
            },
            useActions: false,
          ),
          floatingActionButton: Padding(
            padding: EdgeInsets.only(bottom: ApAppShell.bottomInset(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () async {
                    AnalyticsUtil.instance.logEvent('export_by_share');
                    await Printing.sharePdf(
                      bytes: widget.data!,
                      filename: '${widget.fileName ?? 'export'}.pdf',
                    );
                  },
                  child: Icon(ApIcon.share),
                ),
                const SizedBox(height: 16.0),
                FloatingActionButton(
                  onPressed: () async {
                    AnalyticsUtil.instance.logEvent('export_by_printing');
                    await Printing.layoutPdf(
                      name: widget.fileName ?? 'export',
                      onLayout: (PdfPageFormat format) => widget.data!,
                    );
                  },
                  child: Icon(ApIcon.print),
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget get errorContent => InkWell(
        onTap: () {
          widget.onRefresh?.call();
        },
        child: HintContent(
          icon: ApIcon.error,
          content: widget.errorMessage ?? context.ap.clickToRetry,
        ),
      );
}
