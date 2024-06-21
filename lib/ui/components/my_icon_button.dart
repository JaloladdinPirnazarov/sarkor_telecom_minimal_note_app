import '../../utils/importer.dart';

class MyIconButton extends StatelessWidget {
  final String iconPath;
  final Function()? onTap;
  final double? size;
  final String? text;

  const MyIconButton({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.size,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return text == null
        ? IconButton(
            onPressed: onTap,
            icon: SvgPicture.asset(
              iconPath,
              width: size,
              height: size,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.inversePrimary,
                  BlendMode.srcIn),
            ))
        : InkWell(
      onTap: onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: size,
                  height: size,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).colorScheme.inversePrimary,
                      BlendMode.srcIn),
                ),
                Text(
                  text!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                )
              ],
            ),
          );
  }
}
