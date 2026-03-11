import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foi/widgets/ww_textfield/ww_text_field.dart';

class WwCustomAutocompleteField<T> extends StatefulWidget {
  final String? title;
  final String? hintText;
  final bool required;
  final List<T> options;
  final T? selectedValue;
  final Function(T)? onSelected;
  final Function(String)? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final bool enableBorder;
  final double optionsMaxHeight;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;
  final bool isSearch; // If true, show clear button when text is present
  final String Function(T) displayStringForOption;
  final bool
  isApiWillUpdate; // If true, external code updates options based on search
  final Function(T)? onDelete;

  const WwCustomAutocompleteField({
    super.key,
    this.title,
    this.hintText,
    this.required = false,
    required this.options,
    this.selectedValue,
    this.onSelected,
    this.onChanged,
    this.onClear,
    this.controller,
    this.focusNode,
    this.validator,
    this.enableBorder = true,
    this.optionsMaxHeight = 250.0,
    this.prefixIcon,
    this.textInputAction,
    this.isSearch = false,
    required this.displayStringForOption,
    this.isApiWillUpdate = false,
    this.onDelete,
  });

  @override
  State<WwCustomAutocompleteField<T>> createState() =>
      _WwCustomAutocompleteFieldState<T>();
}

class _WwCustomAutocompleteFieldState<T>
    extends State<WwCustomAutocompleteField<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  late FocusNode _focusNode;
  late TextEditingController _controller;
  late ScrollController _scrollController;
  bool _isOverlayOpen = false;
  List<T> _filteredOptions = [];

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TextEditingController();
    _scrollController = ScrollController();
    _filteredOptions = List.from(widget.options);

    // Initial value from selectedValue
    if (widget.selectedValue != null) {
      _controller.text = widget.displayStringForOption(
        widget.selectedValue as T,
      );
    }

    _focusNode.addListener(_onFocusChange);
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (widget.isSearch && mounted) {
      if (!widget.isApiWillUpdate) {
        _filterOptions(_controller.text);
      }
      setState(() {}); // Rebuild to update suffix icon
    }
  }

  void _filterOptions(String query) {
    if (query.isEmpty) {
      _filteredOptions = List.from(widget.options);
    } else {
      _filteredOptions = widget.options
          .where(
            (option) => widget
                .displayStringForOption(option)
                .toLowerCase()
                .contains(query.toLowerCase()),
          )
          .toList();
    }
    if (_isOverlayOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _isOverlayOpen) {
          _overlayEntry?.markNeedsBuild();
        }
      });
    }
  }

  @override
  void dispose() {
    _hideOverlay();
    _controller.removeListener(_onTextChanged);
    _scrollController.dispose();
    if (widget.focusNode == null) _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    if (_isOverlayOpen) return;

    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isOverlayOpen = true;
    });
  }

  void _hideOverlay() {
    if (!_isOverlayOpen) return;

    _overlayEntry?.remove();
    _overlayEntry = null;
    if (mounted) {
      setState(() {
        _isOverlayOpen = false;
      });
    }
  }

  void _toggleOverlay() {
    if (_isOverlayOpen) {
      _hideOverlay();
    } else {
      _showOverlay();
    }
  }

  @override
  void didUpdateWidget(WwCustomAutocompleteField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.options != oldWidget.options) {
      if (!widget.isApiWillUpdate) {
        _filterOptions(_controller.text);
      } else {
        _filteredOptions = List.from(widget.options);
      }
      if (_isOverlayOpen) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted && _isOverlayOpen) {
            _overlayEntry?.markNeedsBuild();
          }
        });
      }
    }

    // Sync controller if selectedValue changes externally
    if (widget.selectedValue != oldWidget.selectedValue) {
      if (widget.selectedValue != null) {
        final displayString = widget.displayStringForOption(
          widget.selectedValue as T,
        );
        if (_controller.text != displayString) {
          _controller.text = displayString;
        }
      } else if (!widget.isSearch) {
        _controller.clear();
      }
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            child: Container(
              constraints: BoxConstraints(maxHeight: widget.optionsMaxHeight),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child:
                  _filteredOptions.isEmpty ||
                      (_filteredOptions.length == 1 &&
                          _filteredOptions.first.toString() == 'Nill')
                  ? _buildEmptyState()
                  : _buildOptionsList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.search_off, color: Colors.grey, size: 30.sp),
          SizedBox(height: 8.h),
          Text(
            'No results found',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsList() {
    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: ListView.separated(
        controller: _scrollController,
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: _filteredOptions.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey.shade200),
        itemBuilder: (context, index) {
          final option = _filteredOptions[index];
          final displayString = widget.displayStringForOption(option);
          return ListTile(
            title: Text(
              displayString,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400),
            ),
            trailing: widget.onDelete != null
                ? IconButton(
                    icon: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      widget.onDelete?.call(option);
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  )
                : null,
            onTap: () {
              _controller.text = displayString;
              widget.onSelected?.call(option);
              _focusNode.unfocus();
            },
            dense: true,
            hoverColor: Colors.grey.shade100,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: WwTextField(
        title: widget.title,
        hintText: widget.hintText,
        required: widget.required,
        controller: _controller,
        focusNode: _focusNode,
        readOnly: !widget.isSearch,
        validator: widget.validator,
        enableBorder: widget.enableBorder,
        prefixIcon: widget.prefixIcon,
        textInputAction: widget.textInputAction,
        onChanged: (value) {
          widget.onChanged?.call(value);
          if (!_isOverlayOpen && _focusNode.hasFocus) {
            _showOverlay();
          }
        },
        suffixIcon:
            (widget.isSearch || widget.selectedValue != null) &&
                _controller.text.isNotEmpty
            ? Icon(Icons.clear, color: Colors.grey, size: 20.sp)
            : Icon(
                _isOverlayOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: Colors.grey,
              ),
        suffixTap: () {
          if ((widget.isSearch || widget.selectedValue != null) &&
              _controller.text.isNotEmpty) {
            _controller.clear();
            widget.onChanged?.call('');
            widget.onClear?.call();
            if (!_focusNode.hasFocus) {
              _focusNode.requestFocus();
            }
          } else {
            if (!_focusNode.hasFocus) {
              _focusNode.requestFocus();
            } else {
              _toggleOverlay();
            }
          }
        },
      ),
    );
  }
}
