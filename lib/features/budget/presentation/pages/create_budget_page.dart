import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flourish/core/routes/app_router.dart';
import 'package:flourish/core/utils/image_picker.dart';
import 'package:flourish/features/budget/presentation/bloc/budget_bloc.dart';
import 'package:flourish/features/budget/presentation/widgets/budget_field_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final TextEditingController budgetAmountController = TextEditingController();

  File? image;
  final formKey = GlobalKey<FormState>();

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    budgetNameController.dispose();
    budgetGoalController.dispose();
    budgetAmountController.dispose();
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
        actions: [
          IconButton(
            icon: Icon(Icons.send, size: 30),
            onPressed: () {
              if (formKey.currentState!.validate() && image != null) {
                context.read<BudgetBloc>().add(
                      BudgetUpload(
                        budgetNameController.text.trim(),
                        int.parse(budgetAmountController.text.trim()),
                        int.parse(budgetGoalController.text.trim()),
                        image!,
                      ),
                    );
              }
            },
          )
        ],
      ),
      body: BlocConsumer<BudgetBloc, BudgetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is BudgetLoading) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is BudgetSuccess) {
            AutoRouter.of(context).push(HomeRoute());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
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
                                height: 200,
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
                    const Gap(25),
                    BudgetFieldText(
                      controller: budgetNameController,
                      hintText: "Insert the name of your goal!",
                    ),
                    const Gap(30),
                    BudgetFieldText(
                      controller: budgetGoalController,
                      hintText: "Insert the amount needed for your goal!",
                      isInteger: true,
                    ),
                    const Gap(30),
                    BudgetFieldText(
                      controller: budgetAmountController,
                      hintText: "Insert your starting amount!",
                      isInteger: true,
                    ),
                    const Gap(30)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
