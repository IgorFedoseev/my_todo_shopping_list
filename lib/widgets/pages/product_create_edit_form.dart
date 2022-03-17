import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_card.dart';
import 'package:my_to_do_shopping_list/widgets/pages/products_list_manager.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_action_buttons.dart';
import 'package:my_to_do_shopping_list/widgets/style/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class ProductCreateEditWidget extends StatefulWidget {
  final Function(ShoppingList) onCreate;
  final Function(ShoppingList) onEdit;
  final ShoppingList? originalProduct;
  final bool isUpdating;

  const ProductCreateEditWidget({
    Key? key,
    required this.onCreate,
    required this.onEdit,
    this.originalProduct,
  })  : isUpdating = (originalProduct != null),
        super(key: key);

  @override
  State<ProductCreateEditWidget> createState() =>
      _ProductCreateEditWidgetState();
}

class _ProductCreateEditWidgetState extends State<ProductCreateEditWidget> {
  final _nameController = TextEditingController();
  String _name = '';
  String _measure = Measure.piece.asString();
  int _quantity = 1;
  late bool _inGram;

  @override
  void initState() {
    super.initState();
    final originalProduct = widget.originalProduct;
    if (originalProduct != null) {
      _nameController.text = originalProduct.name;
      _name = originalProduct.name;
      _measure = originalProduct.measure;
      _quantity = originalProduct.quantity;
    }
    _inGram = originalProduct?.measure == 'г';

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _originalProduct = widget.originalProduct;
    final _textFieldTextStyle = Theme.of(context).textTheme.headline2;
    final _quantityTextStyle = Theme.of(context).textTheme.headline3;

    return Scaffold(
      appBar: AppBar(
        title: _originalProduct == null
            ? const Text('Добавить в список')
            : const Text('Редактировать'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 42.0),
                child: Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 18.0),
                        buildNameTextFormField(_textFieldTextStyle),
                        const SizedBox(height: 16.0),
                        buildMeasureOptions(),
                        const SizedBox(height: 10.0),
                        Text(
                          '$_quantity $_measure',
                          style: _quantityTextStyle,
                        ),
                        const SizedBox(height: 6.0),
                        buildSlider(),
                        const SizedBox(height: 12.0),
                        AppActionButtons(
                          resumeAddition: resumeAdding,
                          completeAddition: completeAdding,
                        ),
                        const SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ProductCardWidget(product: _originalProduct ?? completedProduct),
          ],
        ),
      ),
    );
  }

  ShoppingList get completedProduct => ShoppingList(
        id: widget.originalProduct?.id ?? const Uuid().v1(),
        name: _name,
        measure: _measure,
        quantity: _quantity,
        isTaken: widget.originalProduct?.isTaken ?? false,
      );

  void completeAdding() {
    if (widget.isUpdating) {
      widget.onEdit(completedProduct);
      Navigator.pop(context);
    } else {
      widget.onCreate(completedProduct);
      Navigator.pop(context);
    }
  }

  void resumeAdding() {
    if (widget.isUpdating) {

    } else {
      widget.onCreate(completedProduct);
      Navigator.pop(context);
    }
  }

  TextFormField buildNameTextFormField(TextStyle? textStyle) {
    return TextFormField(
      controller: _nameController,
      autofocus: true,
      cursorColor: Colors.teal,
      style: textStyle,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
        isCollapsed: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.teal,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: const BorderSide(
            color: Colors.teal,
            width: 2.0,
          ),
        ),
      ),
    );
  }

  Widget buildMeasureOptions() {
    final piece = Measure.piece.asString();
    final kilo = Measure.kilo.asString();
    final gram = Measure.gram.asString();
    final bottles = Measure.bottles.asString();
    final liters = Measure.liters.asString();
    final pack = Measure.pack.asString();
    return Wrap(
      spacing: 5.0,
      children: [
        _choiceChip(piece),
        _choiceChip(kilo),
        _choiceChip(' $gram '),
        _choiceChip(' $liters '),
        _choiceChip(bottles),
        _choiceChip(pack),
      ],
    );
  }

  ChoiceChip _choiceChip(String text) {
    final measure = text.trim();
    final textStyle = AppTheme.darkTextTheme.bodyText1;
    return ChoiceChip(
      label: Text(
        text,
        style: textStyle,
      ),
      selected: _measure == measure,
      selectedColor: Colors.teal,
      backgroundColor: Colors.blueGrey[300],
      onSelected: (selected) {
        setState(() {
          _measure = measure;
          final isInGram = _inGram;
          if (measure == Measure.gram.asString()) {
            _inGram = true;
            if (isInGram == _inGram) return;
            _quantity *= 100;
          } else {
            _inGram = false;
            if (isInGram == _inGram) return;
            _quantity ~/= 100;
          }
        });
      },
    );
  }

  Slider buildSlider() {
    return Slider(
      min: _inGram ? 100 : 1,
      max: _inGram ? 1500 : 15,
      divisions: 14,
      value: _quantity.toDouble(),
      onChanged: (newValue) {
        setState(() {
          _quantity = newValue.round();
        });
      },
      activeColor: Colors.teal,
      inactiveColor: Colors.teal[100],
    );
  }
}
