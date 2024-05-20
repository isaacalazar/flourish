import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flourish/core/utils/image_picker.dart';
import 'package:flourish/features/budget/presentation/widgets/budget_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CreateBudgetPage extends StatefulWidget {
  const CreateBudgetPage({super.key});

  @override
  State<CreateBudgetPage> createState() => _CreateBudgetPageState();
}

class _CreateBudgetPageState extends State<CreateBudgetPage> {
  final TextEditingController budgetNameController = TextEditingController();
  final TextEditingController budgetGoalController = TextEditingController();

  File? image;

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      print("NOT NULL");
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    budgetNameController.dispose();
    budgetGoalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Budget",
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Gap(35),
            GestureDetector(
              onTap: () {
                selectImage();
              },
              child: image != null
                  ? GestureDetector(
                      onTap: () {
                        selectImage();
                      },
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                  : DottedBorder(
                      radius: const Radius.circular(10),
                      borderType: BorderType.RRect,
                      strokeCap: StrokeCap.round,
                      child: const SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera, size: 30),
                            Gap(10),
                            Text("Insert goal image")
                          ],
                        ),
                      ),
                    ),
            ),
            const Gap(30),
            BudgetFieldText(
              controller: budgetNameController,
              hintText: "Insert the name of your goal!",
            ),
          ],
        ),
      ),
    );
  }
}
