import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class BaseView<TViewModel extends Store> extends StatefulWidget {
  final Widget Function(BuildContext context, TViewModel model) onPageBuilder;
  final void Function(TViewModel model) onModelReady;
  final VoidCallback? onDispose;
  final TViewModel viewModel;
  final Future<bool> Function()? onWillPop;
  const BaseView(
      {Key? key,
      required this.onPageBuilder,
      required this.onModelReady,
      this.onDispose,
      required this.viewModel,
      this.onWillPop})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<TViewModel>();
}

class _BaseViewState<TViewModel extends Store>
    extends State<BaseView<TViewModel>> {
  @override
  void initState() {
    widget.onModelReady(widget.viewModel);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.onDispose != null) widget.onDispose!();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.onPageBuilder(context, widget.viewModel),
      onWillPop: widget.onWillPop,
    );
  }
}
