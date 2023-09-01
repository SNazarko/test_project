import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.onChanged,
    this.controller, this.onEditingComplete, required this.focus,
  }) : super(key: key);
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextEditingController? controller;
  final FocusNode? focus;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode? _focus;
  late final TextEditingController _controller;
  bool _isVisibleIcon = false;

  @override
  void initState() {
    if (widget.focus == null) {
      setState(() {
        _focus = FocusNode();
      });
    } else {
      setState(() {
        _focus = widget.focus;
      });
    }
    if (widget.controller != null) {
      _controller = widget.controller!;
    }
    _focus?.addListener(() {
      if (_focus!.hasFocus) {
        setState(() {
          _isVisibleIcon = true;
        });
      } else {
        setState(() {
          _isVisibleIcon = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56.0,
      decoration: const BoxDecoration(
        color: AppColors.layer,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(AppIcons.search),
          ),
          Expanded(
            child: TextField(
              onEditingComplete: (){
                if(widget.onEditingComplete!= null){
                  widget.onEditingComplete!();
                  _focus?.unfocus();
                }
              },
              textInputAction: TextInputAction.search,
              style: Theme.of(context).textTheme.bodyLarge,
              focusNode: _focus,
              controller: _controller,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPlaceholder,
                    ),
                border: InputBorder.none,
              ),
              onChanged: widget.onChanged,
            ),
          ),
          if (_isVisibleIcon)
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.text = '';
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(AppIcons.close),
              ),
            ),
        ],
      ),
    );
  }
}
