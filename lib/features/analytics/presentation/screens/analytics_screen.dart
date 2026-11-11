import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/features/analytics/models/analytics_result.dart';
import 'package:iot_dashboard_app/features/analytics/models/mesurements_query.dart';
import 'package:iot_dashboard_app/features/analytics/presentation/widgets/analytics_body.dart';
import 'package:iot_dashboard_app/features/analytics/presentation/widgets/analytics_search_form.dart';
import 'package:iot_dashboard_app/features/analytics/services/analytics/analytics_service.dart';



class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() =>
      _AnalyticsScreenState();
}

class _AnalyticsScreenState
    extends State<AnalyticsScreen> {

  final AnalyticsService _service =
      AnalyticsService();

  int _selectedGrandeur = 1;

  DateTime _start =
      DateTime.now().subtract(
    const Duration(days: 1),
  );

  DateTime _end = DateTime.now();

  Future<AnalyticsResult>? _future;

  Future<void> _search() async {
    setState(() {
      _future = _service.search(
        MeasurementQuery(
          grandeurId: _selectedGrandeur,
          start: _start,
          end: _end,
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _search();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Analytics Dashboard',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            AnalyticsSearchForm(
              selectedGrandeur:
                  _selectedGrandeur,
              start: _start,
              end: _end,
              onGrandeurChanged: (value) {
                setState(() {
                  _selectedGrandeur = value;
                });
              },
              onStartChanged: (value) {
                setState(() {
                  _start = value;
                });
              },
              onEndChanged: (value) {
                setState(() {
                  _end = value;
                });
              },
              onSearch: _search,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: FutureBuilder<
                  AnalyticsResult>(
                future: _future,
                builder:
                    (context, snapshot) {

                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                      child:
                          CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error
                            .toString(),
                      ),
                    );
                  }

                  if (!snapshot.hasData) {
                    return const SizedBox();
                  }

                  return AnalyticsBody(
                    result: snapshot.data!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}