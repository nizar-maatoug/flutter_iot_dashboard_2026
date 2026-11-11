import 'package:flutter/material.dart';

class AnalyticsSearchForm extends StatelessWidget {
  final int selectedGrandeur;
  final DateTime start;
  final DateTime end;

  final ValueChanged<int> onGrandeurChanged;

  final ValueChanged<DateTime> onStartChanged;

  final ValueChanged<DateTime> onEndChanged;

  final VoidCallback onSearch;

  const AnalyticsSearchForm({
    super.key,
    required this.selectedGrandeur,
    required this.start,
    required this.end,
    required this.onGrandeurChanged,
    required this.onStartChanged,
    required this.onEndChanged,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              initialValue: selectedGrandeur,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Temperature'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Humidity'),
                ),
              ],
              onChanged: (value) => onGrandeurChanged(value!),
            ),

            const SizedBox(height: 12),

            FilledButton.icon(
              onPressed: onSearch,
              icon: const Icon(Icons.search),
              label: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}
