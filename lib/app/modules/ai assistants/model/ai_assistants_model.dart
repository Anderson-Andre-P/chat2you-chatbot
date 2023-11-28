import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class AiAssistantData {
  static List<AiAssistant> assistants = [
    AiAssistant(
      imagePath: Constants.comment,
      title: 'Talk With IA',
      description: 'Generate well-written articles on any topic you want.',
      category: "Business",
      color: Colors.amber,
    ),
    AiAssistant(
      imagePath: Constants.books,
      title: 'Academic Writer',
      description: 'Generate educational writing such as essays, reports, etc',
      category: "Writing",
      color: Colors.purple,
    ),
    AiAssistant(
      imagePath: Constants.clipboard,
      title: 'Summarize Documents',
      description: 'Extract key points from long texts.',
      category: "Writing",
      color: Colors.green,
    ),
    AiAssistant(
      imagePath: Constants.notebook,
      title: 'Plagiarism Checker',
      description: 'Check plagiarism in any text.',
      category: "Writing",
      color: Colors.red,
    ),
    AiAssistant(
      imagePath: Constants.page,
      title: 'Write an Articles',
      description: 'Generate well-written articles on any topic you want.',
      category: "Writing",
      color: Colors.blue,
    ),

    // Creative
    AiAssistant(
      imagePath: Constants.music,
      title: 'Songs/Lyrics',
      description: 'Generate lyrics from any music genre you want.',
      category: "Creative",
      color: Colors.teal,
    ),
    AiAssistant(
      imagePath: Constants.rocket,
      title: 'Storyteller',
      description: 'Generate stories from any given topic.',
      category: "Creative",
      color: Colors.deepOrange,
    ),
    AiAssistant(
      imagePath: Constants.heart,
      title: 'Poems',
      description: 'Generate poems in different styles.',
      category: "Creative",
      color: Colors.lime,
    ),
    AiAssistant(
      imagePath: Constants.movie,
      title: 'Movie Script',
      description: 'Generate the script for the movie.',
      category: "Creative",
      color: Colors.pink,
    ),

    // Business
    AiAssistant(
      imagePath: Constants.envelope,
      title: 'Email Writer',
      description: 'Generate templates for emails, letters, etc.',
      category: "Business",
      color: Colors.yellow,
    ),
    AiAssistant(
      imagePath: Constants.success,
      title: 'Answer Interviewer',
      description: 'Generate answers to interview questions.',
      category: "Business",
      color: Colors.greenAccent,
    ),
    AiAssistant(
      imagePath: Constants.job,
      title: 'Job Post',
      description: 'Write ideal job descriptions for posting.',
      category: "Business",
      color: Colors.red,
    ),
    AiAssistant(
      imagePath: Constants.advertsements,
      title: 'Advertisements',
      description:
          'Generate promotional text for products, services, brands, etc.',
      category: "Business",
      color: Colors.deepPurple,
    ),

    // Social Media
    AiAssistant(
      imagePath: Constants.linkedin,
      title: 'LinkedIn',
      description: 'Create attention grabbing posts on LinkedIn.',
      category: "Social Media",
      color: Colors.deepOrange,
    ),
    AiAssistant(
      imagePath: Constants.instagram,
      title: 'Instagram',
      description: 'Write captions that attract audience on Instagram.',
      category: "Social Media",
      color: Colors.blue,
    ),
    AiAssistant(
      imagePath: Constants.twitter,
      title: 'Twitter',
      description: 'Make tweets that catch the attention of readers on X.',
      category: "Social Media",
      color: Colors.blueGrey,
    ),
    AiAssistant(
      imagePath: Constants.facebook,
      title: 'Facebook',
      description: 'Write posts that attract audience on Instagram.',
      category: "Social Media",
      color: Colors.limeAccent,
    ),

    //
    // AiAssistant(
    //   imagePath: Constants.text,
    //   title: 'Write an Articles',
    //   description: 'Generate well-written articles on any topic you want.',
    //   color: Colors.pink.shade800,
    // ),
  ];
}

class AiAssistant {
  final String imagePath;
  final String title;
  final String description;
  final String category;
  final Color color;

  AiAssistant({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.description,
    required this.color,
  });
}
