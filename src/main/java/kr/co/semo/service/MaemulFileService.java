package kr.co.semo.service;

import java.util.List;

import kr.co.semo.helper.UploadItem;;

public interface MaemulFileService {
   
   /**
    * @param File(maemul_num)을 담고 있는 beans
    * @return UploadItem
    * @throw Exception 
   */
   public List<UploadItem> getFileItem(UploadItem fileitem) throws Exception;
   
   /**
    * @param File 데이터를 담고 있는 beans
    * @return int 
    * @throw Exception
    */
   public int AddFile(UploadItem fileitem) throws Exception;
   
   /**
    * @param File 데이터를 담고 있는 beans
    * @return int 
    * @throw Exception
    */
   public int deleteMaemulFile(UploadItem input) throws Exception;
   
   /**
    * @param File 데이터를 담고 있는 beans
    * @return int 
    * @throw Exception
    */
   public int updateMaemulFile(UploadItem input) throws Exception;
}