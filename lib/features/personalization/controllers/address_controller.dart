import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/address/add_new_address.dart';
import 'package:flutter_ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter_ecommerce_app/utils/helpers/cloud_helper_function.dart';
import 'package:flutter_ecommerce_app/utils/popups/loaders.dart';
import 'package:get/get.dart';
import '../../../data/repositories/address/address_repository.dart';
import '../../../utils/connectivity/network_manager.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();

  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;

  Rx<AddressModel> selectedAddress = AddressModel.empty().obs;

  final addressRepository = Get.put(AddressRepository());

  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: false,
          backgroundColor: Colors.transparent,
          content: const CircularProgressIndicator(
            color: Colors.white,
          ));

      // clear the selected Address

      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(selectedAddress.value.id, false);
      }

      //  Assign the selected Address

      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the 'selected' field to true for the newly selected address

      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
      Get.back();
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  Future addNewAddresses() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.docerAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (addressFormKey.currentState != null &&
          addressFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
      }

      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      // update the selected address status

      address.id = id;
      await selectAddress(address);

      // remove the loader

      TFullScreenLoader.stopLoading();

      // show the Success Message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully');

      // Refresh address data

      refreshData.toggle();

      // reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  // show address ModalBottomSheet at Checkout

  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Address', showActionButton: false,),
              const SizedBox(height: TSizes.spaceBtwSections,),
              FutureBuilder(
                future: getAllUserAddresses(),
                builder: (_, snapshot) {
                  final response = TCloudHelperFunctions.checkMultipleRecordState(snapshot: snapshot);
                  if (response != null) return response;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => TSingleAddress(
                      address: snapshot.data![index],
                      onTap: () async {
                        await selectAddress(snapshot.data![index]);
                        Get.back();
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: TSizes.defaultSpace * 2,),
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>Get.to(()=>const AddNewAddressScreen()), child: const Text('Add new Address')),)
            ],
          ),
        ),
      ),
    );
  }

  //  function to reset the form fields

  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    city.clear();
    postalCode.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }

  @override
  String toString(){
    return '$street, $city, $state, $postalCode, $country';

  }


}
