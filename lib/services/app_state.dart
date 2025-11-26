import 'package:flutter/material.dart';
import '../models/video.dart';
import '../models/article.dart';
import '../models/community_post.dart';
import '../models/meetup.dart';

class AppState extends ChangeNotifier {
  final List<Video> _videos = [];
  final List<Article> _articles = [];
  final List<CommunityPost> _communityPosts = [];
  final List<Meetup> _meetups = [];

  List<Video> get videos => _videos;
  List<Article> get articles => _articles;
  List<CommunityPost> get communityPosts => _communityPosts;
  List<Meetup> get meetups => _meetups;

  // Video methods
  void addVideo(Video video) {
    _videos.add(video);
    notifyListeners();
  }

  void loadSampleVideos() {
    _videos.addAll([
      Video(
        id: '1',
        title: 'Morning Yoga Routine',
        description: 'Start your day with this energizing yoga session',
        thumbnailUrl: 'https://via.placeholder.com/300x200',
        videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        duration: '15:00',
        category: 'Yoga',
      ),
      Video(
        id: '2',
        title: '30-Minute HIIT Workout',
        description: 'High-intensity interval training for maximum results',
        thumbnailUrl: 'https://via.placeholder.com/300x200',
        videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        duration: '30:00',
        category: 'HIIT',
      ),
      Video(
        id: '3',
        title: 'Meditation for Beginners',
        description: 'Learn the basics of mindfulness meditation',
        thumbnailUrl: 'https://via.placeholder.com/300x200',
        videoUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
        duration: '10:00',
        category: 'Meditation',
      ),
    ]);
    notifyListeners();
  }

  // Article methods
  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void loadSampleArticles() {
    _articles.addAll([
      Article(
        id: '1',
        title: 'The Benefits of Regular Exercise',
        content: 'Regular physical activity is one of the most important things you can do for your health...',
        author: 'Dr. Jane Smith',
        publishedDate: DateTime.now().subtract(const Duration(days: 2)),
        imageUrl: 'https://via.placeholder.com/400x300',
        category: 'Fitness',
      ),
      Article(
        id: '2',
        title: 'Nutrition Tips for Athletes',
        content: 'Proper nutrition is essential for athletic performance and recovery...',
        author: 'Nutrition Expert Mike Johnson',
        publishedDate: DateTime.now().subtract(const Duration(days: 5)),
        imageUrl: 'https://via.placeholder.com/400x300',
        category: 'Nutrition',
      ),
      Article(
        id: '3',
        title: 'Mental Health and Wellness',
        content: 'Taking care of your mental health is just as important as physical health...',
        author: 'Sarah Williams, Psychologist',
        publishedDate: DateTime.now().subtract(const Duration(days: 7)),
        imageUrl: 'https://via.placeholder.com/400x300',
        category: 'Mental Health',
      ),
    ]);
    notifyListeners();
  }

  // Community methods
  void addCommunityPost(CommunityPost post) {
    _communityPosts.insert(0, post);
    notifyListeners();
  }

  void loadSampleCommunityPosts() {
    _communityPosts.addAll([
      CommunityPost(
        id: '1',
        author: 'John Doe',
        content: 'Just completed my first 5K run! Feeling amazing! 🏃‍♂️',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        likes: 24,
        linkUrl: null,
      ),
      CommunityPost(
        id: '2',
        author: 'Emily Chen',
        content: 'Great article on plant-based diets for athletes',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        likes: 18,
        linkUrl: 'https://example.com/plant-based-diet',
      ),
      CommunityPost(
        id: '3',
        author: 'Mike Rodriguez',
        content: 'Anyone interested in joining a morning running group? Let me know!',
        timestamp: DateTime.now().subtract(const Duration(hours: 8)),
        likes: 32,
        linkUrl: null,
      ),
    ]);
    notifyListeners();
  }

  // Meetup methods
  void addMeetup(Meetup meetup) {
    _meetups.add(meetup);
    notifyListeners();
  }

  void loadSampleMeetups() {
    _meetups.addAll([
      Meetup(
        id: '1',
        title: 'Morning Yoga in the Park',
        instructor: 'Lisa Anderson',
        description: 'Join us for a relaxing yoga session in Central Park',
        dateTime: DateTime.now().add(const Duration(days: 2)),
        location: 'Central Park, New York',
        latitude: 40.785091,
        longitude: -73.968285,
        category: 'Yoga',
        maxParticipants: 20,
        currentParticipants: 12,
      ),
      Meetup(
        id: '2',
        title: 'Beach Bootcamp',
        instructor: 'Tom Wilson',
        description: 'High-intensity workout by the beach',
        dateTime: DateTime.now().add(const Duration(days: 3)),
        location: 'Santa Monica Beach',
        latitude: 34.009476,
        longitude: -118.498627,
        category: 'HIIT',
        maxParticipants: 30,
        currentParticipants: 25,
      ),
      Meetup(
        id: '3',
        title: 'Group Running Session',
        instructor: 'Rachel Green',
        description: '5K run along the waterfront',
        dateTime: DateTime.now().add(const Duration(days: 1)),
        location: 'Hudson River Greenway',
        latitude: 40.730610,
        longitude: -74.001350,
        category: 'Running',
        maxParticipants: 15,
        currentParticipants: 8,
      ),
    ]);
    notifyListeners();
  }

  void likeCommunityPost(String postId) {
    final index = _communityPosts.indexWhere((post) => post.id == postId);
    if (index != -1) {
      _communityPosts[index] = _communityPosts[index].copyWith(
        likes: _communityPosts[index].likes + 1,
      );
      notifyListeners();
    }
  }

  void joinMeetup(String meetupId) {
    final index = _meetups.indexWhere((meetup) => meetup.id == meetupId);
    if (index != -1 && _meetups[index].currentParticipants < _meetups[index].maxParticipants) {
      _meetups[index] = _meetups[index].copyWith(
        currentParticipants: _meetups[index].currentParticipants + 1,
      );
      notifyListeners();
    }
  }
}
