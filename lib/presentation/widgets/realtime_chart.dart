import 'package:flutter/material.dart';

class RealtimeChart extends StatelessWidget {

  const RealtimeChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Card(
      child: SizedBox(
        height: 350,
        child: Center(
          child: Text(
            'Realtime Chart',
            style: Theme.of(context)
                .textTheme
                .headlineSmall,
          ),
        ),
      ),
    );
  }
}
