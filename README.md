# Omokawng iOS

**[Project Description]**  
오목왕 : 오늘 목표 완료! (목표 관리 어플)  
유저 그룹 간 목표 설정 및 모니터링 가능  

---  

### Development Environment

Minimum Deployments: iOS `16.0`  
Xcode Version: `15.4`  
Tuist Version: `4.13.0`  
mise Version: `2024.3.9 macos-x64`  
git Version: `2.39.3 (Apple Git-146)`  

---  

### External Dependency  

- [Swinject 2.9.1 >=](https://github.com/Swinject/Swinject)  
- [kakao-ios-sdk 2.20.0 >=](https://github.com/kakao/kakao-ios-sdk)  

---  

### Skill Stack

Skill: MVI(Reducer)-C + Tuist + SwiftUI  
Architecture: Clean Architecture + Modular Architecture  

`MVI-C`는 MVVM-C 패턴에서 생각해낸 구조.  
MVVM-C 패턴은 MVVM 구조를 가져가며 Coordinator를 사용하는 패턴인데,  
유사하게 MVI를 사용하며 Coordinator를 사용할 수 있지 않을까 생각하여 만든 패턴.  