import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String posterUrl;
  final double rating;
  final bool watched;
  final bool isDark;
  final VoidCallback onToggleWatched;
  final VoidCallback onTap;

  const MovieCard({
    super.key,
    required this.title,
    required this.posterUrl,
    required this.rating,
    required this.watched,
    required this.onToggleWatched,
    required this.onTap,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),

        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF7F8CAA) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Row(
          children: [
            Hero(
              tag: posterUrl,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  posterUrl,
                  width: 100,
                  height: 140,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: isDark ? Colors.white : Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const SizedBox(width: 5),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    GestureDetector(
                      onTap: onToggleWatched,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: watched
                              ? const Color(0xFFB7D3D0)
                              : (isDark
                                    ? const Color(0xFF2E3047)
                                    : Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          watched ? "Watched ✔" : "Watch",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
