class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final String icon;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl,
      required this.icon});
}

List<ChatModel> dummyData = [
  new ChatModel(
      name: "Aderibigbe Jesutoni",
      message: "Hey Flutter",
      time: "15:30pm",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg"),
  new ChatModel(
      name: "John Doe",
      message: "Hey I have hacked Whatsapp",
      time: "17:30pm",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg"),
  new ChatModel(
      name: "Mike Ross",
      message: "Hey!",
      time: "5:30am",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg"),
  new ChatModel(
      name: "Rachel",
      message: "You...",
      time: "3:30pm",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg"),
  new ChatModel(
      name: "Barry Mike",
      message: "Hey Flutter",
      time: "12:30pm",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg"),
  new ChatModel(
      name: "Joe West",
      message: "Hey Flutter",
      time: "15:30pm",
      avatarUrl:
          "data:image/jpeg;base64,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",
      icon: "person.svg")
];