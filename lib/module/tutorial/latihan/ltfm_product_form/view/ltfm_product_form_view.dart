import 'package:flutter/material.dart';
import 'package:example/core.dart';

class LtfmProductFormView extends StatefulWidget {
  const LtfmProductFormView({Key? key}) : super(key: key);

  Widget build(context, LtfmProductFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("LtfmProductForm"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton.icon(
              onPressed: () {
                controller.save();
                controller.setState(() {});
              },
              icon: const Icon(
                Icons.save,
                size: 24.0,
              ),
              label: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ),
          )
          //! 5. Tambahkan tombol Save
          //! 6. Beri padding/margin pada tombol Save sebanyak 10
          //! 7. Panggil controller.save() ketika tombol di klik
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      QTextField(
                        label: "Product Name",
                        hint: "Product Name",
                        validator: Validator.required,
                        value: "John Doe",
                        onChanged: (value) {},
                      ),
                      QTextField(
                        label: "Price",
                        hint: "Price",
                        validator: Validator.number,
                        onChanged: (value) {},
                      ),
                      QTextField(
                        label: "Description",
                        hint: "Description",
                        validator: Validator.required,
                        value: "",
                        onChanged: (value) {},
                        maxLength: 15,
                      ),
                      QDropdownField(
                        label: "Category",
                        hint: "Your product category",
                        validator: Validator.required,
                        items: const [
                          {
                            "label": "Food",
                            "value": 1,
                          },
                          {
                            "label": "Drink",
                            "value": 2,
                          },
                          {
                            "label": "Main Course",
                            "value": 3,
                          }
                        ],
                        onChanged: (value, label) {},
                      ),

                      //! 5. Tambahkan radio untuk menentukan status product, gunakan kode ini:

                      QRadioField(
                        label: "Status",
                        validator: Validator.atLeastOneitem,
                        items: const [
                          {
                            "label": "Published",
                            "value": "published",
                          },
                          {
                            "label": "Draft",
                            "value": "draft",
                          }
                        ],
                        onChanged: (value, label) {},
                      ),
                    ],
                  ),
                ),
              )
              //! 1. Buat sebuah Card, tambahkan Column di dalamnya
              //! 2. Tambahkan padding.all 20.0
              //! 3. Di dalam column yang ada di dalam Card, tambahkan field ini:
              //? textfield product name
              //? textfield price (hanya bisa menerima angka)
              //? textfield description (textfield dengan maxlines: 15)
              //! 4. Tambahkan dropdown untuk memilih category, gunakan kode ini:
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LtfmProductFormView> createState() => LtfmProductFormController();
}
