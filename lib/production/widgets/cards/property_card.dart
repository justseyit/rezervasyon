import 'package:flutter/material.dart';

import 'package:rezervasyon/models/property.dart';

class PropertyCard extends StatelessWidget {
  final AppProperty item;
  const PropertyCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title ?? ""),
      leading: item.profilePhotoUrl == null
          ? null
          : CircleAvatar(
              backgroundImage: NetworkImage(item.profilePhotoUrl!),
              radius: 30,
            ),
      subtitle: Text(item.description ?? ""),
      isThreeLine: true,
      visualDensity: VisualDensity.comfortable,
      minVerticalPadding: 22,
      onTap: () {},
    );
  }
}
