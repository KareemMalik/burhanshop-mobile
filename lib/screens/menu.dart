import 'package:flutter/material.dart';
import 'package:burhanshop/widgets/left_drawer.dart';
import 'package:burhanshop/widgets/product_card.dart';
import 'package:burhanshop/widgets/gradient_background.dart';
import 'package:burhanshop/theme/app_colors.dart';

const String _brandLogoUrl =
    'https://i.gyazo.com/5eee0d5d04d129914d0cecb593bbc9fa.png';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String nama = "Malik Alifan Kareem";
  final String npm = "2406348710";
  final String kelas = "PBP-B";
  final List<ItemHomepage> items = [
    ItemHomepage("See All Products", Icons.shop_2_outlined),
    ItemHomepage("Add Product", Icons.add_business_sharp),
    ItemHomepage("Logout", Icons.logout),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardsPerRow = screenWidth < 600 ? 2 : 3;
    final double actionWidth =
        ((screenWidth - ((cardsPerRow + 1) * 16)) / cardsPerRow)
            .clamp(140, 220)
            .toDouble();

    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: const LeftDrawer(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(96),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: true,
            toolbarHeight: 96,
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: AppColors.backgroundStart),
            titleSpacing: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            flexibleSpace: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(32)),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Color(0xFFEFF2FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  _BrandLogoBadge(
                    size: 56,
                    borderRadius: 18,
                    padding: const EdgeInsets.all(8),
                    background: Colors.white,
                    fallbackIconColor: AppColors.backgroundStart,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Burhan Shop',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                color: AppColors.backgroundStart,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tempatnya merchandise bola kece & orisinal.',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: AppColors.backgroundStart
                                    .withOpacity(0.7),
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: GradientBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.surface,
                        AppColors.surfaceHighlight,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(0, 12),
                        blurRadius: 32,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const _BrandLogoBadge(
                            size: 56,
                            borderRadius: 18,
                            padding: EdgeInsets.all(4),
                            background: Colors.transparent,
                            fallbackIconColor: Colors.white,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nama,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Selamat datang kembali!',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: AppColors.subtleText),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                npm,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                kelas,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.subtleText),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Row(
                        children: [
                          Expanded(child: InfoCard(title: 'NPM', content: npm)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: InfoCard(title: 'Name', content: nama)),
                          const SizedBox(width: 12),
                          Expanded(
                              child: InfoCard(title: 'Class', content: kelas)),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Aksi Cepat',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: items
                            .map(
                              (item) => SizedBox(
                                width: actionWidth,
                                child: ItemCard(item),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.subtleText,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

class _BrandLogoBadge extends StatelessWidget {
  final double size;
  final double borderRadius;
  final EdgeInsets padding;
  final Color background;
  final Color fallbackIconColor;

  const _BrandLogoBadge({
    this.size = 48,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.all(6),
    this.background = Colors.transparent,
    this.fallbackIconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final double innerRadius =
        (borderRadius - padding.horizontal / 2).clamp(0, borderRadius);
    return Container(
      width: size,
      height: size,
      padding: padding,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(borderRadius),
        border: background == Colors.transparent
            ? Border.all(color: Colors.white.withOpacity(0.08))
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(innerRadius),
        child: Image.network(
          _brandLogoUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(
            Icons.storefront,
            color: fallbackIconColor,
            size: size / 1.8,
          ),
        ),
      ),
    );
  }
}
