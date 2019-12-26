package kr.co.semo.service;

import java.util.List;

import kr.co.semo.model.Maemul;

public interface MaemulService { 
   /**
    * 매물 데이터 가져오기  
    * @param maemul 등록할 정보를 담고 있는 Beans
    * @return Maemul
    * @throws Exception
    */
   public Maemul getMaemulItem(Maemul input) throws Exception;

   /**
    * 저장된 모든 매물 조회
    * @param input
    * @return   List<Maemul>
    * @throws Exception
    */
   public List<Maemul> getMaemulList(Maemul input) throws Exception;
   
   /**
    * 메인에 데이터를 전달해줄 매물조회 
    * @param input
    * @return List<Maemul>
    * @throws Exception
    */
   public List<Maemul> getMaemulManage(Maemul input);
   
   public Maemul getMain(Maemul input) throws Exception;
   
   public int getMaemulCount(Maemul input) throws Exception;
   
   /**
    * 매물 데이터 등록하기 
    * @param maemul 등록할 정보를 담고 있는 Beans
    * @return int 
    * @throws Exception
    */
   public int AddMaemul(Maemul input) throws Exception;

   /**
    * 매물 데이터 갱신하기 
    * @param maemul 등록할 정보를 담고 있는 Beans
    * @return int 
    * @throws Exception
    */
   public int editMaemul(Maemul input) throws Exception;

   public int deleteMaemul(Maemul input) throws Exception;
   
   // 매물 파일 삭제를 위한 매물 번호 추출
   public List<Maemul> getMaemulItem_Co(Maemul input) throws Exception;
   
   
}