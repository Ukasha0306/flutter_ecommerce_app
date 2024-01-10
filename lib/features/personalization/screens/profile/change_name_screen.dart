import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/features/personalization/controllers/update_name_controller.dart';
import 'package:flutter_ecommerce_app/utils/constants/text_strings.dart';
import 'package:flutter_ecommerce_app/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/sizes.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return  Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Change Name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Use real name for verification. This name will appear on several pages.',style: Theme.of(context).textTheme.labelMedium,),
            const SizedBox(height: TSizes.spaceBtwSections,),
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(children: [
              TextFormField(
                controller: controller.firstName,
                validator: (value)=>TValidator.validateEmptyText('First name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              TextFormField(
                controller: controller.lastName,
                validator: (value)=>TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ],),),
            const SizedBox(height: TSizes.spaceBtwSections,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
              onPressed: ()=>controller.updateUserName(),
              child: const Text('Save'),
            ),)
          ],
        ),
      ),

    );
  }
}
