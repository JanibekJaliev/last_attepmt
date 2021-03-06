import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  final String? title;
  final String? imageUrl;
  const UserProductItem({Key? key, this.title, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title!),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl!),
      ),
      trailing: Container(
        width: 100.0,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Theme.of(
                context,
              ).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
