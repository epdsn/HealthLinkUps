import 'package:flutter_test/flutter_test.dart';
import 'package:corelinkups/models/video.dart';
import 'package:corelinkups/models/article.dart';
import 'package:corelinkups/models/community_post.dart';
import 'package:corelinkups/models/meetup.dart';

void main() {
  group('Video Model Tests', () {
    test('Video creation', () {
      final video = Video(
        id: '1',
        title: 'Test Video',
        description: 'Test Description',
        thumbnailUrl: 'https://example.com/thumb.jpg',
        videoUrl: 'https://example.com/video.mp4',
        duration: '10:00',
        category: 'Yoga',
      );

      expect(video.id, '1');
      expect(video.title, 'Test Video');
      expect(video.category, 'Yoga');
    });

    test('Video copyWith', () {
      final video = Video(
        id: '1',
        title: 'Original Title',
        description: 'Description',
        thumbnailUrl: 'url',
        videoUrl: 'url',
        duration: '10:00',
        category: 'Yoga',
      );

      final updated = video.copyWith(title: 'Updated Title');
      expect(updated.title, 'Updated Title');
      expect(updated.id, '1');
    });
  });

  group('Article Model Tests', () {
    test('Article creation', () {
      final article = Article(
        id: '1',
        title: 'Test Article',
        content: 'Test Content',
        author: 'John Doe',
        publishedDate: DateTime(2025, 1, 1),
        imageUrl: 'https://example.com/image.jpg',
        category: 'Fitness',
      );

      expect(article.id, '1');
      expect(article.title, 'Test Article');
      expect(article.author, 'John Doe');
    });
  });

  group('CommunityPost Model Tests', () {
    test('CommunityPost creation', () {
      final post = CommunityPost(
        id: '1',
        author: 'Jane Doe',
        content: 'Great workout today!',
        timestamp: DateTime.now(),
        likes: 5,
        linkUrl: 'https://example.com',
      );

      expect(post.id, '1');
      expect(post.author, 'Jane Doe');
      expect(post.likes, 5);
      expect(post.linkUrl, 'https://example.com');
    });

    test('CommunityPost copyWith for likes', () {
      final post = CommunityPost(
        id: '1',
        author: 'Jane Doe',
        content: 'Content',
        timestamp: DateTime.now(),
        likes: 5,
      );

      final updated = post.copyWith(likes: 6);
      expect(updated.likes, 6);
      expect(updated.author, 'Jane Doe');
    });
  });

  group('Meetup Model Tests', () {
    test('Meetup creation', () {
      final meetup = Meetup(
        id: '1',
        title: 'Morning Yoga',
        instructor: 'John Smith',
        description: 'Relaxing yoga session',
        dateTime: DateTime(2025, 12, 1, 8, 0),
        location: 'Central Park',
        latitude: 40.7829,
        longitude: -73.9654,
        category: 'Yoga',
        maxParticipants: 20,
        currentParticipants: 10,
      );

      expect(meetup.id, '1');
      expect(meetup.title, 'Morning Yoga');
      expect(meetup.maxParticipants, 20);
      expect(meetup.currentParticipants, 10);
    });

    test('Meetup isFull property', () {
      final fullMeetup = Meetup(
        id: '1',
        title: 'Test',
        instructor: 'Test',
        description: 'Test',
        dateTime: DateTime.now(),
        location: 'Test',
        latitude: 0,
        longitude: 0,
        category: 'Test',
        maxParticipants: 10,
        currentParticipants: 10,
      );

      expect(fullMeetup.isFull, true);

      final notFullMeetup = fullMeetup.copyWith(currentParticipants: 9);
      expect(notFullMeetup.isFull, false);
    });

    test('Meetup availableSpots calculation', () {
      final meetup = Meetup(
        id: '1',
        title: 'Test',
        instructor: 'Test',
        description: 'Test',
        dateTime: DateTime.now(),
        location: 'Test',
        latitude: 0,
        longitude: 0,
        category: 'Test',
        maxParticipants: 20,
        currentParticipants: 12,
      );

      expect(meetup.availableSpots, 8);
    });
  });
}
