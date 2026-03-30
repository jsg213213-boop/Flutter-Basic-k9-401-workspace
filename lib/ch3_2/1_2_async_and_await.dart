void main() {
  addNumbers(100, 200); // 1번 메서드가 실행되고
  addNumbers(300, 400); // 2번 메서드는 대기 없이 같이 실행.
}

// async 키워드는 함수 매개변수 정의와 바디 사이에 입력합니다.
void addNumbers(int number1, int number2) async {
  print('$number1 + $number2 계산 시작!');

  // await는 대기하고 싶은 비동기 함수 앞에 입력합니다.
  await Future.delayed(Duration(seconds: 3), (){
    print('$number1 + $number2 = ${number1 + number2}');
  });

  print('$number1 + $number2 코드 실행 끝');
}