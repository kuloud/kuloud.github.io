import 'package:flutter/material.dart';
import 'package:homepage/apis/thirtparty/github/github_models.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({super.key, required this.repository});

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    final previewImageUrl =
        'https://picsum.photos/seed/${repository.id}/300/200';
    return AspectRatio(
      aspectRatio: 1.5,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          onTap: () {
            //
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      repository.name ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      repository.createdAt?.toIso8601String() ?? '',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
