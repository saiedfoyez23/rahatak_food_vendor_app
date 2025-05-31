import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:mime/mime.dart'; // Import the mime package
import 'package:rahatak_food_vendor_app/utils/app_color/app_colors.dart';
import 'package:rahatak_food_vendor_app/widget/custom_snackbar.dart';

import '../utils/assets_utils/color_utils.dart';

class ImageUploadController extends GetxController {
  var selectedImage = Rxn<PlatformFile>(); // Observable for the selected image
  var isLoading = false.obs; // Observable for loading state during upload

  // Method to pick an image (only PNG allowed)
  Future<void> pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false, // Only allow a single image
      );
      if (result != null && result.files.isNotEmpty) {
        PlatformFile file = result.files.first;
        // Use the mime package to get the actual MIME type of the file
        String? mimeType = lookupMimeType(file.path!);
        // Check if the MIME type is image/png
        if (mimeType == 'image/png') {
          selectedImage.value = file;
          print('PNG image selected: ${selectedImage.value!.name}');
        } else {
          selectedImage.value = null; // Clear selection if not PNG
          kSnackBar(
            message: 'Please select a PNG image only.'.tr,
            bgColor: AppColors.red,
          );
          print('Non-PNG image selected: ${file.name}, MIME type: $mimeType');
        }
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
      kSnackBar(message: 'Failed to pick image: $e'.tr, bgColor: AppColors.red);
    }
  }

  // Method to upload the image using multipart form-data with PNG MIME type
  Future<void> uploadImage() async {
    if (selectedImage.value == null) {
      kSnackBar(message: 'Please select a PNG image first.'.tr, bgColor: AppColors.red);
      return;
    }

    try {
      isLoading(true);

      // Prepare the multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.10.43:5010/api/v1/uploader/multiple'),
      );

      // Add the image file to the request with PNG MIME type
      request.files.add(
        await http.MultipartFile.fromPath(
          'images', // Field name for the image
          selectedImage.value!.path!,
          filename: selectedImage.value!.name,
        ),
      );

      // Send the request
      var response = await request.send();
      var responseBody = await http.Response.fromStream(response);

      // Check the response
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Image uploaded successfully: ${responseBody.body}');
        kSnackBar(message: 'Image uploaded successfully!'.tr, bgColor: Colors.green);
        selectedImage.value = null; // Clear the selected image after successful upload
      } else {
        print('Failed to upload image: ${response.statusCode}, ${responseBody.body}');
        kSnackBar(
          message: 'Failed to upload image: ${response.statusCode}'.tr,
          bgColor: AppColors.red,
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
      kSnackBar(message: 'Error uploading image: $e'.tr, bgColor: AppColors.red);
    } finally {
      isLoading(false);
    }
  }
}

class ImageUploadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageUploadController controller = Get.put(ImageUploadController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Upload Product Image".tr,
          style: GoogleFonts.tajawal(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        backgroundColor: ColorUtils.white255,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image preview area
            Obx(() => Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: ColorUtils.gray163, width: 1),
                borderRadius: BorderRadius.circular(12),
                color: ColorUtils.white217,
              ),
              child: controller.selectedImage.value == null
                  ? Center(
                child: Text(
                  "No PNG image selected".tr,
                  style: GoogleFonts.tajawal(
                    fontSize: 16,
                    color: ColorUtils.gray136,
                  ),
                ),
              )
                  : Image.file(
                File(controller.selectedImage.value!.path!),
                fit: BoxFit.cover,
              ),
            )),
            const SizedBox(height: 20),
            // Button to pick an image
            ElevatedButton(
              onPressed: () => controller.pickImage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtils.blue192,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Pick PNG Image".tr,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: ColorUtils.white255,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button to upload the image
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value ? null : () => controller.uploadImage(),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorUtils.blue192,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(
                color: ColorUtils.white255,
                strokeWidth: 2.0,
              )
                  : Text(
                "Upload Image".tr,
                style: GoogleFonts.tajawal(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: ColorUtils.white255,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}