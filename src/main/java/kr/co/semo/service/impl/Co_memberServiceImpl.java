package kr.co.semo.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.semo.model.Co_member;
import kr.co.semo.model.Ge_member;
import kr.co.semo.service.Co_memberService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Co_memberServiceImpl implements Co_memberService {

	@Autowired
	SqlSession sqlSession;

	@Override
	public Co_member getCo_memberItem(Co_member input) throws Exception {
		Co_member result = null;

		try {
			result = sqlSession.selectOne("Co_memberMapper.selectItem", input);

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

	public List<Co_member> getCo_memberList(Co_member input) throws Exception {
		List<Co_member> result = null;

		try {
			result = sqlSession.selectList("Co_memberMapper.selectList", input);

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
	public int getCo_memberCount(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("Co_memberMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int addCo_member(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("Co_memberMapper.insertItem", input);

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
	public int editCo_member(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Co_memberMapper.updateItem", input);

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
	public int deleteCo_member(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("Co_memberMapper.deleteItem", input);

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
	public Co_member getLoginuser_item(Co_member input) throws Exception {
		Co_member result = null;

		try {
			result = sqlSession.selectOne("Co_memberMapper.selectLoginUser", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("검색된 회원이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 검색에 실패했습니다..");
		}

		return result;
	}

	@Override
	public int editCo_memberPw(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Co_memberMapper.updateItemPw", input);

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
	public int editCo_approval(Co_member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("Co_memberMapper.updateApproval", input);

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
	public int editCo_memberRecent(Co_member input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.update("Ge_memberMapper.updateRecent", input);

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
	public List<Co_member> getCo_searchList(Co_member co_input) throws Exception {
        List<Co_member> result = null;

        try {
            result = sqlSession.selectList("Co_memberMapper.searchList", co_input);

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
    public Co_member getEmail_item(Co_member input) throws Exception {
       Co_member result = null;

       try {
          result = sqlSession.selectOne("Co_memberMapper.checkEmail", input);

          if (result == null) {
             throw new NullPointerException("result=null");
          }
       } catch (NullPointerException e) {
          log.error(e.getLocalizedMessage());
          throw new Exception("가입된 이메일이 아닙니다.");
       } catch (Exception e) {
          log.error(e.getLocalizedMessage());
          throw new Exception("이메일 검색에 실패했습니다.");
       }

       return result;
    }
     
     @Override
     public int getPassword_item(Co_member input) throws Exception {
        int result = 0;
        
        try {
             result = sqlSession.update("Co_memberMapper.updatePassword", input);

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
}

