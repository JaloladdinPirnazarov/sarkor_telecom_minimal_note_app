import '../../../utils/importer.dart';

class ImagePickOptions extends StatelessWidget {
  final Function() onTapGallery;
  final Function() onTapCamera;

  const ImagePickOptions(
      {super.key, required this.onTapCamera, required this.onTapGallery});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 8,
        child: Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyIconButton(
                  iconPath: AppIcons.galleryIcon,
                  text: 'Gallery',
                  size: 60,
                  onTap: () {
                    Navigator.pop(context);
                    onTapGallery();
                  },
                ),
                MyIconButton(
                  iconPath: AppIcons.cameraIcon,
                  text: 'Camera',
                  size: 60,
                  onTap: () {
                    Navigator.of(context).pop();
                    onTapCamera();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
