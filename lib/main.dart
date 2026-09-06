import 'package:flutter/material.dart';

void main() {
  runApp(const PortfolioApp());
}

const Color primaryBlue = Color(0xFF4355B8);
const Color lightBlue = Color(0xFFE9ECFA);

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anirudh | Portfolio',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryBlue),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/projects': (_) => const ProjectsPage(),
      },
    );
  }
}

class TopBar extends StatelessWidget {
  final String title;
  final bool showBack;

  const TopBar({
    super.key,
    required this.title,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: primaryBlue,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (showBack)
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              tooltip: 'Back',
            )
          else
            const SizedBox(width: 48),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

class PageButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PageButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 46,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: TopBar(title: 'My Portfolio'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 600;

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: compact ? 24 : 60,
                  vertical: compact ? 45 : 70,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 850),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: compact ? 68 : 78,
                        backgroundColor: const Color(0xFFE8D9FF),
                        child: Icon(
                          Icons.person,
                          size: compact ? 70 : 82,
                          color: primaryBlue,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'JALA ANIRUDH SAI',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: const Color(0xFF304494),
                          fontSize: compact ? 22 : 31,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'B.Tech 3rd Year • Computer Science Student',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: compact ? 16 : 18,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 14,
                        runSpacing: 12,
                        children: [
                          PageButton(
                            text: 'About Me',
                            onPressed: () =>
                                Navigator.pushNamed(context, '/about'),
                          ),
                          PageButton(
                            text: 'Projects',
                            onPressed: () =>
                                Navigator.pushNamed(context, '/projects'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: TopBar(title: 'About Me', showBack: true),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 650;

            return SingleChildScrollView(
              padding: EdgeInsets.all(compact ? 18 : 34),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    children: [
                      _AboutCard(compact: compact),
                      const SizedBox(height: 22),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 12,
                        runSpacing: 12,
                        children: const [
                          SkillChip(label: 'Flutter'),
                          SkillChip(label: 'Dart'),
                          SkillChip(label: 'Python'),
                          SkillChip(label: 'Java'),
                          SkillChip(label: 'UI Design'),
                          SkillChip(label: 'Problem Solving'),
                        ],
                      ),
                      const SizedBox(height: 28),
                      PageButton(
                        text: 'View Projects',
                        onPressed: () =>
                            Navigator.pushNamed(context, '/projects'),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  final bool compact;

  const _AboutCard({required this.compact});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.black26,
      color: lightBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: EdgeInsets.all(compact ? 24 : 38),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 28,
              backgroundColor: primaryBlue,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            const SizedBox(height: 22),
            Text(
              'Hello! I’m JALA ANIRUDH SAI, a passionate Computer Science student.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: compact ? 18 : 21,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF30343B),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'I enjoy exploring modern technologies and building creative digital projects that solve real-world problems. My interests include app development, programming, user interface design and learning new technologies.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: compact ? 15 : 17,
                height: 1.55,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Skills & Areas of Expertise',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF304494),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(Icons.check_circle, size: 18, color: primaryBlue),
      label: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      backgroundColor: const Color(0xFFF0F2FF),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    );
  }
}

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: TopBar(title: 'My Projects', showBack: true),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 700;

            return SingleChildScrollView(
              padding: EdgeInsets.all(compact ? 16 : 30),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1150),
                  child: Column(
                    children: [
                      ProjectCard(
                        icon: Icons.video_library,
                        title: 'Content Moderation System',
                        description:
                            'A Python-based intelligent tool for video content filtering and analysis.',
                        tags: const ['Python', 'AI', 'Video Analysis'],
                      ),
                      const SizedBox(height: 18),
                      ProjectCard(
                        icon: Icons.cloud,
                        title: 'Weather Forecast App',
                        description:
                            'A dynamic application that displays real-time weather information with a clean and responsive interface.',
                        tags: const ['Flutter', 'API', 'Dart'],
                      ),
                      const SizedBox(height: 28),
                      PageButton(
                        text: 'Back to Home',
                        onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/',
                          (route) => false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final List<String> tags;

  const ProjectCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: primaryBlue, size: 28),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF304494),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 7,
                    runSpacing: 7,
                    children: tags
                        .map(
                          (tag) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F2FF),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              tag,
                              style: const TextStyle(
                                color: Color(0xFF304494),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
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
    );
  }
}
