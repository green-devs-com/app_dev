class UserModel {
  final String uid;
  final String username;
  final int type;
  final int lastSeen;
  final bool online;
  final bool status;
  final String location;

  UserModel({
    required this.uid,
    required this.username,
    required this.type,
    required this.lastSeen,
    required this.online,
    required this.status,
    required this.location,
  });

  UserModel copyWith({
    String? uid,
    String? username,
    int? type,
    int? lastSeen,
    bool? online,
    bool? status,
    String? location,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      username: username ?? this.username,
      type: type ?? this.type,
      lastSeen: lastSeen ?? this.lastSeen,
      online: online ?? this.online,
      status: status ?? this.status,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    final user = {
      "uid": uid,
      "username": username,
      "type": type,
      "lastSeen": lastSeen,
      "online": online,
      "status": status,
      "location": location,
    };
    return user;
  }

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"] ?? "",
      username: json["username"] ?? "",
      type: json["type"] ?? 2,
      lastSeen: json["lastSeen"] ?? 0,
      online: json["online"] ?? false,
      status: json["status"] ?? true,
      location: json["location"] ?? "",
    );
  }
}
