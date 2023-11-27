-- HOTEL 정보
CREATE TABLE `tblhotels` (
  `hHotelID` int(11) NOT NULL AUTO_INCREMENT,
  `hHotelCode` varchar(25) DEFAULT NULL,
  `hName` varchar(50) DEFAULT NULL,
  `hMotto` varchar(100) DEFAULT NULL,
  `hAddress` varchar(100) DEFAULT NULL,
  `hAddress2` varchar(50) DEFAULT NULL,
  `hCity` varchar(30) DEFAULT NULL,
  `hState` varchar(2) DEFAULT NULL,
  `hZipCode` varchar(10) DEFAULT NULL,
  `hMainPhoneNumber` varchar(15) DEFAULT NULL,
  `hFaxNumber` varchar(15) DEFAULT NULL,
  `hTollFreeNumber` varchar(15) DEFAULT NULL,
  `hCompanyeMailAddress` varchar(75) DEFAULT NULL,
  `hWebsiteAddress` varchar(50) DEFAULT NULL,
  `hMain` bit(1) DEFAULT NULL,
  `hImagePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hHotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblhotels (hHotelCode,hName,hMotto,hAddress,hAddress2,hCity,hState,hZipCode,hMainPhoneNumber,hFaxNumber,hTollFreeNumber,hCompanyeMailAddress,hWebsiteAddress,hMain,hImagePath) VALUES
 ('JUNGTO01','정토사회문화회관','수련단체','서울특별시 서초구 효령로 51길 42','정토사회문화회관','서울특별시','서울','06652','02-587-8990','02-587-8998',NULL,'jungto.@jungto.org','https://www.jungto.org/',1,'../../../public/theme1/'),
 ('JUNGTO02','아도모래원','수련단체','경북 구미시 도개면','도개4길 14','구미시','경북','39104','054-474-5109',NULL,NULL,'jungto.@jungto.org','https://www.jungto.org/',0,'../../public/theme2/image');


-- 손님정보
CREATE TABLE `tblguests` (
  `gGuestID` int(11) NOT NULL AUTO_INCREMENT,
  `gFirstName` varchar(25) DEFAULT NULL,
  `gLastName` varchar(25) DEFAULT NULL,
  `gAddress` varchar(30) DEFAULT NULL,
  `gAddress2` varchar(30) DEFAULT NULL,
  `gCity` varchar(30) DEFAULT NULL,
  `gState` varchar(2) DEFAULT NULL,
  `gZipCode` varchar(11) DEFAULT NULL,
  `gCounty` varchar(50) DEFAULT NULL,
  `gHomePhoneNumber` varchar(20) DEFAULT NULL,
  `gCellularNumber` varchar(20) DEFAULT NULL,
  `geMailAddress` varchar(75) DEFAULT NULL,
  `gGender` varchar(1) DEFAULT NULL, 
  PRIMARY KEY (`gGuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO tblguests (gFirstName,gLastName,gAddress,gAddress2,gCity,gState,gZipCode,gCounty,gHomePhoneNumber,gCellularNumber,geMailAddress,gGender) VALUES
 ('박','이혜','서대문구 연희2동','3205-273','서울특별시','서울','10032','대한민국','(02)5487-5211','010-3344-0081','oha123@daum.net','M'),
 ('이','형구','전주시 완산구 효자동1가','623-3','전라남도','전라','55055','대한민국','063-222-6508','010-2298-6891','hapa12@gmail.net','M');


-- 예약 테이블 생성
CREATE TABLE `tblbookings` (
  `bBookingID`  int(11) NOT NULL AUTO_INCREMENT,
  `bHotelID` int(11) NOT NULL,
  `bGuestID` int(11) NOT NULL,
  `bReservationAgentID` int(11) DEFAULT NULL,
  `bDateFrom` datetime DEFAULT NULL,
  `bDateTo` datetime DEFAULT NULL,
  `bRoomCount` int(11) DEFAULT NULL,
  `bBookingStatusID` int(11) DEFAULT null,
  PRIMARY KEY (`bBookingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblbookings
(bHotelID, bGuestID, bReservationAgentID, bDateFrom, bDateTo, bRoomCount, bBookingStatusID)
VALUES(1, 1, NULL,cast( concat('2023-12-01', ' 15:00:00') as datetime), cast(concat('2023-12-02',' 10:00:00') as datetime), 1, 2);

-- 예약상태 테이블
CREATE TABLE `tblbookingstatus` (
  `bsBookingStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `bsStatus` varchar(25) NOT NULL, -- 1.단체예약, 2:개별예약, 3.고정예약, 4.입실예약
  `bsDescription` varchar(100) DEFAULT NULL,
  `bsSortOrder` int(11) DEFAULT NULL, 
  `bsActive` bit(1) DEFAULT NULL, 
  PRIMARY KEY (`bsBookingStatusID`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO tblbookingstatus (bsStatus,bsDescription,bsSortOrder,bsActive) VALUES
('업체예약','업체에이전트 이용',1,1),
('개별예약','개인 예약',1,1),
('고정예약','회사 장기/단기 출장고정',1,1),
('입실예약','당일입실',1,1),
('배실확정','배실처리완료',1,1),
('취소처리','처리중지',1,1);

-- 룸예약상태 테이블
CREATE TABLE `tblroomsbooked` (
  `rbRoomBookedID` int(11) NOT NULL AUTO_INCREMENT,
  `rbBookingID` int(11) DEFAULT NULL,
  `rbRoomID` int(11) DEFAULT NULL,
  `rbRoomType` int(11) DEFAULT NULL,  
  `rbRate` int(11) DEFAULT NULL,  -- 등급, 금액
  PRIMARY KEY (`rbRoomBookedID`)
)  ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblroomsbooked
(rbBookingID, rbRoomID, rbRoomType, rbRate)
VALUES(1, 27, 5, 163400);

CREATE TABLE `tblrooms` (
  `rRoomsID` int(11) NOT null AUTO_INCREMENT, -- 룸번호
  `rHotelID` int(11) DEFAULT NULL,
  `rFloor` int(11) DEFAULT NULL,
  `rRoomTypeID` int(11) DEFAULT NULL,
  `rRoomNumber` varchar(10) DEFAULT NULL,
  `rDesription` varchar(100) DEFAULT NULL,
  `rRoomStatusID` int(11) DEFAULT NULL,
  PRIMARY KEY (`rRoomsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblrooms (rHotelID,rFloor,rRoomTypeID,rRoomNumber,rDesription,rRoomStatusID) VALUES
	 (1,3,6,'무궁화1','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화2','바다전경이 안보이는 위치',1),
	 (1,3,6,'무궁화3','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화4','바다전경이 안보이는 위치',1),
	 (1,3,6,'무궁화5','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화6','바다전경이 안보이는 위치',1),
	 (1,3,6,'무궁화7','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화8','바다전경이 안보이는 위치',1),
	 (1,3,6,'무궁화9','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화10','바다전경이 안보이는 위치',1),
	 (1,3,6,'무궁화11','바다전경이 보이는 위치',1),
	 (1,3,6,'무궁화12','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리1','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리2','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리3','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리4','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리5','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리6','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리7','바다전경이 안보이는 위치',1),
	 (1,5,8,'개나리8','바다전경이 안보이는 위치',1),
	 (1,5,7,'살구1','바다전경이 안보이는 위치',1),
	 (1,5,7,'살구2','바다전경이 안보이는 위치',1),
	 (1,5,7,'살구3','바다전경이 안보이는 위치',1),
	 (1,5,7,'살구4','바다전경이 보이는 위치',1),
	 (1,5,7,'살구5','바다전경이 보이는 위치',1),
	 (1,5,7,'살구6','바다전경이 보이는 위치',1),
	 (1,4,5,'목련1','바다전경이 보이는 위치',1),
	 (1,4,5,'목련2','바다전경이 보이는 위치',1),
	 (1,4,5,'목련3','바다전경이 보이는 위치',1),
	 (1,6,3,'진달래1','바다전경이 안보이는 위치',1),
	 (1,6,3,'진달래2','바다전경이 안보이는 위치',1),
	 (1,6,3,'진달래3','바다전경이 안보이는 위치',1),
	 (1,6,3,'진달래4','바다전경이 안보이는 위치',1),
	 (1,6,3,'진달래5','바다전경이 안보이는 위치',1),
	 (1,6,3,'진달래6','바다전경이 안보이는 위치',1),
	 (1,7,2,'철죽1','바다전경이 안보이는 위치',1),
	 (1,7,2,'철죽2','바다전경이 안보이는 위치',1),
	 (1,7,2,'철죽3','바다전경이 안보이는 위치',1),
	 (1,7,2,'철죽4','바다전경이 안보이는 위치',1),
	 (1,8,1,'앵두1','바다전경이 안보이는 위치',1),
	 (1,8,1,'액두2','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화1','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화2','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화3','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화4','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화5','바다전경이 안보이는 위치',1),
	 (1,4,4,'국화6','바다전경이 안보이는 위치',1);

-- 방상태 테이블
CREATE TABLE `tblroomstatus` (
  `rsRoomStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `rsRoomStatus` varchar(25) DEFAULT NULL, 
  `rsDescription` varchar(100) DEFAULT NULL,
  `rsSortOrder` int(11) DEFAULT NULL,
  `reActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rsRoomStatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO tblroomstatus (rsRoomStatus,rsDescription,rsSortOrder,reActive) VALUES
 ('대기','숙박가능',1,1),
 ('예약','예약상태(배실처리)',1,1),
 ('입실','입실상태',1,1),
 ('퇴실','퇴실상태',1,1),
 ('정비','정비작업중',1,1),
 ('수리','수리작업중',1,1),
 ('안식','대실중지',1,0);

-- 방타입 테이블
-- 
CREATE TABLE `tblroomtypes` (
  `rtRoomTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `rtRoomType` varchar(25) DEFAULT NULL, -- Suite  Family, Suite, Delux Family, Delux Double, Delux Twin,  Standard Twin, Standard SuperTwin, Standard Single
  `rtDescription` varchar(100) DEFAULT NULL,
  `rtSortOrder` int(11) DEFAULT NULL,
  `rtActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rtRoomTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblroomtypes (rtRoomType,rtDescription,rtSortOrder,rtActive) VALUES
 ('Suite Family','장기투숙을 위한 최상 거주시설',1,1),
 ('Suite','고급스런 인테리어',1,1),
 ('Delux Family','가족을 위한 침실',1,1),
 ('Delux Double','퀸침대를 구비한 침실',1,1),
 ('Delux Twin','두개의 편리한 침대',1,1),
 ('Standard Twin','두개의  침대',1,1),
 ('Standard SuperTwin','두개의 더블침대',1,1),
 ('Standard Single','저렴한 숙소',1,1);

-- 등급 테이블
CREATE TABLE `tblrates` (
  `rRateID` int(11) NOT NULL AUTO_INCREMENT,
  `rRoomID` int(11) DEFAULT NULL,
  `rRate` int(11) DEFAULT NULL, -- 금액
  `rFromDate` datetime DEFAULT NULL,
  `rToDate` datetime DEFAULT NULL,
  `rRateTypeID` int(11) DEFAULT NULL,
  PRIMARY KEY (`rRateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblrates (rRoomID,rRate,rFromDate,rToDate,rRateTypeID) VALUES
 (1,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (2,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (3,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (4,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (5,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (6,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (7,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (8,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (9,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (10,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (11,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (12,155900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (13,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1);
 (14,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (15,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (16,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (17,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (18,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (19,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (20,109900,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (21,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (22,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (23,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (24,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (25,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (26,132700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (27,163400,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (28,163400,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (29,163400,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (30,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (31,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (32,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (33,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (34,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (35,325200,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (36,560100,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (37,560100,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (38,560100,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (39,560100,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (40,799600,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (41,799600,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (42,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (43,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (44,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (45,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (46,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1),
 (47,198700,'2023-01-01 00:00:00','2023-12-31 00:00:00',1);


CREATE TABLE `tblratetypes` (
  `rtRateTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `rtRateType` varchar(25) DEFAULT NULL,
  `rtDescription` varchar(100) DEFAULT NULL,
  `rtSortOrder` int(11) DEFAULT NULL,
  `rtActive` bit(1) DEFAULT NULL,
  PRIMARY KEY (`rtRateTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO tblratetypes (rtRateType,rtDescription,rtSortOrder,rtActive) VALUES
 ('없음','없음',1,1),
 ('시니어','시니어우대',1,1),
 ('프로모션코드','행사처리',1,1),
 ('회사코드','회사출장고정계약',1,1),
 ('그룹코드','특수그룹코드',1,1),
 ('요금코드','이벤트',1,1);










