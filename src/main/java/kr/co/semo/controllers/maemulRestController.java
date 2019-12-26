package kr.co.semo.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import kr.co.semo.helper.DownloadHelper;
import kr.co.semo.helper.PageData;
import kr.co.semo.helper.RegexHelper;
import kr.co.semo.helper.TimeHelper;
import kr.co.semo.helper.UploadItem;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.model.Maemul;
import kr.co.semo.service.MaemulFileService;
import kr.co.semo.service.MaemulService;

@RestController
public class maemulRestController {
   @Autowired
   WebHelper webHelper;

   @Autowired
   DownloadHelper downloadHelper;

   @Autowired
   RegexHelper regexHelper;
   
   // service 패턴 구현체 주입
   @Autowired
   MaemulService maemulService;

   @Autowired
   MaemulFileService maemulFileService;
   /**"/프로젝트이름" 에 해당하는 Contextpath 변수 주입 */
   @Value("#{servletContext.contextPath}")
   String ContextPath;
   
   /** 실행된 시간을 저장하기 위한 변수 */
   @Autowired TimeHelper timeHelper;

   
   /** 매물 상세 페이지 */
   // 사용되지 않음 
   @RequestMapping(value="/maemul/{maemul_num}", method=RequestMethod.GET)
   public Map<String, Object> get(@PathVariable("maemul_num") int maemul_num) {
      if(maemul_num == 0) {
         return webHelper.getJsonWarning("매물번호가 없습니다.");
      }
      
      Maemul input = new Maemul();
      input.setMaemul_num(maemul_num);
      
      // 조회 결과를 저장할 객체 선언 
      Maemul output = new Maemul();
      
      try {
         output = maemulService.getMaemulItem(input);
      } catch (Exception e) {
         return webHelper.getJsonError(e.getLocalizedMessage());
      }
      
      /** view 처리 */
      Map<String, Object> data = new HashMap<String, Object>();
      data.put("item", output);
      System.out.println(output);
      return webHelper.getJsonData(data);
   }
   
   /** 매물 다중 조회를 위한 페이지 */
   /** 메인페이지의 매물리스트  */
   @RequestMapping(value="/maemul", method = RequestMethod.GET)
   public Map<String, Object> get_list(HttpServletRequest request) {
               
      /** 1) 필요한 변수값 생성 */
     // 매물번호를 받습니다. 
      String[] TTest = request.getParameterValues("M_number");
      Maemul input = new Maemul();
      List<Maemul> output = new ArrayList<Maemul>();
      UploadItem uploadItem = new UploadItem();
      List<UploadItem> Fileoutput = null;
      
      List<Integer> TT = new ArrayList<Integer>();

      for(int i = 0; i<TTest.length; i++) {
         
         
         TT.add(Integer.parseInt(TTest[i]));
         input.setMaemul_num(TT.get(i));
         try {
            Maemul middle;
            middle = maemulService.getMain(input);
            output.add(middle);
         } catch(Exception e) {
            return webHelper.getJsonWarning("해당하는 매물이 없습니다.");
         }

         uploadItem.setMaemul_num(output.get(i).getMaemul_num());
         
         try { 
              Fileoutput=maemulFileService.getFileItem(uploadItem);
              // 건물사진 0번쨰 
              uploadItem = Fileoutput.get(0);
              output.get(i).setFile_path(uploadItem.getFilePath());
              // 리스트 초기화 
              Fileoutput.clear();            
           } catch(Exception e) { 
              return webHelper.getJsonWarning("조회에 실패했습니다.");
                    
           }
      } 
      Map<String, Object> data = new HashMap<String, Object>();
      data.put("output", output);         
      return data;
   }
   
