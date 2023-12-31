import 'package:flutter/material.dart';

import '../detail_book_controller.dart';

class DetailText extends StatelessWidget {
  const DetailText({
    super.key,
    required this.controller,
  });

  final DetailBookController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Text(
            controller.book.title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'ISBN',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.isbn!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.id!.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Title',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.title!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Subtitle',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.subtitle!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Author',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.author!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Published',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: "${controller.book.published!}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Publisher',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.publisher!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Pages',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: "${controller.book.pages!}",
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.description!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                const TextSpan(
                    text: 'Website',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                const TextSpan(
                    text: ': ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(
                  text: controller.book.website!,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
