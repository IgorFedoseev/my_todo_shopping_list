import 'package:flutter/material.dart';
import 'package:my_to_do_shopping_list/domain/entity/product.dart';

class ProductFormWidget extends StatefulWidget {
  const ProductFormWidget({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ProductFormWidget> createState() => _ProductFormWidgetState();
}

class _ProductFormWidgetState extends State<ProductFormWidget> {
  late int _sliderValue;

  @override
  void initState() {
    super.initState();
    _sliderValue = widget.product.quantity;
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
                        initialValue: widget.product.name,
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
                        min: 1,
                        max: 12,
                        divisions: 11,
                        value: _sliderValue.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            _sliderValue = newValue.round();
                          });
                        },
                        activeColor: Colors.teal,
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
