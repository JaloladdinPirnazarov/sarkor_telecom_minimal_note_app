import 'dart:io';

import '../../../utils/importer.dart';

class MyImagePicker extends StatelessWidget {
  final String imagePath;
  final Function() onTapAdd;
  final Function() onTapDelete;

  const MyImagePicker({
    super.key,
    required this.imagePath,
    required this.onTapAdd,
    required this.onTapDelete,
  });

  @override
  Widget build(BuildContext context) {
    return imagePath.isEmpty
        ? DottedBorder(
            borderType: BorderType.RRect,
            color: Theme.of(context).colorScheme.inversePrimary,
            strokeWidth: 3,
            dashPattern: const [16, 6],
            child: SizedBox(
              height: 240,
              child: Center(
                  child: MyIconButton(
                onTap: onTapAdd,
                iconPath: AppIcons.addPhotoIcon,
                size: 100,
              )),
            ))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.file(
                      File(imagePath),
                      height: 240,
                    ),
                  ),
                  Positioned(
                      top: -12,
                      right: -12,
                      child: IconButton(
                          onPressed: onTapDelete,
                          icon: Icon(
                            size: 30,
                            Icons.cancel_outlined,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      '${textShorter(basenameWithoutExtension(imagePath), 26)} ${extension(imagePath)}')
                ],
              ),
            ],
          );
  }
}
