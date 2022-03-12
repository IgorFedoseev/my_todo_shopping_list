import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product_mock.dart';

class ProductFormWidget extends StatefulWidget {
  const ProductFormWidget({Key? key, required this.products}) : super(key: key);
  final ShoppingList products;

  @override
  State<ProductFormWidget> createState() => _ProductFormWidgetState();
}

class _ProductFormWidgetState extends State<ProductFormWidget> {
  late int _sliderValue;
  late bool _inGram;

  @override
  void initState() {
    super.initState();
    _inGram = widget.products.measure == 'г';
    final quantity = widget.products.quantity;
    _sliderValue = quantity;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.headline3;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактировать'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: widget.products.name,
                        autofocus: true,
                        cursorColor: Colors.teal,
                        style: textStyle,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
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
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '$_sliderValue',
                        style: textStyle,
                      ),
                      const SizedBox(height: 10.0),
                      Slider(
                        min: _inGram ? 100 : 1,
                        max: _inGram ? 1500 : 15,
                        divisions: 14,
                        value: _sliderValue.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            _sliderValue = newValue.round();
                          });
                        },
                        activeColor: Colors.teal,
                        inactiveColor: Colors.teal[100],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
