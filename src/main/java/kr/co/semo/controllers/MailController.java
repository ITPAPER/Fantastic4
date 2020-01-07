package kr.co.semo.controllers;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.semo.helper.MailHelper;
import kr.co.semo.helper.RegexHelper;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.model.Co_member;
import kr.co.semo.model.Ge_member;
import kr.co.semo.service.Co_memberService;
import kr.co.semo.service.Ge_memberService;


@Controller
public class MailController {

   @Autowired
   WebHelper webHelper;

   @Autowired
   RegexHelper regexHelper;

   @Autowired
   MailHelper mailHelper;

   @Autowired
   Co_memberService co_memberService;

   @Autowired
   Ge_memberService ge_memberService;

   /** 발송 폼 구성 페이지 */
   @RequestMapping(value = "Pw_change.do", method = RequestMethod.GET)
   public String Pw_change() {      
      return "Pw_change";
   }

   // Pw_changeok 페이지
   @RequestMapping(value = "Pw_changeok.do")
   public String pwChangeok(Locale locale, Model model) {
      return "Pw_changeok";
   }

   /** action 페이지 */
   @RequestMapping(value = "send.do", method = RequestMethod.POST)
   public ModelAndView send(Model model, HttpServletResponse response, HttpServletRequest request) {
      /** 사용자의 입력값 받기 */
      String email = webHelper.getString("email");
      HttpSession session = request.getSession();
      session.setAttribute("mailId", email);
      session.setMaxInactiveInterval(60*60);
      
      String subject = "비밀번호 변경을 위한 링크 주소입니다";
      String content = "http://itproject.ezenac.co.kr/semoproject/Pw_reset.do";

      /** 입력여부 검사후, 입력되지 않은 경우 이전 페이지로 보내기 */
      // 받는 메일 주소 검사하기
      if (!regexHelper.isValue(email)) {
         return webHelper.redirect(null, "받는 사람의 이메일 주소를 입력하세요.");
      }

      if (!regexHelper.isEmail(email)) {
         return webHelper.redirect(null, "받는 사람의 이메일 주소가 잘못되었습니다.");
      }

      // 2) 사용자가 입력한 이메일 값을 Beans에 저장 (공인중개사 회원)
      Co_member input = new Co_member();
      input.setEmail_id(email);
      // 3) 사용자가 입력한 이메일 값을 Beans에 저장 (일반 회원)
      Ge_member input2 = new Ge_member();
      input2.setEmail_id(email);
      
      // 조회결과를 저장할 객체 선언
      Co_member output = null;
      Ge_member output2 = null;

      try { // 데이터 조회
         try {
            output = co_memberService.getEmail_item(input);
            /** 메일 발송 처리 */
            try {
               // sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
               mailHelper.sendMail(email, subject, content);
            } catch (Exception e) {
               e.printStackTrace();
               return webHelper.redirect(null, "메일 발송에 실패했습니다.");
            }

            /** 결과처리 */
            return webHelper.redirect("Pw_changeok.do", "메일 발송에 성공했습니다.");
         } catch (Exception e) {
            e.getLocalizedMessage();
         }
         try {
            output2 = ge_memberService.getEmail_item2(input2);
            /** 메일 발송 처리 */
            try {
               // sendMail() 메서드 선언시 throws를 정의했기 때문에 예외처리가 요구된다.
               mailHelper.sendMail(email, subject, content);
            } catch (Exception e) {
               e.printStackTrace();
               return webHelper.redirect(null, "메일 발송에 실패했습니다.");
            }

            /** 결과처리 */
            return webHelper.redirect("Pw_changeok.do", "메일 발송에 성공했습니다.");
         } catch (Exception e) {
            e.getLocalizedMessage();
            return webHelper.redirect(null, e.getLocalizedMessage());
         }
      } catch (Exception e) {
         return webHelper.redirect(null, e.getLocalizedMessage());
      }

   }
}