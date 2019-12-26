package kr.co.semo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.semo.helper.UploadItem;
import kr.co.semo.service.MaemulFileService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MaemulFileServiceImpl implements MaemulFileService {

   @Autowired
    SqlSession sqlSession;

   @Override
   public List<UploadItem> getFileItem(UploadItem fileitem) throws Exception {
      
      List<UploadItem> result = null;
      try {
         result = sqlSession.selectList("MaemulFileMapper.selectItem", fileitem);
         
         if (result == null) {
            throw new NullPointerException("result== null");
         }
      } catch(NullPointerException e) { 
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 데이터가 없습니다.");
      }  catch(Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return result;
   }
   
   @Override
   public int AddFile(UploadItem fileitem) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.insert("MaemulFileMapper.insertItem", fileitem);
         
      } catch(NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("저장된 데이터가 없습니다.");
      } catch(Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 저장에 실패했습니다.");
      }
      return result;
   }
   
   //매물 파일 삭제
   @Override
   public int deleteMaemulFile(UploadItem input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.delete("MaemulFileMapper.deleteItem", input);

         if (result == 0) {
            throw new NullPointerException("result=0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("삭제된 데이터가 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 삭제에 실패했습니다.");
      }

      return result;
   }

   @Override
   public int updateMaemulFile(UploadItem input) throws Exception {
      int result = 0;
      
      try {
         result = sqlSession.update("MaemulFileMapper.updateItem", input);
         
         if (result ==0) {
            throw new NullPointerException("result=0");
         }
      }catch(NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("갱신된 데이터가 없습니다.");
      }catch(Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("매물 갱신에 실패했습니다.");
      }
      return result;
   }
   
   
}