   /** 매물 등록에 대한 action페이지 */
   // 사용하지 않음 
   @RequestMapping(value="/maemul", method=RequestMethod.POST)
   public Map<String, Object> post() {
      // 업로드 시작
            try {
               webHelper.upload();
            } catch (Exception e) {
               e.printStackTrace();
               return webHelper.getJsonError(e.getLocalizedMessage());
            }
            String time = timeHelper.timeout();
            
            /** 매물 초기 변수 선언 */
            int monthly;
            int warrenty;
            int floor;
            int all_floor;
            int comple_year;
            int parking;
            int elv;
            int sale;
            int pre_war;
            int pre_month;
            int manage_ex;
            int premium;
            
            /** 매물이미지 초기변수 선언  */
            String file_dir= "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload";
                                  
            /** 업로드된 정보 추출하기 */
            // 파일 정보 
            List<UploadItem> fileList = webHelper.getFileList();
            // 그 밖의 일반 데이터를 저장하기 위한 컬렉션 
            Map<String, String> paramMap = webHelper.getParamMap();  // paramMap에서 key값 subject의 value를 호출한다
                                 
            /** 매물 덱스트 데이터 추출  */
            // 매물주소
            String item_addrst = paramMap.get("item_addrst");
            // 상세주소
            String item_addrnd = paramMap.get("item_addrnd");
            // 건물정보 공개, 비공개
            String select_type = paramMap.get("rdo");
            // 건물명
            String build_name = paramMap.get("maemul_name");
            // 해당 층수 
            String Floor = paramMap.get("numberfloors");
            if (Floor == null || Floor.trim().equals("")) {
               floor = 0;
            } else {
               floor = Integer.parseInt(Floor);
            }
            // 전체층수 
            String All_floor = paramMap.get("maemulfloors");
            if (All_floor == null || All_floor.trim().equals("")) {
               all_floor =0;
            } else {
               all_floor = Integer.parseInt(All_floor);
            }
            //계약면적
            String All_width = paramMap.get("maemulsize");
            //전용면적
            String pri_width = paramMap.get("maemulsize1");
            // 난방정보
            String heating = paramMap.get("heatform");
            // 화장실 정보 
            String toilet  = paramMap.get("toiletform");
            // 준공년도 
            String Comple_year = paramMap.get("yearform");
            if (Comple_year == null || Comple_year.trim().equals("")) {
               comple_year = 0;
            } else {
               comple_year = Integer.parseInt(Comple_year);
            }
            // Y=즉시입주, N=입주협의
            String movein = paramMap.get("nowbtn");
            // 매물제목 
            String title = paramMap.get("explain_name");
            // 매물 상세 텍스트 
            String content = paramMap.get("detail_text");
            // 비공개 메모
            String hidden = paramMap.get("notopen_memo");
            // 주차대수
            String Parking = paramMap.get("parkuse");
            if (Parking == null || Parking.trim().equals("")) {
               parking = 0;
            } else {
               parking = Integer.parseInt(Parking);
            }
            // 엘레베이터 층수 
            String Elv = paramMap.get("elevause");
            if (Elv == null || Elv.trim().equals("")) {
               elv = 0;
            } else {
               elv = Integer.parseInt(Elv);
            }
            // 월세 / 매매 선택 Y,N
            String select_sale = paramMap.get("addmaemul");
            // 월세 
            String Monthly = paramMap.get("monthrent");
            if (Monthly == null || Monthly.trim().equals("")) {
               monthly = 0;
            } else {
               monthly = Integer.parseInt(Monthly);
            }
            // 보증금 
            String Warrenty = paramMap.get("deposit");
            if (Warrenty == null || Warrenty.trim().equals("")) {
               warrenty = 0;
            } else {
               warrenty = Integer.parseInt(Warrenty);
            }
            
            // 매매가 
            String Sale = paramMap.get("buy");
            if (Sale == null || Sale.trim().equals("")) {
               sale = 0;
            } else {
               sale = Integer.parseInt(Sale);
            }
            // 기 보증금 
            String Pre_war = paramMap.get("gideposit");
            if(Pre_war == null || Pre_war.trim().equals("")) {
               pre_war = 0;
            } else {
               pre_war = Integer.parseInt(Pre_war);
            }
            // 기월세 
            String Pre_month = paramMap.get("gimonthrent");
            if (Pre_month == null || Pre_month.trim().equals("")) {
               pre_month = 0;
            } else {
               pre_month = Integer.parseInt(Pre_month);
            }
            // 관리비
            String Manage_ex = paramMap.get("manage");
            if (Manage_ex == null || Manage_ex.trim().equals("")) {
               manage_ex = 0;
            } else {
               manage_ex = Integer.parseInt(Manage_ex);
            }
            // 권리금 
            String Premium = paramMap.get("foregift");
            if (Premium == null || Premium.trim().equals("")) {
               premium = 0;
            } else {
               premium = Integer.parseInt(Premium);
            }
            // 위도
            double latitude = 12.12313;
            // 경도 
            double longitude = 291.123421;
            int co_num = 111;
            
            //조회결과 저장할 매물객체 선언 
            Maemul input = new Maemul();
            input.setItem_addrst(item_addrst);
            input.setItem_addrnd(item_addrnd);
            input.setSelect_type(select_type);
            input.setBuild_name(build_name);
            input.setFloor(floor);
            input.setAll_floor(all_floor);
            input.setAll_width(All_width);
            input.setPri_width(pri_width);
            input.setHeating(heating);
            input.setToilet(toilet);
            input.setComple_year(comple_year);
            input.setMovein(movein);
            input.setTitle(title);
            input.setContent(content);
            input.setHidden(hidden);
            input.setParking(parking);
            input.setElv(elv);
            input.setSelect_sale(select_sale);
            input.setMonthly(monthly);
            input.setWarrenty(warrenty);
            input.setSale(sale);
            input.setPre_war(pre_war);
            input.setPre_month(pre_month);
            input.setManage_ex(manage_ex);
            input.setPremium(premium);
            input.setLatitude(latitude);
            input.setLongitude(longitude);
            input.setCo_num(co_num);
               
            try {
               // 데이터 저장 
               // 데이터 저장 성공하면 파라미터로 전달되는 input객체에 PK값이 저장됨
               maemulService.AddMaemul(input);
               
               for(UploadItem fileitem :  fileList) {
                  fileitem.setFile_dir(file_dir);
                  fileitem.setReg_date(time);
                  fileitem.setEdit_date(time);
                  fileitem.setMaemul_num(input.getMaemul_num());
                  System.out.println(fileitem);
                  
                  maemulFileService.AddFile(fileitem);
               }
                        
            } catch (Exception e) {
               return webHelper.getJsonError(e.getLocalizedMessage());
            }
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("item", input);
            
            return webHelper.getJsonData(map);
   }
}
/*
 * package kr.co.semo.controllers;
 * 
 * import java.util.ArrayList; import java.util.HashMap; import java.util.List;
 * import java.util.Map;
 * 
 * import javax.servlet.http.HttpServletRequest;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.beans.factory.annotation.Value; import
 * org.springframework.web.bind.annotation.PathVariable; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * import kr.co.semo.helper.DownloadHelper; import
 * kr.co.semo.helper.RegexHelper; import kr.co.semo.helper.TimeHelper; import
 * kr.co.semo.helper.UploadItem; import kr.co.semo.helper.WebHelper; import
 * kr.co.semo.model.Maemul; import kr.co.semo.service.MaemulFileService; import
 * kr.co.semo.service.MaemulService;
 * 
 * @RestController public class maemulRestController {
 * 
 * @Autowired WebHelper webHelper;
 * 
 * @Autowired DownloadHelper downloadHelper;
 * 
 * @Autowired RegexHelper regexHelper;
 * 
 * // service 패턴 구현체 주입
 * 
 * @Autowired MaemulService maemulService;
 * 
 * @Autowired MaemulFileService maemulFileService;
 *//** "/프로젝트이름" 에 해당하는 Contextpath 변수 주입 */
