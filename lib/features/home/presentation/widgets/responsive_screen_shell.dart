import 'package:flutter/material.dart';
import 'package:my_portfolio/config/theme/string_manager.dart';
import 'package:my_portfolio/core/presentation/layout/cosmos_rive_background.dart';
import 'package:my_portfolio/features/home/presentation/widgets/section_badge_tag.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_experience_card.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_intro_badge.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_projects_education_badge.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_skills_card.dart';
import 'package:my_portfolio/core/utils/layout_helpers.dart';
import 'package:my_portfolio/features/home/presentation/pages/home_hero_header.dart';

class ResponsiveScreenShell extends StatefulWidget {
  final List<Widget>? children;
  final Widget? mobile;
  final Widget? desktop;

  final String? title;
  final List<Widget>? actions;
  final double maxWidth;

  const ResponsiveScreenShell({
    super.key,
    this.children,
    this.mobile,
    this.desktop,
    this.title,
    this.actions,
    this.maxWidth = 1200,
  });

  @override
  State<ResponsiveScreenShell> createState() => _ResponsiveScreenShellState();
}

class _ResponsiveScreenShellState extends State<ResponsiveScreenShell> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    //? Fixed scroll math so slide count accurately reaches 6 at the absolute bottom
    final maxScroll = _scrollController.hasClients
        ? _scrollController.position.maxScrollExtent
        : 1.0;
    final progress = maxScroll > 0
        ? (_scrollOffset / maxScroll).clamp(0.0, 1.0)
        : 0.0;
    final int currentSlide = ((progress * 5).round() + 1).clamp(1, 6);

    // =========================================================================
    //? SCROLL MILESTONES & TRANSITION TIMINGS
    // =========================================================================
    final double step1ZoomEnd = screenHeight * 1.0;
    final double step2HeaderEnd = screenHeight * 2.0;

    //! 1. HERO IMAGE ZOOM (SLIDE 1)
    final double zoomProgress = (_scrollOffset / step1ZoomEnd).clamp(0.0, 1.0);
    final double imageScale = 1.0 + (zoomProgress * 0.18);

    //! 2. SLIDE 1 INTRO FADE
    final double slide1TextOpacity =
        (1.0 - (_scrollOffset / (screenHeight * 0.6))).clamp(0.0, 1.0);

    //! 3. ACCELERATED UPWARD EXIT FOR SLIDE 2
    final double slide2FadeIn =
        ((_scrollOffset - (screenHeight * 0.3)) / (screenHeight * 0.5)).clamp(
          0.0,
          1.0,
        );
    final double slide2FadeOut =
        (1.0 - ((_scrollOffset - (screenHeight * 1.1)) / (screenHeight * 0.6)))
            .clamp(0.0, 1.0);
    final double slide2Opacity = _scrollOffset < (screenHeight * 1.1)
        ? slide2FadeIn
        : slide2FadeOut;

    final double slide2ExitProgress =
        ((_scrollOffset - (screenHeight * 0.9)) / (screenHeight * 0.8)).clamp(
          0.0,
          1.0,
        );
    final double slide2UpwardOffsetY =
        -slide2ExitProgress * (screenHeight * 1.3);

    //! 4. HERO IMAGE VERTICAL EXIT
    final double exitDistance = (_scrollOffset - step2HeaderEnd).clamp(
      0.0,
      screenHeight,
    );
    final double exitTopOffset = -exitDistance * 0.5;
    final double exitOpacity = (1.0 - (exitDistance / (screenHeight * 0.7)))
        .clamp(0.0, 1.0);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;

        return Scaffold(
          backgroundColor: const Color(0xFF0D0E15),
          body: Stack(
            children: [
              // ---------------------------------------------------------------
              //? LAYER 1: FIXED COSMOS RIVE BACKGROUND
              // ---------------------------------------------------------------
              const Positioned.fill(child: CosmosRiveBackground()),

              // ---------------------------------------------------------------
              //? LAYER 2: HERO PROFILE IMAGE & OVERLAY HEADERS (SLIDES 1 & 2)
              // ---------------------------------------------------------------
              if (exitOpacity > 0.0)
                Positioned(
                  top: exitTopOffset,
                  left: 0,
                  right: 0,
                  height: screenHeight,
                  child: Opacity(
                    opacity: exitOpacity,
                    child: ClipRect(
                      child: Stack(
                        children: [
                          //! Profile Image
                          Positioned.fill(
                            child: ShaderMask(
                              shaderCallback: (rect) {
                                return LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(0.85),
                                    Colors.transparent,
                                  ],
                                  stops: const [0.0, 0.7, 1.0],
                                ).createShader(rect);
                              },
                              blendMode: BlendMode.dstIn,
                              child: Transform.scale(
                                scale: imageScale,
                                child: Image.asset(
                                  'assets/images/profile.png',
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ),

                          // Contrast Overlay Vignette
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.black.withOpacity(0.65),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),

                          //! Slide 1 Intro Badge Overlay
                          if (slide1TextOpacity > 0.0)
                            Positioned(
                              top: 0,
                              bottom: 0,
                              left: isMobile ? 24 : 80,
                              child: SafeArea(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Opacity(
                                    opacity: slide1TextOpacity,
                                    child: HomeIntroBadge(isMobile: isMobile),
                                  ),
                                ),
                              ),
                            ),

                          //! Slide 2 Header Overlay (Exits Upward)
                          if (slide2Opacity > 0.0)
                            Positioned.fill(
                              child: SafeArea(
                                child: Transform.translate(
                                  offset: Offset(0.0, slide2UpwardOffsetY),
                                  child: Opacity(
                                    opacity: slide2Opacity,
                                    child: const HomeHeroHeader(),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),

              // ---------------------------------------------------------------
              //? LAYER 3: MAIN SCROLL VIEW (SLIDES 3–6)
              // ---------------------------------------------------------------
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(height: step2HeaderEnd),

                    // =========================================================
                    //? SLIDE 3: TECHNICAL SKILLS & EXPERTISE
                    // =========================================================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Center(
                        child: HomeSkillsCard(
                          isMobile: isMobile,
                          maxWidth: widget.maxWidth * 0.85,
                        ),
                      ),
                    ),

                    // =========================================================
                    //? SLIDE 4: WORK EXPERIENCE (PSBank, Quantrics, Trent)
                    // =========================================================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Center(
                        child: HomeExperienceCard(
                          isMobile: isMobile,
                          maxWidth: widget.maxWidth * 0.85,
                        ),
                      ),
                    ),

                    // =========================================================
                    //? SLIDE 5: FEATURED PROJECTS, EDUCATION & CERTIFICATIONS
                    // =========================================================
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 40,
                      ),
                      child: Center(
                        child: HomeProjectsEducationBadge(
                          isMobile: isMobile,
                          maxWidth: widget.maxWidth * 0.85,
                        ),
                      ),
                    ),

                    // =========================================================
                    //? SLIDE 6: CUSTOM PORTFOLIO & BODY WIDGET
                    // =========================================================
                    SizedBox(
                      height: screenHeight,
                      width: double.infinity,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          SafeArea(
                            child: SectionBadgeTag(AppStrings.slide8Badge),
                          ),
                          Expanded(
                            child: Center(
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 20,
                                  ),
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxWidth: widget.maxWidth,
                                    ),
                                    child: LayoutHelpers.resolveBodyLayout(
                                      width: width,
                                      mobile: widget.mobile,
                                      desktop: widget.desktop,
                                      children: widget.children,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ---------------------------------------------------------------
              //? LAYER 4: SIDE SCROLLBAR INDICATOR (6 SLIDES)
              // ---------------------------------------------------------------
              Positioned(
                right: 16,
                top: 0,
                bottom: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withOpacity(0.15)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(6, (index) {
                        final slideNum = index + 1;
                        final isActive = currentSlide == slideNum;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 250),
                                width: isActive ? 10 : 6,
                                height: isActive ? 20 : 6,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? const Color(0xFF6C5CE7)
                                      : Colors.white38,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '$slideNum',
                                style: TextStyle(
                                  color: isActive
                                      ? Colors.white
                                      : Colors.white38,
                                  fontSize: 11,
                                  fontWeight: isActive
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),

          drawer: isMobile && widget.actions != null
              ? Drawer(
                  backgroundColor: const Color(0xFF141622),
                  child: SafeArea(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      children:
                          LayoutHelpers.styleActions(widget.actions) ?? [],
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }
}
