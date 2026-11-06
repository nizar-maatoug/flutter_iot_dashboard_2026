import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class TempeartureStreamWidget extends StatelessWidget {
  final double value;
  TempeartureStreamWidget({super.key, required this.value});

  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Center(
              child: Text(
                '${value}',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            );
        }
      
    
  }

