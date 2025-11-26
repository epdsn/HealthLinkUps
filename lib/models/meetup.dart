class Meetup {
  final String id;
  final String title;
  final String instructor;
  final String description;
  final DateTime dateTime;
  final String location;
  final double latitude;
  final double longitude;
  final String category;
  final int maxParticipants;
  final int currentParticipants;

  Meetup({
    required this.id,
    required this.title,
    required this.instructor,
    required this.description,
    required this.dateTime,
    required this.location,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.maxParticipants,
    required this.currentParticipants,
  });

  Meetup copyWith({
    String? id,
    String? title,
    String? instructor,
    String? description,
    DateTime? dateTime,
    String? location,
    double? latitude,
    double? longitude,
    String? category,
    int? maxParticipants,
    int? currentParticipants,
  }) {
    return Meetup(
      id: id ?? this.id,
      title: title ?? this.title,
      instructor: instructor ?? this.instructor,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      category: category ?? this.category,
      maxParticipants: maxParticipants ?? this.maxParticipants,
      currentParticipants: currentParticipants ?? this.currentParticipants,
    );
  }

  bool get isFull => currentParticipants >= maxParticipants;
  
  int get availableSpots => maxParticipants - currentParticipants;
}
