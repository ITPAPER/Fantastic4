package kr.co.semo.controllers;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.sun.mail.iap.Response;

import kr.co.semo.helper.DownloadHelper;
import kr.co.semo.helper.FileHelper;
import kr.co.semo.helper.PageData;
import kr.co.semo.helper.RegexHelper;
import kr.co.semo.helper.TimeHelper;
import kr.co.semo.helper.UploadItem;
import kr.co.semo.helper.WebHelper;
import kr.co.semo.helper.RetrofitHelper;
import kr.co.semo.model.Co_member;
import kr.co.semo.model.GraphData;
import kr.co.semo.model.GraphData2;
import kr.co.semo.model.Kakao;
import kr.co.semo.model.Maemul;
import kr.co.semo.model.Kakao.Documents;
import kr.co.semo.model.Kakao.Documents.Road_address;
import kr.co.semo.service.Co_memberService;
import kr.co.semo.service.MaemulFileService;
import kr.co.semo.service.MaemulService;
import kr.co.semo.service.impl.ApiKakaoService;
import retrofit2.Call;
import retrofit2.Retrofit;

@Controller
public class maemulController {
	@Autowired
	WebHelper webHelper;

	@Autowired
	DownloadHelper downloadHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	RetrofitHelper retrofitHelper;

	// service 패턴 구현체 주입
	@Autowired
	MaemulService maemulService;

	@Autowired
	Co_memberService co_memberService;

	@Autowired
	MaemulFileService maemulFileService;
	/** "/프로젝트이름" 에 해당하는 Contextpath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String ContextPath;

	/** 실행된 시간을 저장하기 위한 변수 */
	@Autowired
	TimeHelper timeHelper;
	/** csv 파일을 읽어오기 위한 헬퍼 */
	@Autowired
	FileHelper fileHelper;

