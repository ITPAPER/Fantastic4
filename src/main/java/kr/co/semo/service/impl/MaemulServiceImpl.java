package kr.co.semo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.semo.model.Maemul;
import kr.co.semo.service.MaemulService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MaemulServiceImpl implements MaemulService{

   @Autowired
    SqlSession sqlSession;

    @Override
    public Maemul getMaemulItem(Maemul input) throws Exception {
        Maemul result = null;

        try {
            result = sqlSession.selectOne("MaemulMapper.selectItem", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }
    
    @Override
    public List<Maemul> getMaemulItem_Co(Maemul input) throws Exception {
       List<Maemul> result = null;

        try {
            result = sqlSession.selectList("MaemulMapper.selectItem_Co", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }

    public List<Maemul> getMaemulList(Maemul input) throws Exception {
        List<Maemul> result = null;

        try {
            result = sqlSession.selectList("MaemulMapper.selectList", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }

        return result;
    }
    /**
     * 메인에 전달할 매물 데이터를 처리하기 위함 
     */
    @Override
   public Maemul getMain(Maemul input) throws Exception {
       Maemul output = null;
      
      try {
         output = sqlSession.selectOne("MaemulMapper.selectMain", input);
         
         if (output == null) {
            throw new NullPointerException("result == null");
         }
      } catch(NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("조회된 데이터가 없습니다.");
      } catch(Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 조회에 실패했습니다.");
      }
      return output;
   }
        

    @Override
    public int getMaemulCount(Maemul input) throws Exception {
        int result = 0;
        
        try {
            result = sqlSession.selectOne("MaemulMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
    }

    @Override
    public int AddMaemul(Maemul input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("MaemulMapper.insertItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }

        return result;
    }

    @Override
    public int editMaemul(Maemul input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.update("MaemulMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정에 실패했습니다.");
        }

        return result;
    }

    @Override
    public int deleteMaemul(Maemul input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.delete("MaemulMapper.deleteItem", input);

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
   public List<Maemul> getMaemulManage(Maemul input){
      List<Maemul> result = null;
      result = sqlSession.selectList("MaemulMapper.selectList", input);
      return result;
   }

   

   
}