/*
 * @Value("#{servletContext.contextPath}") String ContextPath;
 * 
 *//** 실행된 시간을 저장하기 위한 변수 */
/*
 * @Autowired TimeHelper timeHelper;
 * 
 * 
 *//** 매물 상세 페이지 */
/*
 * @RequestMapping(value="/maemul/{maemul_num}", method=RequestMethod.GET)
 * public Map<String, Object> get(@PathVariable("maemul_num") int maemul_num) {
 * if(maemul_num == 0) { return webHelper.getJsonWarning("매물번호가 없습니다."); }
 * 
 * Maemul input = new Maemul(); input.setMaemul_num(maemul_num);
 * 
 * // 조회 결과를 저장할 객체 선언 Maemul output = new Maemul();
 * 
 * try { output = maemulService.getMaemulItem(input); } catch (Exception e) {
 * return webHelper.getJsonError(e.getLocalizedMessage()); }
 * 
 *//** view 처리 */
/*
 * Map<String, Object> data = new HashMap<String, Object>(); data.put("item",
 * output); System.out.println(output); return webHelper.getJsonData(data); }
 * 
 *//** 매물 다중 조회를 위한 페이지 */
/*
 * 
 * @RequestMapping(value="/maemul", method = RequestMethod.GET) public
 * Map<String, Object> get_list(HttpServletRequest request) {
 * 
 *//** 1) 필요한 변수값 생성 */
