import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_project/presentation/bloc/home_cubit.dart';

import '../../domain/models/user_search_model.dart';
import '../theme/app_colors.dart';
import '../theme/app_icons.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    Key? key,
    required this.model,
    this.isFavorite,
  }) : super(key: key);
  final UserSearchModel model;
  final bool? isFavorite;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool _favorite = false;

  @override
  void initState() {
    _favorite = widget.model.isFavorite ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 4.0,
      ),
      child: Container(
        width: double.infinity,
        height: 55.0,
        decoration: const BoxDecoration(
          color: AppColors.layer,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.model.name,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (widget.isFavorite == true) {
                    context.read<HomeCubit>().dellFavorite(widget.model);
                  } else {
                    setState(() {
                      _favorite = !_favorite;
                    });
                    if (_favorite) {
                      context.read<HomeCubit>().addFavorite(widget.model);
                    } else {
                      context.read<HomeCubit>().dellFavorite(widget.model);
                    }
                  }
                },
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: SvgPicture.asset(
                    AppIcons.favorite1,
                    color: context.watch<HomeCubit>().state.favoriteList.any(
                              (element) => element.id == widget.model.id,
                            )
                        ? AppColors.accentPrimary
                        : AppColors.textPlaceholder,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