	@RequestMapping(value = "/view.ok", method = RequestMethod.GET)
	public ModelAndView view_ok(Model model, HttpServletResponse response,
			HttpServletRequest request) {
		
		Cookie[] getCookie = request.getCookies();
		Cookie cookie = null;
		
		//cookie 매물 번호 중복 체크를 위한 변수
		int overlab = 0;
		
		//URL로 전달받은 매물번호
		int maemul_num = webHelper.getInt("maemul_num");
		
		//일반회원 관심매물 처리를 위한 쿠키 생성
		//세션에 저장되어있는 userType ==1 (일반회원) 이면 쿠키 생성
		HttpSession session = request.getSession();
		int userType = 0;
		if (session.getAttribute("userType")!=null) {
			userType = (int) session.getAttribute("userType");
		}
		
		if (userType == 1) {
			String cook_maemulNum = null;
			String maemulNum = null;
			maemulNum = Integer.toString(maemul_num) + "A";
			//JSessionID 는 항상 존재 하기 때문에 index 값을 1로 설정
			if (getCookie.length == 1) {
				cookie = new Cookie("maemul_num", maemulNum);
				response.addCookie(cookie);
				System.out.println(cookie.getValue() + "oooooooooooooooooooooo");
				
			} else {
				for (int i = 0; i < getCookie.length; i++) {
					//cookie 의 name 이 maemul_num 일경우 실행
					if (getCookie[i].getName().equals("maemul_num")){
						//기존 쿠키 값 도출
						cook_maemulNum = getCookie[i].getValue();
						//중복 체크를 위한 로직
						String[] split = cook_maemulNum.split("A");
						for (int j = 0; j < split.length; j++) {
							if (split[j].equals(Integer.toString(maemul_num))){
								 overlab = 1;
							}
						}
						
						if (overlab == 1) {
							cookie = new Cookie("maemul_num", cook_maemulNum);
						} else {
							cookie = new Cookie("maemul_num", cook_maemulNum + maemulNum);
						}
						
						response.addCookie(cookie);
						System.out.println("//cookie 의 name 이 maemul_num 일경우 실행--- getCookie[" + i +"].getName() : " + getCookie[i].getName() + "--- getCookie[" + i + "].getValue() : " + getCookie[i].getValue());
					}
				}
			}
			System.out.println(cook_maemulNum + " ooooooooooooooooo " + maemulNum + " oooooooooooooooooooooooo");
		}				

		// 조회할 매물에 대한 PK값
		if (maemul_num == 0) {
			webHelper.redirect(null, "매물번호가 없습니다.");
		}

		// 데이터 조회하기
		// 데이터 조회에 필요한 조건값 Beans에 저장하기
		Maemul input = new Maemul();
		input.setMaemul_num(maemul_num);

		UploadItem fileinput = new UploadItem();

		// 데이터 조회 결과를 저장할 객체 선언
		Maemul output = new Maemul();
		List<UploadItem> fileoutput;

		try {
			output = maemulService.getMaemulItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		try {
			fileinput.setMaemul_num(output.getMaemul_num());

			fileoutput = maemulFileService.getFileItem(fileinput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		System.out.println(fileoutput + "입니다.");
		
		
		// 중개사 회원 정보 출력을 위한 비즈 생성
		Co_member coInput = new Co_member();
		coInput.setId(output.getCo_num());
		
		Co_member coOutput = new Co_member();
		
		try {
			coOutput = co_memberService.getCo_memberItem(coInput);
		} catch (Exception e) {
			e.getLocalizedMessage();
		}
		
		System.out.println("###########################" + coOutput.getCo_name() + "###########################");
		
		model.addAttribute("coOutput", coOutput);
		model.addAttribute("output", output);
		model.addAttribute("fileoutput", fileoutput);
		return new ModelAndView("Maemul.detailed");

	}
	
	  @RequestMapping(value="/maemul_manage_do", method=RequestMethod.GET) 
	     public ModelAndView list_do(Model model, HttpServletRequest request, HttpServletResponse respone ) {  
	        
		  	// session 에서 userid 가져오기
		  	HttpSession session = request.getSession();
		  	int userid = (int) session.getAttribute("userNum");
		  	
		  	//임시 데이터 입니다. 
	        int co_num = userid;  
	        //검색어 
	        int keyword = webHelper.getInt("keyword", 0);
	        int nowPage = webHelper.getInt("page", 1);
	        int totalCount = 0; // 전체 게시글 수
	        int listCount = 3; // 한 페이지당 표시할 목록 수 
	        int pageCount = 5; // 한 그룹당 표시할 페이지 번호수
	        // 데이터조회 
	        Maemul input = new Maemul(); 
	        input.setCo_num(co_num);
	        input.setMaemul_num(keyword);
	        
	        List<Maemul> output = new ArrayList<Maemul>(); 
	        UploadItem uploadItem = new UploadItem(); 
	        List<UploadItem> Fileoutput = null; // 이미지 조회결과 들어올 객체  
	        PageData pageDate = null; // 페이지 번호를 계산한 결과가 저장될 객체
	        // 현재시각 
	        String time = null;
	        // DB에 저장되어 있는 매물의 등록시간(reg_date)
	        String Rtime = null;
	        
	       try {
	          // 전체 매물수 조회 
	          totalCount = maemulService.getMaemulCount(input);
	          // 페이지 번호 계산 
	          pageDate = new PageData(nowPage, totalCount, listCount, pageCount);
	         //SQL의 LIMIT절에서 사용될 값을 Beans의 static 변수에 저장 
	          Maemul.setOffset(pageDate.getOffset());
	          Maemul.setListCount(pageDate.getListCount());
	          
	          // 매물조회  
	          output = maemulService.getMaemulManage(input);
	          
	          if(output != null) {
	             for(int i=0; i<output.size(); i++) {
	                uploadItem.setMaemul_num(output.get(i).getMaemul_num());
	                
	                try {
	                   
	                   Fileoutput = maemulFileService.getFileItem(uploadItem);
	                   uploadItem = Fileoutput.get(0);
	                   output.get(i).setFile_path(uploadItem.getFilePath());
	                   time = uploadItem.getReg_date();
	                   // 매물 관리페이지의 매물등록시간view를 위한 매물등록시간 조회 
	                   Rtime = time.substring(0, time.indexOf(" "));
	                   output.get(i).setReg_date(Rtime);
	                   //
	                   Fileoutput.clear();
	                } catch (Exception e) {
	                   return webHelper.redirect(null, "조회실패했습니다!");
	               }
	             }
	          }                    
	          } catch (Exception e) {
	             return webHelper.redirect(null, e.getLocalizedMessage());
	            }
	             model.addAttribute("keyword", keyword);
	             model.addAttribute("output", output);
	             model.addAttribute("pageData", pageDate);
	             
	             return new ModelAndView("Maemul.manage");
	         }
	   /** 매물등록을 위한 기능구현  */
	
	@RequestMapping(value = "/maemul/add_ok", method = RequestMethod.POST)
	public ModelAndView add_ok(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		// 업로드 시작
		try {
			webHelper.upload();
		} catch (Exception e) {
			e.printStackTrace();
			return webHelper.redirect(null, "매물 업로드에 실패했습니다.");
		}

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
		// 시간 등록을 위한 선언
		String time = timeHelper.timeout();

		/** 업로드된 정보 추출하기 */
		// 파일 정보
		List<UploadItem> fileList = webHelper.getFileList();
		// 그 밖의 일반 데이터를 저장하기 위한 컬렉션
		Map<String, String> paramMap = webHelper.getParamMap(); // paramMap에서 key값 subject의 value를 호출한다

		/** 매물 덱스트 데이터 추출 */
		// 매물주소
		String item_addrst = paramMap.get("item_addrst");
		// 상세주소
		String item_addrnd = paramMap.get("item_addrnd");
		// 건물정보 공개, 비공개
		String select_type = paramMap.get("rdo");
		// 건물명
		String build_name = paramMap.get("maemul_name");

		// 해당 층수
		System.out.println(paramMap.get("numberfloors") + "테스트중입니다 람쥐0");
		String Floor = paramMap.get("numberfloors");
		System.out.println(Floor + "테스트중입니다 람쥐1");
		floor = Integer.parseInt(Floor);
		System.out.println(floor + "테스트중입니다 람쥐2");

		// 전체층수
		String All_floor = paramMap.get("maemulfloors");
		if (All_floor == null || All_floor.trim().equals("")) {
			all_floor = 0;
		} else {
			all_floor = Integer.parseInt(All_floor);
		}
		// 계약면적
		String All_width = paramMap.get("maemulsize");
		// 전용면적
		String pri_width = paramMap.get("maemulsize1");
		// 난방정보
		String heating = paramMap.get("heatform");
		// 화장실 정보
		String toilet = paramMap.get("toiletform");
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
		if (Pre_war == null || Pre_war.trim().equals("")) {
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

		// 주소에 대한 좌표값을 리턴받기 위한 kakao REST API 요청
		Retrofit retrofit = retrofitHelper.getRetrofit(ApiKakaoService.BASE_URL);

		ApiKakaoService apiKakaoService = retrofit.create(ApiKakaoService.class);

		String query = paramMap.get("item_addrst");

		Kakao kakao = null;
		List<Documents> Location = null;

		if (!query.equals("")) {
			Call<Kakao> call = apiKakaoService.getMap(query);

			try {
				kakao = call.execute().body();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		Location = kakao.getDocuments();
		Documents first = Location.get(0);
		Road_address middle = first.getRoad_address();
		// 위도
		String Latitude = middle.getY();
		// 경도
		String Longitude = middle.getX();

		double latitude = Double.parseDouble(Latitude);
		double longitude = Double.parseDouble(Longitude);
		// 요청 종료

		// 세션값 가져오기
		int co_num = (int) session.getAttribute("userNum");

		// 조회결과 저장할 매물객체 선언
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

		/** 매물이미지 초기변수 선언 */
		String file_dir = "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload";

		try {
			// 데이터 저장
			// 데이터 저장 성공하면 파라미터로 전달되는 input객체에 PK값이 저장됨
			maemulService.AddMaemul(input);

			for (UploadItem fileitem : fileList) {
				fileitem.setFile_dir(file_dir);
				fileitem.setReg_date(time);
				fileitem.setEdit_date(time);
				fileitem.setMaemul_num(input.getMaemul_num());
				System.out.println(fileitem);

				maemulFileService.AddFile(fileitem);
			}

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		String redirectUrl = ContextPath + "/view.ok?maemul_num=" + input.getMaemul_num();
		return webHelper.redirect(redirectUrl, "매물이 저장되었습니다.");

	}

	// 매물 갱신 페이지로 이동을 위한 기능구현입니다. 
	   @RequestMapping(value="/maemul_update.do", method=RequestMethod.GET)
	   public ModelAndView updateMaemul_do(Model model) {
	      //getMaemulItem
	      Maemul input = new Maemul();
	      Maemul output = new Maemul();
	      UploadItem Uinput = new UploadItem();
	      List<UploadItem> Fileoutput = null;
	      
	      int maemul_num = webHelper.getInt("maemul_num");      
	      // 조회를 위한 데이터 입력 
	      input.setMaemul_num(maemul_num);
	      
	      try {
	         output = maemulService.getMaemulItem(input);
	         
	         Uinput.setMaemul_num(maemul_num);
	         try {
	            Fileoutput = maemulFileService.getFileItem(Uinput);
	         } catch(Exception e) {
	            return webHelper.redirect(null, e.getLocalizedMessage());
	         }
	      }catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      model.addAttribute("output", output);
	      model.addAttribute("Fileoutput", Fileoutput);
	      return new ModelAndView("Maemul_update");
	   }
	   
	   // 매물 갱신 처리 기능구현 
	   @RequestMapping(value="/maemul_update.ok", method=RequestMethod.POST)
	   public ModelAndView updateMaemul_ok(Model model, HttpServletRequest request) {
	      
	      HttpSession session = request.getSession();

	      // 업로드 시작
	      try {
	         webHelper.upload();
	      } catch (Exception e) {
	         e.printStackTrace();
	         return webHelper.redirect(null, "매물 업로드에 실패했습니다.");
	      }

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
	      // 시간 등록을 위한 선언
	      String time = timeHelper.timeout();

	      /** 업로드된 정보 추출하기 */
	      // 파일 정보
	      List<UploadItem> fileList = webHelper.getFileList();
	      // 그 밖의 일반 데이터를 저장하기 위한 컬렉션
	      Map<String, String> paramMap = webHelper.getParamMap(); // paramMap에서 key값 subject의 value를 호출한다

	      /** 매물 덱스트 데이터 추출 */
	      // 매물번호 
	      String Maemul_num = paramMap.get("maemul_num");
	      int maemul_num = Integer.parseInt(Maemul_num);
	      String reg_date = paramMap.get("reg_date");
	      // 매물주소
	      String item_addrst = paramMap.get("item_addrst");
	      // 상세주소
	      String item_addrnd = paramMap.get("item_addrnd");
	      // 건물정보 공개, 비공개
	      String select_type = paramMap.get("rdo");
	      // 건물명
	      String build_name = paramMap.get("maemul_name");

	      // 해당 층수
	      System.out.println(paramMap.get("numberfloors") + "테스트중입니다 람쥐0");
	      String Floor = paramMap.get("numberfloors");
	      System.out.println(Floor + "테스트중입니다 람쥐1");
	      floor = Integer.parseInt(Floor);
	      System.out.println(floor + "테스트중입니다 람쥐2");

	      // 전체층수
	      String All_floor = paramMap.get("maemulfloors");
	      if (All_floor == null || All_floor.trim().equals("")) {
	         all_floor = 0;
	      } else {
	         all_floor = Integer.parseInt(All_floor);
	      }
	      // 계약면적
	      String All_width = paramMap.get("maemulsize");
	      // 전용면적
	      String pri_width = paramMap.get("maemulsize1");
	      // 난방정보
	      String heating = paramMap.get("heatform");
	      // 화장실 정보
	      String toilet = paramMap.get("toiletform");
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
	      if (Pre_war == null || Pre_war.trim().equals("")) {
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

	      // 주소에 대한 좌표값을 리턴받기 위한 kakao REST API 요청
	      Retrofit retrofit = retrofitHelper.getRetrofit(ApiKakaoService.BASE_URL);

	      ApiKakaoService apiKakaoService = retrofit.create(ApiKakaoService.class);

	      String query = paramMap.get("item_addrst");

	      Kakao kakao = null;
	      List<Documents> Location = null;

	      if (!query.equals("")) {
	         Call<Kakao> call = apiKakaoService.getMap(query);

	         try {
	            kakao = call.execute().body();
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	      Location = kakao.getDocuments();
	      Documents first = Location.get(0);
	      Road_address middle = first.getRoad_address();
	      // 위도
	      String Latitude = middle.getY();
	      // 경도
	      String Longitude = middle.getX();

	      double latitude = Double.parseDouble(Latitude);
	      double longitude = Double.parseDouble(Longitude);
	      // 요청 종료

	      // 세션값 가져오기
	      int co_num = (int) session.getAttribute("userNum");

	      // 조회결과 저장할 매물객체 선언
	      Maemul input = new Maemul();
	      input.setMaemul_num(maemul_num);
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

	      /** 매물이미지 초기변수 선언 */
	      String file_dir = "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/upload";

	      try {
	         // 데이터 갱신
	         maemulService.editMaemul(input);
	         
	         // 해당 매물의 이미지 모두를 삭제한다. 
	         UploadItem Fileitem = new UploadItem();
	         List<UploadItem> output = null;
	         
	         Fileitem.setMaemul_num(maemul_num);
	         output = maemulFileService.getFileItem(Fileitem);
	         
	         for(int i=0; i<output.size(); i++) {
	        	 File f2 = new File(output.get(i).getFile_dir() + output.get(i).getFilePath());
	        	 boolean upgrade_ok = f2.delete();
	        	 System.out.println("수정성공여부" + upgrade_ok);
	         }
	         
	         maemulFileService.deleteMaemulFile(Fileitem);
	         
	         // 새로 받은 이미지를 저장한다. 
	         for (UploadItem fileitem : fileList) {
	            fileitem.setFile_dir(file_dir);
	            fileitem.setReg_date(reg_date);
	            fileitem.setEdit_date(time);
	            fileitem.setMaemul_num(input.getMaemul_num());
	            
	            System.out.println(fileitem);

	            maemulFileService.AddFile(fileitem);
	         }

	      } catch (Exception e) {
	         return webHelper.redirect(null, e.getLocalizedMessage());
	      }
	      
	      // view 페이지로의 이동 
	      String redirectUrl = ContextPath + "/view.ok?maemul_num=" + input.getMaemul_num();
	      return webHelper.redirect(redirectUrl, "매물정보가 변경되었습니다.");
	   }
	   
	   
	   /** 매물삭제를위한 기능구현 */ 
	   @RequestMapping(value="/maemul/delete_ok", method= RequestMethod.GET)
	   public ModelAndView deleteMaemul(Model model) {
	      Maemul input = new Maemul();
	      UploadItem Uinput = new UploadItem();
	      List<UploadItem> output = null;
	      int maemul_num = webHelper.getInt("maemul_num");
	      // 매물
	      input.setMaemul_num(maemul_num);
	      // 매물 이미지 
	      Uinput.setMaemul_num(maemul_num);
	      
	      try {
	    	 output = maemulFileService.getFileItem(Uinput);
	    	 // upload 폴더에 저장된 이미지 파일 삭제 
	    	 for(int i=0; i<output.size(); i++) {
	    		 File f1 = new File(output.get(i).getFile_dir() + output.get(i).getFilePath());
	    		 boolean del_ok = f1.delete();
	    		 System.out.println("삭제성공여부" + del_ok);		     
	    	 }
	         maemulFileService.deleteMaemulFile(Uinput);
	         
	         try {
	            maemulService.deleteMaemul(input);
	         } catch(Exception e) {
	            return webHelper.redirect(null, "매물이미지 삭제에 실패했습니다.");
	         }
	      }catch(Exception e) {
	         return webHelper.redirect(null, "매물삭제에 실패했습니다.");
	      }
	      String redirectUrl = ContextPath + "/maemul_manage_do";
	      return webHelper.redirect(redirectUrl, "매물이 삭제되었습니다.");
	   }
	   
	   @RequestMapping(value = "/bigdata.do", method = RequestMethod.GET)
		public ModelAndView bigdata(Model model) {
			//String Url="workspace/semoproject/src/main/webapp/views/assets/data/oneperson.csv";
			//String Url = D: + "/views/assets/data/oneperson.csv";
		   
			String Url = "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/data/oneperson.csv";
			String Url2 = "D:/workspace/semoproject/Fantastic4/src/main/webapp/WEB-INF/views/assets/data/dangersignal.csv";
		
			List<GraphData> graphList = new ArrayList<GraphData>();
			List<GraphData2> index2 = new ArrayList<GraphData2>();
			
			String Test = fileHelper.readString(Url, "utf-8");
			String index1 = fileHelper.readString(Url2, "euc-kr");
			
			if (Test == null && index1 == null) {
				System.out.println("실패!");
			}
			String[] data = Test.split("\n");
			String[] data2 = index1.split("\n");
			String[] castle_list = null;
			String[] man_list = null;
			String[] woman_list = null;
			
			Gson gson = new Gson();
			
			
			for(int i=0; i<data.length; i++) {
				String line_String = data[i].trim();
				
				String[] line_data = line_String.split(",");
				if(i == 0) {
					 castle_list = line_data;
				} else if(i ==1) {
					 man_list = line_data;
				} else {
					 woman_list = line_data;
				}
			}
			for (int j = 0; j<castle_list.length; j++) {
				GraphData graph = new GraphData();
				  graph.setCastle(castle_list[j].trim());
				  graph.setMan(man_list[j].trim());
				  graph.setWoman(woman_list[j].trim());
				  
				  graphList.add(j,graph);
				 
			}
			for(int i=0; i<data2.length; i++) {
				GraphData2 graphdata = new GraphData2();
				String park = data2[i].trim();
				String[] harin = park.split(",");
				graphdata.setCity(harin[0]);
				graphdata.setIndex9(harin[1]);
				graphdata.setIndex10(harin[2]);
				graphdata.setIndex11(harin[3]);
				graphdata.setIndex12(harin[4]);
				index2.add(graphdata);
			}
			String json = gson.toJson(graphList);
			String json2 =gson.toJson(index2);
			System.out.println(json2);
			model.addAttribute("Json", json);
			model.addAttribute("Json2", json2);
			return new ModelAndView("Bigdata");
		}

}