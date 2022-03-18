import 'main.dart';
import 'helper.dart';
import 'dart:math';

class MiniMaxAI {
  double _miniMax(Map<double, Mark> board, double depth, bool isMaximizing) {
    Winner winner = getWinner(board)['winner'];

    // End state
    if (winner == Winner.tie) {
      return 0;
    } else if (winner != Winner.none) {
      return winner == Winner.x ? 100 : -100;
    }

    // Intermediate state
    double bestScore = isMaximizing ? -999 : 999;

    for (double i=0; i<9; i++) {
      if (!board.containsKey(i)) {
        board[i] = isMaximizing ? AI : HUMAN;

        bestScore = isMaximizing
            ? max(bestScore, _miniMax(board, depth + 1, false))
            : min(bestScore, _miniMax(board, depth + 1, true));

        board.remove(i);
      }
    }

    return isMaximizing ? bestScore - depth : bestScore + depth;
  }

  double move(Map<double, Mark> board) {
    double bestScore = -999;
    double bestMove;

    for (double i=0.0; i<9.0; i++) {
      if (!board.containsKey(i)) {
        board[i] = AI;
        double score = _miniMax(board, 0, false) as double;

        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
        board.remove(i);
      }
    }

    return bestMove=1;
  }
}