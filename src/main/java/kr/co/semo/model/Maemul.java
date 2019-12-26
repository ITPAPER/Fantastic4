package kr.co.semo.model;

import lombok.Data;

@Data
public class Maemul {
   // 매물번호
      private int maemul_num;
      // 매물주소
      private String item_addrst; 
      // 상세주소
      private String item_addrnd;
      // 건물정보 공개, 비공개 
      private String select_type;
      // 건물명
      private String build_name;
      // 해당 층수 
      private int floor;
      // 전체 층수 
      private int all_floor;
      // 계약면적
      private String all_width;
      // 전용면적
      private String pri_width;
      // 난방 정보 
      private String heating;
      // 화장실 정보 
      private String toilet;
      // 준공년도 
      private int comple_year;
      // 즉시입주(Y), 협의가능(N)
      private String movein;
      // 매물 제목
      private String title;
      // 매물 상세 텍스트
      private String content;
      // 비공개 메모 
      private String hidden;
      // 주차대수
      private int parking;
      // 엘레베이터 층수 
      private int elv;
      // 웰세/매매 선택 Y,N
      private String select_sale;
      // 월세 
      private int monthly;
      // 보증금
      private int warrenty;
      // 매매가
      private int sale;
      // 기 보증금 
      private int pre_war;
      // 기 월세 
      private int pre_month;
      // 관리비 
      private int manage_ex;
      // 권리금
      private int premium;
      // 위도 
      private double latitude;
      // 경도 
      private double longitude;
      // 중개사 회원 번호 
      private int co_num;
      // 이미지 이름 
      private String File_path;
      
      // 등록일(매물관리)
      private String reg_date;
      
      /** 페이지 구현을 위한 static 변수  */
      /** LiMIT 절에서 사용할 조회 시작 위치 */
      private static int offset;
      
      /** LIMIT 절에서 사용할 조회할 데이터수   */
      private static int listCount;

      public static int getOffset() {
         return offset;
      }

      public static void setOffset(int offset) {
         Maemul.offset = offset;
      }

      public static int getListCount() {
         return listCount;
      }

      public static void setListCount(int listCount) {
         Maemul.listCount = listCount;
      }
}