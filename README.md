# SCHOOL_MEAL_PAY_PLATFORM
```
대학 졸업작품. 
학식 결제 웹앱 플랫폼. 
교내 식당별 메뉴정보를 한눈에 볼 수 있도록 웹/앱을 통해 정보제공
종이식권이 아닌 모바일 결제 후 식권 발급 기능구현
```
### 일시    
+ 2018.04 ~ 2018.11 (8개월)

### 개요
+ 학부시절 교내 학식 결제를 모바일/PC 등의 스마트 기기로 결제 후 식권을 발급 받을 수 있는 서비스로, JSP를 이용한 웹 서비스입니다. 
+ 학부 시절 점심시간마다 줄을 서서 결제하여 종이 식권을 낭비하는 시스템을 변화시키기 위해 혼자 도전한 프로젝트입니다.

### 개발환경 및 언어
<img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=Amazon&logoColor=white"/> <img src="https://img.shields.io/badge/JSP-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"/> <img src="https://img.shields.io/badge/Java-FF160B?style=for-the-badge&logo=JAVA&logoColor=white"/> <img src="https://img.shields.io/badge/JAVASCRIPT-F7DF1E?style=for-the-badge&logo=JAVASCRIPT&logoColor=white"/>
<img src="https://img.shields.io/badge/MYSQL-4479A1?style=for-the-badge&logo=MYSQL&logoColor=white"/>
<img src="https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=Bootstrap&logoColor=white"/>



### 구성도
<img src=/structure.png></img>

### 릴리즈
<img src=/deploy.png></img>

### 개발기능
+ 주간 / 월간 식당별 메뉴정보 (Python Web Driver를 이용한 학교게시판 메뉴정보 자동 크롤링)
+ 학식 결제기능 (IM PORT API, KG이니시스 이용)
+ 모바일 식권 발급기능 (QR코드 함수를 이용)
+ 식당 별 자유게시판 (XSS, 악성스크립팅 방지, SQL인젝션, 웹 기초 보안 적용)
+ 게시글 추천 기능 (ID 별 1회 제한)
+ 게시글 신고 기능 (Google Email API 이용하여 경고 메일 전송)
+ 게시글 댓글 기능
+ 회원가입 (JavaScript를 이용한 Validation 검사)
+ 로그인 / 로그아웃 (Session 값을 이용하여 처리)

### 설명

+ 웹 프론트엔드 전반적 디자인 구현 언어는 Jsp와 Bootstrap3 을 이용하여 제작하였습니다. 
+ JavaScript (Jquery)를 이용하여 각각의 요소들에 액션을 추가하여 동적인 웹을 만들어주었습니다.
+ PC나 스마트폰 등 어떤 디바이스에도 모두 이용 가능 하도록 모바일 친화적인 반응형 웹을 구현 하였습니다. 
+ 호스팅을 위한 서버는 AWS를 이용하여 모두 구성해주었으며, 데이터베이스는 Mysql5.7을  설치하였습니다.
+ DB연동을 위한 언어는 JSP를 사용하여 통신해주었고, 식권결제 플랫폼에 핵심기능인 결제모듈은 아임포트 JS를 이용해 PG(Payment Gateway)사 중 KG 이니시스를 연동시켰습니다. 
다만 개발자모드로 연동하여 실제 식당과의 협의가 진행 되지 못해 해당 서비스가 학생들에게 공급되진 못했습니다.
