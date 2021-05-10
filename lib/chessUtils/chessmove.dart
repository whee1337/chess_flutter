class ChessMove {
  final String moveWhite;
  final String moveBlack;
  final int turnNumber;
  ChessMove(this.moveWhite, this.moveBlack, this.turnNumber);

  factory ChessMove.fromJson(Map<String, dynamic> json) {
    return ChessMove(json["white"], json["black"], json["turn"]);
  }
}