/*
 * String log = webHelper.getString("log"); // 크기 지정안해줬는데왜...? String[] TTest =
 * request.getParameterValues("log");
 * 
 * Maemul input = new Maemul();
 * 
 * List<Maemul> output = new ArrayList<Maemul>(); UploadItem uploadItem = new
 * UploadItem(); List<UploadItem> Fileoutput = null;
 * 
 * System.out.println(log + "log!"); //Double Dga = Double.parseDouble(Ga);
 * //int Ga = Integer.parseInt(log); List<Integer> TT = new
 * ArrayList<Integer>();
 * 
 * 
 * 
 * for(int i = 0; i<TTest.length; i++) {
 * 
 * TT.add(Integer.parseInt(TTest[i])); input.setMaemul_num(TT.get(i));
 * 
 * try { Maemul middle; middle = maemulService.getMain(input);
 * output.add(middle); } catch(Exception e) { return
 * webHelper.getJsonWarning("해당하는 매물이 없습니다."); }
 * 
 * uploadItem.setMaemul_num(output.get(i).getMaemul_num());
 * 
 * try { Fileoutput=maemulFileService.getFileItem(uploadItem); // 누적 uploadItem
 * = Fileoutput.get(0); output.get(i).setFile_path(uploadItem.getFilePath()); //
 * 리스트 초기화 Fileoutput.clear(); } catch(Exception e) { return
 * webHelper.getJsonWarning("조회에 실패했습니다.");
 * 
 * } } //for end
 * 
 * //input.setMaemul_num(Ga); //input.setLongitude(Dga);
 * 
 * 
 * try { output = maemulService.getMain(input); } catch(Exception e) { return
 * webHelper.getJsonWarning("해당하는 매물이 없습니다."); }
 * 
 * 
 * Map<String, Object> data = new HashMap<String, Object>(); data.put("output",
 * output); return data; }
 * 
 * 
 * 
 *//** 매물 등록에 대한 action페이지 */
/*
 * @RequestMapping(value="/maemul", method=RequestMethod.POST) public
 * Map<String, Object> post() { // 업로드 시작 try { webHelper.upload(); } catch
 * (Exception e) { e.printStackTrace(); return
 * webHelper.getJsonError(e.getLocalizedMessage()); } String time =
 * timeHelper.timeout();
 * 
 *//** 매물 초기 변수 선언 */
/*
 * int monthly; int warrenty; int floor; int all_floor; int comple_year; int
 * parking; int elv; int sale; int pre_war; int pre_month; int manage_ex; int
 * premium;
 * 
 *//** 매물이미지 초기변수 선언 */
/*
 * String file_dir=
 * "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload";
 * 
 * 
 * 
 *//** 업로드된 정보 추출하기 */
