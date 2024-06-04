import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/add_product_service.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_button.dart';
import 'package:store_app/widgets/custom_text_field.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  static const String id = 'updateScreen';

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  String? productName, description, image;

  String? price;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Update Product',
              style: TextStyle(
                color: Colors.black,
              )),
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                CustomTextField(
                  onChanged: (value) {
                    productName = value;
                  },
                  obsecureText: false,
                  hintText: 'Product Name',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (value) {
                    description = value;
                  },
                  obsecureText: false,
                  hintText: 'Description',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    price = value;
                  },
                  obsecureText: false,
                  hintText: 'Price',
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (value) {
                    image = value;
                  },
                  obsecureText: false,
                  hintText: 'Image',
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  text: 'Update',
                  onTap: () async {
                    isLoading = true;
                    setState(() {});
                    await updateProductFuc(product);
                    try {
                      showTopSnackBar(
                        Overlay.of(context),
                        const CustomSnackBar.info(
                          message: 'Product Updated',
                          backgroundColor: Colors.green,
                          icon: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      );
                    } catch (e) {
                      // TODO
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProductFuc(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id.toString(),
      title: productName == null ? product.title : productName!,
      description: description == null ? product.description : description!,
      image: image == null ? product.image : image!,
      price: price == null ? product.price.toString() : price!,
      category: product.category,
    );
  }
}

// this fuction for post product
//   Future<void> updateProductFuc(ProductModel product) async {
//     await AddProduct().addProduct(
//       title: productName == null ? product.title : productName!,
//       description: description == null ? product.description : description!,
//       image: image == null ? product.image : image!,
//       price: price == null ? product.price.toString() : price!,
//       category: product.category,
//     );
//   }
// }
