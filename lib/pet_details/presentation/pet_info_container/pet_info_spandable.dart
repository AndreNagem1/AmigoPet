import 'package:amigo_pet/common_ui/divider.dart';
import 'package:amigo_pet/common_ui/letter_decoration.dart';
import 'package:flutter/material.dart';

import '../../../colors/app_colors.dart';
import '../../../common_ui/surface_decoration.dart';

class PetInfoExpandable extends StatefulWidget {
  final String label;

  const PetInfoExpandable({
    Key? key,
    required this.label, // Required parameter
  }) : super(key: key);

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<PetInfoExpandable> {
  bool _isExpanded = false; // Track the expanded state

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded; // Toggle the expanded state
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand, // Handle tap to toggle open/close
          child: Container(
            decoration:
                _isExpanded ? surfaceDecorationRoundedTop : surfaceDecoration,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: AppStyles.poppins12TextStyle,
                    ),
                    Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                        color: AppColors.warmGreen.withOpacity(0.3),
                      ),
                      child: Icon(
                        _isExpanded
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: AppColors.warmGreen,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                AppDivider(),
              ],
            ),
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 100),
          // Animation duration
          height: _isExpanded ? 100 : 0,
          // Expand to 200px height when open, 0 when closed
          decoration: surfaceDecorationRoundedBottom,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'Here is some expandable content! '
                'You can place any widget here, such as a list, text, or images.',
                style: AppStyles.poppins12TextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
