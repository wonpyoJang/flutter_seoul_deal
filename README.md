# flutter_seoul_deal
[환결설정 방법(https://dart.dev/get-dart)]

macOS에서
$ brew tap dart-lang/dart
$ brew install dart

Linux에서

$ sudo apt-get update
$ sudo apt-get install apt-transport-https
$ wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
$ echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

$ sudo apt-get update
$ sudo apt-get install dart

[프로젝트에 활용된 dart 버전]

dart --version                        
Dart SDK version: 2.19.0 (stable) (Mon Jan 23 11:29:09 2023 -0800) on "macos_arm64"


1. poker_hands 실행 방법

cd poker_hands 
sample_poker.txt
dart poker_hands.dart sample_poker.txt


2. pingpong 실행 방법

cd pingpong
dart pingpong.dart N


1. 
포커 룰을 몰라 포커 룰을 익히는데 2시간, 구현하는데 4시간 정도 소요된것 같습니다. (쉬는 시간을 제외한 순수시간)

2.
반복문을 활용할 수 없다는 조건이 있어서 재귀 함수 호출과 dp를 활용한 점화식 해결 문제인지 생각해보았습니다. 
그러나, 대입문을 사용할 수 없다는 조건이 있어서 메모이제이션을 활용할 수 없다고 생각했습니다.
그래서 재귀함수 호출만을 활용해 구현을 하려고 시도했지만 N이 증가함에 따라 함수 호출 횟수가 2의 지수함수 스케일로 증가한다는 것을 알게되었습니다.
따라서 스택오버플로우가 발생할 것이고 스택 이슈가 없더라도 시간복잡도 이슈가 있을 것이라는 생각이 들었습니다.
그래서 꼬리재귀 최적화가 가능한 언어를 통해 풀어봐야하나 라는 생각을 했지만, 시간상 시도하지는 못했습니다.

테스트케이스 작성 목적 외에 외부라 라이브러리는 사용하지 않았으며, pubspec.yaml파일에서 확인하실 수 있습니다.

점화식은 엑셀을 활용해 다음과 같이 구했습니다. (https://docs.google.com/spreadsheets/d/1CSCr1zrXfPFZ5f91ldcNNIJ2azRnuN-3og6E3gpiFcE/edit#gid=0)
