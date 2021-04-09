# **kt.com 이벤트 관리 시스템 - 사로나 <img src="https://user-images.githubusercontent.com/34331235/113510232-d53a5380-9594-11eb-89c7-3c676f2a384f.png" width="30"/>**

사용자는 kt.com에서 진행중인 **이벤트 신청**을 할수있습니다. <br>
운영자는 별도의 배포없이 실시간으로 **이벤트 처리**를 할수있습니다. 


## **Repository Tree**

Documents : **Deliverables**
> 데이터베이스 모델링

> 발표자료

> 회의록

src : **Project source file directory**
> main : **main source file directory**
> > java/com/ktds/devpro : **java files directory**
> > > config : **Security files directory**
> > > > MyContextListener.java / 
> > > > SSHConnection.java / 
> > > > SecurityConfig.java ...
> > >
> > > controller : **Controller directory**
> > > > CardController.java / 
> > > > EventCheckController.java / 
> > > > EventChkController.java / 
> > > > EventPastController.java / 
> > > > EventSearchController.java / 
> > > > HomeController.java / 
> > > > MemberController.java / 
> > > > MemberTestController.java ...
> > >
> > > model : **Model directory**
> > > > dao : **DAO directory**
> > > > > EventCtgDao.java / 
> > > > > EventDao.java / 
> > > > > MemberDao.java ...
> > >
> > > > mapper : **Mapper directory**
> > > > > ChkEventMapper.java / 
> > > > > EventMapper.java / 
> > > > > MemberMapper.java / 
> > > > > PastEventMapper.java ...
> > > >
> > > > vo : **VO directory**
> > > > > EventCtgVO.java / 
> > > > > EventDtVO.java / 
> > > > > EventVO.java / 
> > > > > Member.java / 
> > > > > MemberVO.java ...
> > > >
> > > > service : **Service directory**
> > > > > EventSearchService.java / 
> > > > > CardServiceImpl.java / 
> > > > > EventSearchServiceImpl.java / 
> > > > > MemberService.java / 
> > > > > MemberServiceImpl.java ...
> > > >
> > resources : **resource directory**
> > > application.properties
> > > static : **css, image js directory**
> > > > css : **css directory**
> > > > > bootstrap.min.css / 
> > > > > demo.css / 
> > > > > material-dashboard.css / 
> > > > > person.css ...
> > > >
> > > > image : **image directory**
> > > > js : **js directory**
> >
> > webapp/WEB-INF/views : **view directory**
> > > check_detail.jsp / 
> > > check_event.jsp / 
> > > curr_event.jsp / 
> > > event_detail.jsp / 
> > > event_footer.jsp / 
> > > event_login.jsp / 
> > > event_register.jsp / 
> > > event_register_Success.jsp / 
> > > html_head.html / 
> > > index.jsp / 
> > > main_header.jsp / 
> > > past_event.jsp / 
> > > test.jsp
> > > login : **Login directory**
> > > > loginPage.jsp / 
> > > > login_fail.jsp / 
> > > > login_success.jsp ...
> > > > 
> > > member : **Member directory**
> > > > find_fail.jsp /
> > > > find_success ...
>
traget : **maven build result directory**

> mvn, mvnw.cmd : **maven wrapper**

> pom.xml : **project pom.xml**

## **Development Environment**
- IDE : **STS 3.9.12** / **SpringFramework Boot 2.4.3**
- MVC View : **jsp**
- Servlet Container : **Apache Tomcat 8.5.57**
- DB connection : **MYBATIS**
- DB application : **MYSQL**
- Build : **Apache MAVEN 3.3.9**


## **Gitlab Repository**
- https://devpro.ktds.co.kr:9999/giljun.park/kt-event/
## **Trello**
- https://trello.com/b/jGHriCw0/%EC%82%AC%EB%A1%9C%EB%82%984%EC%A1%B0/

## **Main Function**

### **사용자 어플리케이션측**
1. 이벤트 신청 기능
2. 이벤트 당첨 확인 (email, mms)

### **이벤트 페이지 운영자측**
1. 이벤트 신청 기간 종료시 자동으로 당첨자 처리
2. 이벤트 open/close 여부 판별

## **Demonstration video**

![시연영상](https://user-images.githubusercontent.com/34331235/113499960-465a1680-9555-11eb-86b6-aef9880e5eb2.gif)

## **ERD Diagram**

![erd](https://user-images.githubusercontent.com/34331235/113500399-938bb780-9558-11eb-8a59-34897a96ed17.png)

## **Role**

<table>
   <th>이름</th>
   <th>내용</th>
   <tr>
       <td>박길준</td>
       <td>PM,BE</td>
   </tr>
   <tr>
       <td>홍성욱</td>
       <td>PL,BE</td>
   </tr>
   <tr>
       <td>김호영</td>
       <td>FE</td>
   </tr>
   <tr>
       <td>송민재</td>
       <td>FE</td>
   </tr>
   <tr>
       <td>유태준</td>
       <td>FE</td>
   </tr>
   <tr>
       <td>이예은</td>
       <td>BE</td>
   </tr>
   <tr>
       <td>이정민</td>
       <td>BE</td>
   </tr>
   <tr>
       <td>홍다경</td>
       <td>BE</td>
   </tr>
   </table>
   
## **Project Schedule**
**Plan (1/2)**
    ![개발일정1](https://user-images.githubusercontent.com/34331235/113500465-1f9ddf00-9559-11eb-9aef-bd40bcb4e3ec.png)

**Plan (2/2)**
     ![개발일정2](https://user-images.githubusercontent.com/34331235/113500470-29bfdd80-9559-11eb-86fe-b96191b5f5aa.png)



## **Reference**

### **SpringBoot maven 개발자료**
- https://cafe.naver.com/ktds2020
 
### **SSH 터널링 수행**
- https://lts0606.tistory.com/278
- https://myhappyman.tistory.com/72

### **Jenkins 설정**
- https://www.hanumoka.net/2019/10/23/jenkins-20191023-jenkins-connect-gitlab
- https://holjjack.tistory.com/39

<img src="https://user-images.githubusercontent.com/34331235/113500608-385ac480-955a-11eb-96e8-6634120b7955.png" width="90%"></img>

