-- EVT_CTG 카테고리 데이터
INSERT INTO EVT_CTG VALUES (1, '상품/서비스');
INSERT INTO EVT_CTG VALUES (2, '멤버십');
INSERT INTO EVT_CTG VALUES (3, '올레TV');
INSERT INTO EVT_CTG VALUES (4, '기업');
INSERT INTO EVT_CTG VALUES (0, '기타');

-- EVT_EVT 카테고리별 테이블 데이터
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('Seezn, 5월엔 5만명 선물 이벤트', NOW(), DATE_ADD(now(), interval 7 day), 1, 'https://event.kt.com/images/11460/banner02.jpg', 0, 'Seezn 로그인 고객 누구나', '02-569-5422', '9999-12-31');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('웹툰, 웹소설 5개월 무료! 우리카드 자동이체 이벤트', '2019-11-01', '2020-10-31', 1, 'https://event.kt.com/images/11288/open_01.jpg', 1, 'kt 고객 누구나', '1588-9955', '9999-12-31');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('아이폰SE 공유하기 이벤트', '2020-04-29', '2020-05-05', 2, 'https://event.kt.com/images/11288/open_01.jpg', 0, '전 고객 이용 가능', '100', '2020-05-12');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('아이폰12 공유하기 이벤트', '2020-11-10', '2020-12-31', 0, 'https://event.kt.com/images/11288/open_01.jpg', 0, '전 고객 이용 가능', '100', '2021-01-05');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('KT 멤버십 5Good위크 올레tv 혜택 안내', '2020-05-04', '2020-06-30', 1, 'https://event.kt.com/images/11452/open_01.jpg', 2, 'KT 멤버십 전 고객', '국번없이 100', '9999-12-31');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('키즈랜드 페스티벌!', '2020-04-29', '2020-05-31', 1, 'https://event.kt.com/images/11452/open_01.jpg', 3, '누구나!','event@nexbrain.com', '9999-12-31');
INSERT INTO EVT_EVT (EVT_NM, ST_DATE, END_DATE, EVT_ST, EVT_FILE_URL, EVT_CTG, EVT_TRG, EVT_PHONE, EVT_TRG_DATE)
VALUES('KT 멤버십 꾸까 전고객 10% 할인 혜택', '2019-05-01', '2020-12-31', 1, 'https://event.kt.com/images/11452/open_01.jpg', 2, 'KT 멤버십 전 고객' , '100', '9999-12-31');


-- 1번 시즌 상세 데이터
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/bg_header.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/bg_period.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/bg_tvcf.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, '<iframe width="724" height="407" src="https://www.youtube.com/embed/5YCSvdN4pKQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>', 'VIDEO');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/bg_info.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/btn_onair03.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (1, 'https://event.myseezn.com/seezncf/images/web/bg_footer.png', 'INFO');


-- 2번 : 웹툰, 웹소설 5개월 무료! 우리카드 자동이체 이벤트 상세
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (2, 'http://img.contentsbox.net/alzza/woori_big_promotion_ext14/online/olleh_eventpage_1.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (2, 'http://img.contentsbox.net/alzza/woori_big_promotion_ext14/online/olleh_eventpage_2.png?v=1', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (2, 'http://img.contentsbox.net/alzza/woori_big_promotion_ext14/online/olleh_eventpage_btn_apply.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (2, 'http://img.contentsbox.net/alzza/woori_big_promotion_ext14/online/olleh_eventpage_3.png', 'IMG');

-- 3번 : 아이폰SE 공유하기 이벤트
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (3, '이벤트가 종료 되었습니다.', 'TXT');

-- 4 아이폰12 공유하기 이벤트(데이터 더미값(관계없는 데이터)
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (4, 'https://event.myseezn.com/seezncf/images/web/bg_header.png', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (4, 'https://zone.membership.kt.com/event/2019Goodstore/img/visual.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (4, 'https://event.myseezn.com/seezncf/images/web/bg_footer.png', 'INFO');

-- 5번 KT 멤버십 5Good위크 올레tv 혜택 안내
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/img/top_day.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/visual.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/cont01.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/cont_coupon02.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/cont_coupon01-off.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/cont_step.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice01.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice02.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice03.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice04.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice05.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice06.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice07.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/2020ollehtv/img/notice08.gif', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE)
VALUES (5, 'https://zone.membership.kt.com/event/img/memHome_btn.gif', 'IMG');

-- 6번 키즈랜드 페스티벌!
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/img_visual.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/img_event_01.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/img_event_02.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/btn_land.png', 'BTN');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/img_event_03.jpg', 'IMG');
INSERT INTO EVT_DT (EVT_ID, RES_DATA, DATA_TYPE) VALUES (6, 'https://benefit.kt.com/event/otv/kfair/img/img_attention.jpg', 'INFO');


-- 7번 꾸까 상세 데이터 수정본
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/visual.jpg', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/cont01.jpg', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/cont_step.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/cont02.gif','IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice.gif','IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice02.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice03.gif', 'IMG');
INSERT INTO EVT_DT( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice04.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice05.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice06.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice07.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice08.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice09.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES( 7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice10.gif', 'IMG');
INSERT INTO EVT_DT ( EVT_ID, RES_DATA, DATA_TYPE)
VALUES(7, 'https://zone.membership.kt.com/event/2019Kukka/img/notice11.gif', 'IMG');