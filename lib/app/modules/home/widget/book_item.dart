// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../data/models/book_model.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    Key? key,
    required this.onTap,
    required this.onEdit,
    required this.size,
    required this.book,
  }) : super(key: key);

  final VoidCallback onTap;
  final VoidCallback onEdit;
  final double size;
  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://picsum.photos/1000",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            color: Colors.black26,
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: onTap,
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: IconButton(
              onPressed: onEdit,
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).cardColor.withOpacity(0.6),
                child: const Icon(
                  Icons.edit,
                  size: 14.0,
                  color: AppColor.color3,
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  color: Colors.black54,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "by: ${book.author}",
                        style: const TextStyle(
                          color: AppColor.color2,
                          fontSize: 10.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