/*
 * // 파일 정보 List<UploadItem> fileList = webHelper.getFileList(); // 그 밖의 일반 데이터를
 * 저장하기 위한 컬렉션 Map<String, String> paramMap = webHelper.getParamMap(); //
 * paramMap에서 key값 subject의 value를 호출한다
 * 
 * 
 * 
 *//** 매물 덱스트 데이터 추출 *//*
						 * // 매물주소 String item_addrst = paramMap.get("item_addrst"); // 상세주소 String
						 * item_addrnd = paramMap.get("item_addrnd"); // 건물정보 공개, 비공개 String select_type
						 * = paramMap.get("rdo"); // 건물명 String build_name =
						 * paramMap.get("maemul_name"); // 해당 층수 String Floor =
						 * paramMap.get("numberfloors"); if (Floor == null || Floor.trim().equals("")) {
						 * floor = 0; } else { floor = Integer.parseInt(Floor); } // 전체층수 String
						 * All_floor = paramMap.get("maemulfloors"); if (All_floor == null ||
						 * All_floor.trim().equals("")) { all_floor =0; } else { all_floor =
						 * Integer.parseInt(All_floor); } //계약면적 String All_width =
						 * paramMap.get("maemulsize"); //전용면적 String pri_width =
						 * paramMap.get("maemulsize1"); // 난방정보 String heating =
						 * paramMap.get("heatform"); // 화장실 정보 String toilet =
						 * paramMap.get("toiletform"); // 준공년도 String Comple_year =
						 * paramMap.get("yearform"); if (Comple_year == null ||
						 * Comple_year.trim().equals("")) { comple_year = 0; } else { comple_year =
						 * Integer.parseInt(Comple_year); } // Y=즉시입주, N=입주협의 String movein =
						 * paramMap.get("nowbtn"); // 매물제목 String title = paramMap.get("explain_name");
						 * // 매물 상세 텍스트 String content = paramMap.get("detail_text"); // 비공개 메모 String
						 * hidden = paramMap.get("notopen_memo"); // 주차대수 String Parking =
						 * paramMap.get("parkuse"); if (Parking == null || Parking.trim().equals("")) {
						 * parking = 0; } else { parking = Integer.parseInt(Parking); } // 엘레베이터 층수
						 * String Elv = paramMap.get("elevause"); if (Elv == null ||
						 * Elv.trim().equals("")) { elv = 0; } else { elv = Integer.parseInt(Elv); } //
						 * 월세 / 매매 선택 Y,N String select_sale = paramMap.get("addmaemul"); // 월세 String
						 * Monthly = paramMap.get("monthrent"); if (Monthly == null ||
						 * Monthly.trim().equals("")) { monthly = 0; } else { monthly =
						 * Integer.parseInt(Monthly); } // 보증금 String Warrenty =
						 * paramMap.get("deposit"); if (Warrenty == null || Warrenty.trim().equals(""))
						 * { warrenty = 0; } else { warrenty = Integer.parseInt(Warrenty); }
						 * 
						 * // 매매가 String Sale = paramMap.get("buy"); if (Sale == null ||
						 * Sale.trim().equals("")) { sale = 0; } else { sale = Integer.parseInt(Sale); }
						 * // 기 보증금 String Pre_war = paramMap.get("gideposit"); if(Pre_war == null ||
						 * Pre_war.trim().equals("")) { pre_war = 0; } else { pre_war =
						 * Integer.parseInt(Pre_war); } // 기월세 String Pre_month =
						 * paramMap.get("gimonthrent"); if (Pre_month == null ||
						 * Pre_month.trim().equals("")) { pre_month = 0; } else { pre_month =
						 * Integer.parseInt(Pre_month); } // 관리비 String Manage_ex =
						 * paramMap.get("manage"); if (Manage_ex == null || Manage_ex.trim().equals(""))
						 * { manage_ex = 0; } else { manage_ex = Integer.parseInt(Manage_ex); } // 권리금
						 * String Premium = paramMap.get("foregift"); if (Premium == null ||
						 * Premium.trim().equals("")) { premium = 0; } else { premium =
						 * Integer.parseInt(Premium); } // 위도 double latitude = 12.12313; // 경도 double
						 * longitude = 291.123421; int co_num = 111;
						 * 
						 * //조회결과 저장할 매물객체 선언 Maemul input = new Maemul();
						 * input.setItem_addrst(item_addrst); input.setItem_addrnd(item_addrnd);
						 * input.setSelect_type(select_type); input.setBuild_name(build_name);
						 * input.setFloor(floor); input.setAll_floor(all_floor);
						 * input.setAll_width(All_width); input.setPri_width(pri_width);
						 * input.setHeating(heating); input.setToilet(toilet);
						 * input.setComple_year(comple_year); input.setMovein(movein);
						 * input.setTitle(title); input.setContent(content); input.setHidden(hidden);
						 * input.setParking(parking); input.setElv(elv);
						 * input.setSelect_sale(select_sale); input.setMonthly(monthly);
						 * input.setWarrenty(warrenty); input.setSale(sale); input.setPre_war(pre_war);
						 * input.setPre_month(pre_month); input.setManage_ex(manage_ex);
						 * input.setPremium(premium); input.setLatitude(latitude);
						 * input.setLongitude(longitude); input.setCo_num(co_num);
						 * 
						 * try { // 데이터 저장 // 데이터 저장 성공하면 파라미터로 전달되는 input객체에 PK값이 저장됨
						 * maemulService.AddMaemul(input);
						 * 
						 * for(UploadItem fileitem : fileList) { fileitem.setFile_dir(file_dir);
						 * fileitem.setReg_date(time); fileitem.setEdit_date(time);
						 * fileitem.setMaemul_num(input.getMaemul_num()); System.out.println(fileitem);
						 * 
						 * maemulFileService.AddFile(fileitem); }
						 * 
						 * } catch (Exception e) { return
						 * webHelper.getJsonError(e.getLocalizedMessage()); } Map<String, Object> map =
						 * new HashMap<String, Object>(); map.put("item", input);
						 * 
						 * return webHelper.getJsonData(map); } }
						 */