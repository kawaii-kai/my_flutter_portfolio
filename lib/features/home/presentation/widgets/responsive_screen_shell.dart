import 'package:flutter/material.dart';
import 'package:my_portfolio/core/presentation/layout/cosmos_rive_background.dart';
import 'package:my_portfolio/core/utils/layout_helpers.dart';

typedef SlideBuilder = Widget Function(bool isMobile, double maxWidth);

class ResponsiveScreenShell extends StatefulWidget {
  final SlideBuilder? slide1Intro;
  final SlideBuilder? slide2Header;
  final List<SlideBuilder> slideBuilders; 

  final String? title;
  final List<Widget>? actions;
  final double maxWidth;

  const ResponsiveScreenShell({
    super.key,
    this.slide1Intro,
    this.slide2Header,
    required this.slideBuilders,
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

    // =========================================================================
    //? DYNAMIC SLIDE COUNT & ACCURATE INDICATOR CALCULATION
    // =========================================================================
    final int totalSlides = 2 + widget.slideBuilders.length;

    int getCalculatedSlide() {
      if (_scrollController.hasClients &&
          _scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 20) {
        return totalSlides;
      }

      if (_scrollOffset >= screenHeight * 1.8) {
        final double scrollBeyondSlide2 = _scrollOffset - (screenHeight * 1.8);
        final int dynamicSlide =
            3 + (scrollBeyondSlide2 / (screenHeight * 0.7)).floor();
        return dynamicSlide.clamp(3, totalSlides);
      } else if (_scrollOffset >= screenHeight * 0.6) {
        return 2;
      } else {
        return 1;
      }
    }

    final int currentSlide = getCalculatedSlide();

    // Timings
    final double zoomProgress = (_scrollOffset / (screenHeight * 2.0)).clamp(
      0.0,
      1.0,
    );
    final double imageScale = 1.0 + (zoomProgress * 0.25);

    final double slide1TextOpacity =
        (1.0 - (_scrollOffset / (screenHeight * 0.5))).clamp(0.0, 1.0);

    final double slide2Opacity =
        ((_scrollOffset - (screenHeight * 0.3)) / (screenHeight * 0.5)).clamp(
          0.0,
          1.0,
        );

    final double exitDistance = (_scrollOffset - screenHeight).clamp(
      0.0,
      screenHeight,
    );
    final double exitTopOffset = -exitDistance;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final effectiveMaxWidth = widget.maxWidth * 0.85;

        return Scaffold(
          backgroundColor: const Color(0xFF0D0E15),
          body: Stack(
            children: [
              // ---------------------------------------------------------------
              //? LAYER 1: FIXED COSMOS RIVE BACKGROUND
              // ---------------------------------------------------------------
              const Positioned.fill(child: CosmosRiveBackground()),

              // ---------------------------------------------------------------
              //? LAYER 2: MAGAZINE COVER HERO (SLIDES 1 & 2 FIXED OVERLAY)
              // ---------------------------------------------------------------
              Positioned(
                top: exitTopOffset,
                left: 0,
                right: 0,
                height: screenHeight,
                child: ClipRect(
                  child: Stack(
                    children: [
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
                              stops: const [0.0, 0.75, 1.0],
                            ).createShader(rect);
                          },
                          blendMode: BlendMode.dstIn,
                          //?------------BACKGROUND IMAGE------------//
                          child: Transform.scale(
                            scale: imageScale,
                            child: Image.asset(
                              'assets/background/dark_mode_profile.jpg',
                              fit: BoxFit.cover,
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ),
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

                      //! Execute Slide 1 Builder with parameters
                      if (widget.slide1Intro != null && slide1TextOpacity > 0.0)
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: isMobile ? 24 : 80,
                          child: SafeArea(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Opacity(
                                opacity: slide1TextOpacity,
                                child: widget.slide1Intro!(
                                  isMobile,
                                  effectiveMaxWidth,
                                ),
                              ),
                            ),
                          ),
                        ),

                      //! Execute Slide 2 Builder with parameters
                      if (widget.slide2Header != null && slide2Opacity > 0.0)
                        Positioned.fill(
                          child: SafeArea(
                            child: Center(
                              child: Opacity(
                                opacity: slide2Opacity,
                                child: widget.slide2Header!(
                                  isMobile,
                                  effectiveMaxWidth,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              // ---------------------------------------------------------------
              //? LAYER 3: MAIN CONTINUOUS SCROLL PIPELINE
              // ---------------------------------------------------------------
              SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    SizedBox(height: screenHeight * 2.0),

                    Center(
                      child: Container(
                        width: effectiveMaxWidth,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              const Color(0xFF6C5CE7),
                              Colors.white,
                              const Color(0xFF6C5CE7),
                              Colors.transparent,
                            ],
                            stops: const [0.0, 0.25, 0.5, 0.75, 1.0],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF6C5CE7).withOpacity(0.9),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // =========================================================
                    //? EXECUTE EACH SLIDE BUILDER WITH DYNAMIC PARAMS
                    // =========================================================
                    ...widget.slideBuilders.map((builder) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 30,
                        ),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: effectiveMaxWidth,
                            ),
                            child: builder(isMobile, effectiveMaxWidth),
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              // ---------------------------------------------------------------
              //? LAYER 4: DYNAMIC SIDE SCROLLBAR INDICATOR
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
                      children: List.generate(totalSlides, (index) {
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
