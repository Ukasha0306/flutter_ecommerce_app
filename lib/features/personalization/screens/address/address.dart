import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/appBar/app_bar.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/color.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/address_controller.dart';
import 'add_new_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: ()=>Get.to(()=>const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white,),),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(()=> FutureBuilder(
              // use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
              future: controller.getAllUserAddresses(),
              builder: (context, snapshot) {

                final response = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot);
                if(response != null) return response;

                final addresses = snapshot.data!;

                return ListView.builder(
                  itemCount:addresses.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index)=> TSingleAddress(address: addresses[index],onTap:()=> controller.selectAddress(addresses[index]),),
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
