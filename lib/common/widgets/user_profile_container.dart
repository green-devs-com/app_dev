import 'package:flutter/material.dart';

class UserProfileContainer extends StatefulWidget {
  final String? userType;
  final bool showFlag;
  final double? imageSize;

  const UserProfileContainer({
    super.key,
    this.userType = "0",
    this.showFlag = false,
    this.imageSize,
  });

  @override
  State<UserProfileContainer> createState() => _UserProfileContainerState();
}

class _UserProfileContainerState extends State<UserProfileContainer>
    with AutomaticKeepAliveClientMixin {
  void showProfileImage() {
    // Navigator.pushNamed(
    //     context,
    //     Routes.profile,
    //     arguments: {"uid": widget.user?.uid ?? ""},
    //   );
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        ClipOval(
          child: ClipOval(
            child: Image.asset(
              "assets/images/profile_image.png",
              width: widget.imageSize ?? 42,
              height: widget.imageSize ?? 42,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // if (widget.showFlag)
        //   Positioned(
        //     left: 0,
        //     bottom: 0,
        //     child: showUserFlag(
        //       context,
        //       widget.user?.country ?? "",
        //       flagSize: widget.flagSize,
        //     ),
        //   ),
      ],
    );
  }
}
