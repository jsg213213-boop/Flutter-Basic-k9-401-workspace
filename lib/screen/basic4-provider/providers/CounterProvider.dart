import 'package:flutter/material.dart';

// ChangeNotifier를 상속받아 상태 클래스 정의
class CounterProvider extends ChangeNotifier {
  int _count = 0; // private 상태 변수

  // getter: 외부에서 읽기 전용으로 접근
  int get count => _count;

  // 상태 변경 메서드
  void increment() {
    _count++;             // 상태 변경
    notifyListeners();    // ← 구독 중인 위젯에게 변경 알림 (재빌드 트리거)
  }

  void decrement() {
    if (_count > 0) _count--;
    notifyListeners();
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }
}