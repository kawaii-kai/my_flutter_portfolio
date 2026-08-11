abstract class AppStrings {
  // Navigation & Badges
  static const String introBody =
      'Scroll down to explore my journey, tech stack, and experience.';
  static const String slide1Badge = 'SLIDE 1 • INTRO';
  static const String slide3Badge = 'SLIDE 2 • SUMMARY';
  static const String slide4Badge = 'SLIDE 4 • TECHNICAL SKILLS';
  static const String slide5Badge = 'SLIDE 5 • WORK EXPERIENCE';
  static const String slide6Badge = 'SLIDE 6 • FEATURED PROJECTS';
  static const String slide7Badge = 'SLIDE 7 • EDUCATION & CERTIFICATIONS';
  static const String slide8Badge = 'SLIDE 8 • SOCIAL LINKS & CONTACT';
  static const String combinedExperienceBadge =
      'SLIDES 3–5 • CAREER & EXPERTISE SUMMARY';

  // Personal Header Information
  static const String fullName = 'KYLA BALIAO';
  static const String jobTitle =
      'Flutter Developer & Mobile Engineer | Android • iOS';
  static const String email = 'baliaokyla0209@gmail.com';
  static const String phone = '+63 9493904830';
  static const String linkedin = 'linkedin.com/in/kyla-baliao-193bab262';
  static const String location = 'Makati, Philippines';

  // Slide 2 Hero Extras
  static const String heroGreeting = "Hi, I'm Kyla Baliao 👋";
  static const String heroSubtitle =
      "Mobile Application Developer specializing in Flutter, Banking Security, and Cross-Platform Apps.";
  static const String recentRoleProofBadge = "RECENT EXPERIENCE & PROOF";
  static const String recentRoleProofTitle =
      "System Analyst — Flutter Developer @ PSBank";
  static const String recentRoleProofDesc =
      "Engineered production-grade mobile banking features serving retail customers. Led Kotlin DSL Gradle migrations, 10+ REST API integrations, and runtime Frida security testing.";
  static const String btnDownloadCv = "Download CV";
  static const String btnContactMe = "Contact Me";

  // Professional Summary
  static const String summaryTitle = 'Professional Summary';
  static const String summaryParagraph1 =
      'Mobile Developer with 3+ years of experience building and maintaining production-grade cross-platform mobile applications for Android and iOS within a regulated banking environment. Proficient in Dart/Flutter, Kotlin, MVVM and BLoC architecture, and RESTful API integration. Experienced in full-cycle mobile development, including UI implementation, API integration, build configuration, dependency management, performance optimization, and application security enhancements.';
  static const String summaryParagraph2 =
      'Hands-on experience delivering enterprise mobile solutions, resolving complex production issues, improving application stability, and ensuring reliable releases under tight deadlines. Experienced in application analysis, troubleshooting, and security-related improvements, including Frida detection implementation and debugging techniques. Proven ability to reduce technical challenges, improve development workflows, and contribute to high-quality production releases.';

  // Technical Skills
  static const String skillsTitle = 'Technical Skills';
  static const String skillMobileDev =
      'Flutter, Dart, Kotlin, Java, Swift, Android SDK, iOS SDK, cross-platform development';
  static const String skillFlutter =
      'BLoC, MVVM, Clean Architecture, Responsive UI, Reusable Widgets, Navigation, Flutter Flavors, Plugin Integration';
  static const String skillApiBackend =
      'RESTful APIs, Dio, JSON Parsing, Authentication Flow, Error Handling';
  static const String skillAndroidDev =
      'Android SDK, Activity/Fragment Lifecycle, Gradle, Kotlin DSL, Android API Level Updates, Play Store Requirements, Performance Optimization';
  static const String skillIosDev =
      'Swift, SwiftUI, Xcode, CocoaPods, Podfile configuration, IPA Builds, Ad Hoc Distribution, TestFlight, Signing Configuration, Flutter iOS platform setup, framework linking, build troubleshooting';
  static const String skillBuildDevOps =
      'Android Gradle Plugin (AGP), ProGuard/R8, Flutter package/plugin management, Jenkins CI/CD, Git (branching, merging, pull requests)';
  static const String skillSecurity =
      'Frida detection, Application Analysis, Crash Investigation, Root Cause Analysis, Performance Profiling, reverse engineering mitigation, security testing';
  static const String skillTooling =
      'Android Studio, Xcode, VS Code, Charles Proxy, Jira, Confluence, Figma';
  static const String skillAdditional = 'SQL, React, Node.js, C#, Linux/UNIX';

  // Work Experience
  static const String expTitle = 'Work Experience';

  // 1. PSBank
  static const String expRole = 'System Analyst — Flutter Developer';
  static const String expCompany = 'Philippine Savings Bank (PSBank)';
  static const String expPeriod = 'July 2024 – Present';
  static const String expSubRole =
      'Cross-platform Mobile Banking App (Android & iOS) — Flutter, Dart, Kotlin, MVVM + BLoC';

  static const List<String> expPoints = [
    'Developed and maintained a production banking app using Flutter/Dart for Android and iOS, serving retail banking customers across multiple releases.',
    'Architected UI and business logic layers using MVVM + BLoC, improving feature scalability and enabling parallel team development.',
    'Integrated 10+ RESTful APIs with structured error handling, authentication flows, and JSON response mapping.',
    'Led migration from Groovy DSL to Kotlin DSL for Gradle build scripts, improving build maintainability and onboarding speed.',
    'Integrated and configured third-party SDKs and Flutter packages, including Android/iOS platform setup, dependency management, framework linking, and plugin compatibility resolution.',
    'Resolved version conflicts and replaced 10+ deprecated packages across Flutter, Android (AGP, Kotlin, NDK), and iOS SDK, eliminating build failures and reducing technical debt.',
    'Implemented Frida detection at runtime to mitigate reverse engineering and tampering risks in a financial-grade environment.',
    'Configured Android release requirements including Flutter build setup, Gradle configuration, and compatibility updates to support Google Play requirements such as Android API Level 35 and 16 KB page size architecture.',
    'Managed Flutter package dependencies and native platform integrations across Android and iOS, including CocoaPods configuration, Podfile updates, framework linking, and resolving plugin compatibility issues.',
  ];

  // 2. Quantrics
  static const String expQuantricsRole = 'Junior Android Developer';
  static const String expQuantricsCompany = 'Quantrics Enterprises Inc.';
  static const String expQuantricsPeriod = 'June 2023 – September 2023';
  static const String expQuantricsSubRole =
      'Android Mobile Applications — Kotlin, Android SDK, Android Studio';

  static const List<String> expQuantricsPoints = [
    'Completed structured Android development training covering activity lifecycle, layouts, fragments, and REST API integration.',
    'Built and debugged Android features using Kotlin; supported senior developers on bug-fix tickets in Jira.',
    'Participated in code reviews, improving code quality and gaining exposure to Agile/SDLC workflows.',
    'Used Charles Proxy, Confluence, Jenkins, and Figma as part of the standard development toolchain.',
  ];

  // 3. Trent Technical Career Institute
  static const String expTrentRole = 'IT Instructor (Part-Time)';
  static const String expTrentCompany =
      'Trent Information First Technical Career Institute';
  static const String expTrentPeriod = 'August 2023 – December 2023';

  static const List<String> expTrentPoints = [
    'Delivered IT courses to students, developed lesson plans aligned to curriculum objectives, and provided individual technical mentoring.',
  ];

  // Projects
  static const String projectsTitle = 'Featured Projects';

  static const String proj1Title = 'PSBank Mobile Banking App';
  static const String proj1Tech =
      'Flutter, Dart, Kotlin, BLoC, REST APIs, Android/iOS';
  static const String proj1Desc =
      'Production cross-platform banking app deployed on Android and iOS for Philippine Savings Bank retail customers. Owned build configuration, versioning, and dependency management across AGP/NDK and iOS SDK. Delivered end-to-end features, performance tuning, and security hardening.';

  static const String proj2Title = 'Japanese Learning App ("Buddy")';
  static const String proj2Tech =
      'SwiftUI, Xcode, iOS (Personal Project – 2026)';
  static const String proj2Desc =
      'Ongoing personal project (2026–present), built using Xcode and SwiftUI. Designed as a flashcard and review-based learning app ("Buddy") to support Japanese language study, improve retention, and enhance learning efficiency.';

  static const String proj3Title = 'Chie Japanese Learning App';
  static const String proj3Tech =
      'Java, Android Studio, Android SDK (Capstone Project – 2023)';
  static const String proj3Desc =
      'Developed a fully functional Android application in Java using Android Studio for Chie Japanese Language School as a capstone project. Designed and implemented structured learning features including vocabulary practice and language exercises.';

  // Education
  static const String eduTitle = 'Education';
  static const String eduDegree = 'B.S. Information Technology';
  static const String eduSchool = 'Our Lady of Fatima University';
  static const String eduPeriod = 'Nov 2018 – July 2023';

  // Certifications & Training
  static const String certsTitle = 'Certifications & Training';
  static const Map<String, String> certsMap = {
    'Docker and Kubernetes: The Complete Guide': '2026',
    'Introduction to Banking': 'March 2025',
    'Linux OS Installation and Administration / Basic Scripting Linux':
        'Dec 2024, Jan 2025',
    'Basic SQL / Oracle SQL Fundamentals': 'Jan–Feb 2024, Nov 2024',
    'React and Node.js': 'November 2024',
    'N5 Japanese Language Proficiency Test (JLPT)': 'September 2024',
    'C# Fundamentals': 'October 2024',
    'System Analysis and Design': 'October 2024',
  };

  // Languages
  static const String languagesTitle = 'Languages';
  static const String langEnglish =
      'English — Professional Working Proficiency';
  static const String langFilipino = 'Filipino — Native';
  static const String langJapanese = 'Japanese — Beginner (N5 certified)';
}
