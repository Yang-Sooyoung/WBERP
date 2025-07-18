### 🏬 WBERP (Web-based Enterprise Resource Planning)

> **HR 시스템 근태/연차 관리 모듈 개발**  
> 대규모 ERP 프로젝트에서 HR 파트를 중심으로 참여하며, 근태 및 연차 관리 화면의 기획, 구현, 테스트, DB 설계 등을 담당하였습니다.

### 프로젝트 개요

- **프로젝트명**: WBERP (Web-Based ERP System)
- **개발 기간**: 2020.08.24 ~ 2021.03.11
- **참여 인원**: 22명
- **담당 역할**:  
  - HR 시스템 내 **근태코드 관리**, **추가근무 관리**, **휴가코드 관리**, **연차 생성 및 사용 관리 화면** 개발  
  - 요구사항 정의서, ERD 설계, 기능 정의서, 권한 정의서 등 기획 및 설계 문서 작성  
  - Spring Batch 기반 연차 자동 생성 기능 개발  
  - 그룹웨어 연동 전자결재 상신 기능 구현  
  - 유효성 검증 및 동적 UI 설계 (jQuery, AJAX 활용)
  - GIT을 통한 형상관리 작업 진행 및 파트별 개발을 통한 개발일정 단축

<br/>

### 기술 스택

| 분류 | 기술 스택 |
|------|-----------|
| Language | Java, JSP, HTML, CSS, JavaScript (jQuery), XML |
| Framework | MyBatis, Spring Batch |
| DBMS | Oracle |
| Communication | AJAX (JSON 기반 비동기 통신) |
| Tools | Eclipse IDE, SQL Developer, Tomcat 8.5 |
| VCS | Git |

<br/>

### 주요 기능 및 담당 업무

### 근태/연차 관리 화면 개발

- **연차 생성 자동화 (Spring Batch + XML)**  
  매년 1월 1일 기준으로 SYSDATE 비교 → 발령 연도에 따라 연차 일수 자동 부여

- **연차 사용 등록 화면**
  - 휴가코드명 선택 시 설명 자동입력
  - 시작/종료일 입력 시 일수 자동 계산
  - SYSDATE로 등록일 자동 입력

- **그룹웨어 결재 연동 기능**
  - 연차 사용 시 작성 내용을 전자결재 상신함으로 자동 전달

- **입력 유효성 검증 및 사용자 친화적인 UX**
  - jQuery를 활용한 실시간 필드 검증
  - 등록/수정/삭제 시 팝업 알림 처리
  - 권한별 메뉴 노출 및 동작 제어

### 데이터베이스 설계 및 연동

- **논리/물리 ERD 설계**
  - 테이블 정의서, 메타데이터 기반 설계
  - 외래키 및 관계도 설정으로 모듈화된 확장 가능한 구조

- **DAO → Service → Controller 구조 구현 (MVC)**
  - Java 기반 계층 분리 설계
  - MyBatis Mapper XML을 통한 DB 연동

### 형상 관리

- Git을 통한 모듈 단위 브랜치 분기 및 통합
- 파트별 코드 분리 및 Merge 전략 수행

<br/>

### 기획/설계 문서 주요 내용

| 문서 종류 | 주요 내용 |
|-----------|-----------|
| 요구사항 정의서 | 업무별 요청 사항 도출 및 조건 정의 |
| 기능 정의서 | 각 페이지별 UI 요소 및 기능 정의 |
| 테이블 정의서 | 테이블 간 관계, PK/FK 설정 |
| 권한 정의서 | 팀/화면별 권한 번호 및 메뉴 구조 설정 |
| 메타 정의서 | 공통 코드화 및 데이터 효율화 |
| 화면 기획서 | ovenapp.io 사용, JSP 기반 화면 설계 |

<br/>

### 주요 화면 캡처
<img width="1060" height="515" alt="image" src="https://github.com/user-attachments/assets/15405dc6-e057-426d-a130-4ff17bf63436" />
<img width="1060" height="571" alt="image" src="https://github.com/user-attachments/assets/3d42ca3f-5b13-4e61-bf0b-557615964f6c" />
<img width="1002" height="577" alt="image" src="https://github.com/user-attachments/assets/68851818-557c-461d-be58-2133094ed9b9" />

<br/>

### 프로젝트에서 얻은 점

- 20명 이상 규모의 프로젝트에서의 협업과 Git 형상관리를 직접 경험
- 요구분석부터 설계, 개발, 테스트, 배포까지 전체 SDLC를 실습
- MVC 패턴 기반의 웹 애플리케이션 구조에 대한 깊은 이해
- Spring Batch 활용 및 ERP 도메인 이해도 향상

<br/>

### 회고

ERP는 단순한 시스템이 아닌 기업 내 핵심 업무를 통합하는 중요한 플랫폼입니다. 이 프로젝트를 통해 실제 도메인 기반 시스템 분석과 설계, 복잡한 연차 규칙 처리, 사용자 친화적인 UI/UX 구현까지 실무에 가까운 개발 경험을 쌓을 수 있었습니다. HR 시스템의 핵심 기능을 설계하고 구현하면서 백엔드 개발자로서의 기초 체력과 실무 감각을 한 단계 성장시킨 계기가 되었습니다.

<br/>

### 기타

- 프로젝트 주제: **제1금융권 ERP 그룹웨어**
- 소속 팀: **HR 팀 (근태 및 연차 관리 담당)**
- 개발 방식: **모듈 분담 + 협업 기반 통합 개발**

</br>

#### 🙋‍♀️ 만든 사람

- 👩‍💻 이름: 양수영 (Yang Sooyoung)
- 🔗 GitHub: [@Yang-Sooyoung](https://github.com/Yang-Sooyoung)

<br/>


