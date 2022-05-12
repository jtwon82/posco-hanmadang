<%@ page contentType = "text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html xml:lang="ko" lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="description" content="포스코 한마당" />
<meta name="keywords" content="포스코 한마당, 수강신청, 수강안내" />
<title>포스코 한마당</title>
<link rel="stylesheet" type="text/css" href="/web/assets/css/style.css">
<!--[if lt IE 9]>
<script src="/web/assets/js/lib/html5shiv.min.js" type="text/javascript"></script>
<![endif]-->
<script src="/web/assets/js/lib/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/jquery.easing.1.3.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/jquery.nice-select.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/sly.js" type="text/javascript"></script>
<script src="/web/assets/js/entry.js" type="text/javascript"></script>
</head>
<body>

<!-- skip -->
<%@ include file="../common/skip.jsp"%>
<!-- //skip -->
<!-- wrapper -->
<div id="wrapper">
	<!-- header -->
	<%@ include file="../common/header.jsp"%>
	<!-- //header -->
	<!-- contents -->
	<main id="contents" role="main">
		<div id="contents-inner">
			<div class="container-tabs cl-lecture">
				<ul>
					<li class="by-5 "><a href="/lecture/info">수강신청안내</a></li>
					<li class="by-5 is-selected"><a href="#none">수강신청</a></li>
					<li class="by-5"><a href="/lecture/list">수강신청내역조회</a></li>
					<li class="by-5"><a href="/lecture/result">선정자발표</a></li>
					<li class="by-5"><a href="/lecture/pay">온라인 결제 안내</a></li>
				</ul>
			</div>
			<article class="container-notice bg-lecture">
				<p>매월 첫째ㆍ셋째 주 월요일, 명절 연휴는 휴관일입니다.</p>
			</article>
			
			<article class="container">
				<div class="member-step step3">
					<div class="step-item is-passed"><a href="/lecture/user/terms">약관 동의</a></div>
					<div class="step-item is-passed"><a href="/lecture/user/type">회원타입 선택</a></div>
					<div class="step-item is-current">회원 정보 입력</div>
					<div class="step-item">강좌 선택</div>
					<div class="step-item">비밀번호 설정</div>
					<div class="step-item">수강신청 완료</div>
				</div>
				<div class="info-type info-type-right">
					<p class="info-noti">이전페이지(회색버튼)로 이동 가능합니다.</p>
				</div>

				<p class="heading">3. 회원 정보 입력</p>
				<span class="heading-desc">회원 정보를 모두 입력해주십시오.</span>
				
				<form id="modForm" method="post" action="/lecture/user/input/check">
				<input type="hidden" name="em_type" value="<c:out value="${lecture_session.em_type }"/>"/>
				<div class="member-form">
					<div class="member-type-input member-type-regular">
						<label for="member-name">직원명</label>
						<input type="text" class="text" name="e_name" id="member-name" placeholder="직원명 입력" />
						<label for="member-number">직번(사번)</label>
						<input type="text" class="text" name="e_no" id="member-number" placeholder="직번(사번) 입력" />
						<div class="info-type info-type-left">
							<p class="info-noti">- 없이 입력해주십시오.</p>
						</div>
					</div>
					<div class="member-type-input member-type-regular">
						<label for="member-company">회사명</label>
							<select id="member-company" name="partname" class="text">
								<c:choose>
								<c:when test="${em_type2=='01'}">
								<optgroup label="포스코">
									<option value="포스코">포스코</option>
								</optgroup>
								</c:when>
								</c:choose>
								<optgroup label="그룹사">
									<option value="PNR">PNR</option>
									<option value="RIST">RIST</option>
									<option value="SNNC">SNNC</option>
									<option value="리스트벤처">리스트벤처</option>
									<option value="부산 E&E">부산 E&E</option>
									<option value="순천에코트랜스">순천에코트랜스</option>
									<option value="앤투비">앤투비</option>
									<option value="철강융합신기술연구조합">철강융합신기술연구조합</option>
									<option value="포스웰">포스웰</option>
									<option value="포스코 A&C">포스코 A&C</option>
									<option value="포스코 ICT">포스코 ICT</option>
									<option value="포스코 O&M">포스코 O&M</option>
									<option value="포스코 강판">포스코 강판</option>
									<option value="포스코 건설">포스코 건설</option>
									<option value="포스코 경영연구원">포스코 경영연구원</option>
									<option value="포스코 교육재단">포스코 교육재단</option>
									<option value="포스코 기술투자">포스코 기술투자</option>
									<option value="포스코 미소금융재단">포스코 미소금융재단</option>
									<option value="포스코 새마을 금고">포스코 새마을 금고</option>
									<option value="포스코 알텍">포스코 알텍</option>
									<option value="포스코 에너지">포스코 에너지</option>
									<option value="포스코 엠텍">포스코 엠텍</option>
									<option value="포스코 인재창조원">포스코 인재창조원</option>
									<option value="포스코 인터내셔널">포스코 인터내셔널</option>
									<option value="포스코 청암재단">포스코 청암재단</option>
									<option value="포스코 케미칼">포스코 케미칼</option>
									<option value="포스코 터미날">포스코 터미날</option>
									<option value="포스코 플랜텍">포스코 플랜텍</option>
									<option value="포스코 휴먼스">포스코 휴먼스</option>
									<option value="포스파워">포스파워</option>
									<option value="포항 에스알디씨">포항 에스알디씨</option>
									<option value="포항공과대학교">포항공과대학교</option>
									<option value="포항특수용접봉">포항특수용접봉</option>
									<option value="피엠씨텍">피엠씨텍</option>
								</optgroup>
								<optgroup label="협력사">
									<option value="TCC한진(정비)">TCC한진(정비)</option>
									<option value="궤도공영(철도)">궤도공영(철도)</option>
									<option value="그린산업(제선)">그린산업(제선)</option>
									<option value="금원기업(환경)">금원기업(환경)</option>
									<option value="대광산기(정비)">대광산기(정비)</option>
									<option value="대명(STS)">대명(STS)</option>
									<option value="대성기업(스크랩)">대성기업(스크랩)</option>
									<option value="동서개발(자원화가공)">동서개발(자원화가공)</option>
									<option value="동성계전(정비)">동성계전(정비)</option>
									<option value="동원개발(녹화)">동원개발(녹화)</option>
									<option value="동일기업(후판)">동일기업(후판)</option>
									<option value="동화기업(선재)">동화기업(선재)</option>
									<option value="레스코(자원화가공)">레스코(자원화가공)</option>
									<option value="롤앤롤(열연롤)">롤앤롤(열연롤)</option>
									<option value="만서기업(포장)">만서기업(포장)</option>
									<option value="서희건설(건설)">서희건설(건설)</option>
									<option value="선안(정비)">선안(정비)</option>
									<option value="세영기업(STS)">세영기업(STS)</option>
									<option value="아이렉스(냉방정비)">아이렉스(냉방정비)</option>
									<option value="에스엔지(제강슬래그)">에스엔지(제강슬래그)</option>
									<option value="에스엠(정비)">에스엠(정비)</option>
									<option value="에어릭스(집진기)">에어릭스(집진기)</option>
									<option value="에이스엠(정비)">에이스엠(정비)</option>
									<option value="영남산업(냉연)">영남산업(냉연)</option>
									<option value="운강건설(건설)">운강건설(건설)</option>
									<option value="유일(제강)">유일(제강)</option>
									<option value="인앤씨(도장)">인앤씨(도장)</option>
									<option value="장원(수재)">장원(수재)</option>
									<option value="지스텍(가스안전)">지스텍(가스안전)</option>
									<option value="청인(산회수)">청인(산회수)</option>
									<option value="케이알티(자원화가공)">케이알티(자원화가공)</option>
									<option value="코렘(철도)">코렘(철도)</option>
									<option value="파인스(FINES)">파인스(FINES)</option>
									<option value="포롤텍(냉연롤)">포롤텍(냉연롤)</option>
									<option value="포센(방호)">포센(방호)</option>
									<option value="포엔시(통근버스)">포엔시(통근버스)</option>
									<option value="포우산업(STS)">포우산업(STS)</option>
									<option value="포원(운송)">포원(운송)</option>
									<option value="포웰(수처리)">포웰(수처리)</option>
									<option value="포지트(원료하역)">포지트(원료하역)</option>
									<option value="포트렌스(운송)">포트렌스(운송)</option>
									<option value="피씨엠(정비)">피씨엠(정비)</option>
									<option value="피앤피(정비)">피앤피(정비)</option>
									<option value="피에스씨(스카핑)">피에스씨(스카핑)</option>
									<option value="피엘엠(조명)">피엘엠(조명)</option>
									<option value="피티엠(정비)">피티엠(정비)</option>
									<option value="한중(수재운송)">한중(수재운송)</option>
									<option value="해광기업(정비)">해광기업(정비)</option>
									<option value="화남테크(열연)">화남테크(열연)</option>
									<option value="화인텍(STS)">화인텍(STS)</option>
									<option value="화일산기(정비)">화일산기(정비)</option>
								</optgroup>
							</select>
<!-- 						<input type="text" class="text" id="member-company" name="partname" placeholder="회사명 입력" /> -->
						<label for="member-part">부서명</label>
						<input type="text" class="text"id="member-part" name="partname1" placeholder="부서명 입력" />
					</div>

					<div class="member-type-family">
						<div class="info-type info-type-left">
							<p class="info-noti">신청자별로 각자 개별 입력이 필요합니다.</p>
						</div>
						<label for="member-family">회원과의 관계</label>
						<div class="link-tabs">
							<a href="#none" data-value="본인" class="by-7 is-selected select-family" id="member-family"><span>본인</span></a>
<!-- 							<a href="#none" data-value="배우자" class="by-7 select-family"><span>배우자</span></a> -->
						</div>
						<input type="hidden" id="mem_type" name="mem_type" value="본인"/>
					</div>
					<div class="member-type-input">
						<label for="">성별선택</label>
						<div class="radio-box">
							<span class="radio radio--type1">
								<input type="radio" name="gender" value="0" id="man-man" checked>
								<label for="man-man">남성</label>
							</span>
							<span class="radio radio--type1">
								<input type="radio" name="gender" value="1" id="man-woman">
								<label for="man-woman">여성</label>
							</span>
						</div>
					</div>
					<div class="member-type-input">
						<label for="member-name">신청자명</label>
						<input type="text" name=o_name class="text" id="member-name" placeholder="신청자명 입력" disabled/>
					</div>
					<!-- <div class="member-type-input">
						<label for="member-name">신청자 전화번호</label>
						<input type="text" name="tel" id="tel_input" class="text" style="width:350px;" placeholder="- 없이 입력해주십시오" maxLength=11/>
					</div> -->
					<div class="member-type-input">
						<label for="member-name">신청자 휴대폰번호</label>
						<input type="text" name="hp" id="hp_input" class="text" style="width:350px;" placeholder="- 없이 입력해주십시오" maxLength=11/>
					</div>
				</div>
				<div class="info-type info-type-left">
					<p class="info-noti">입력하신 정보가 사실과 다를 경우 당첨이 무효처리 됩니다.</p>
				</div>

				<div class="btn-group">
					<button type="submit" class="btn btn-level2 btn-noti act-next">다음</button>
				</div>
				</form>
			</article>
		</div>
	</main>
	<!-- contents//end -->

	<!-- footer -->
	<%@ include file="../common/footer.jsp"%>
	<!-- //footer -->

</div>
<!-- //wrapper -->
<script src="/web/assets/js/jquery.form.js" type="text/javascript"></script>
<script type="text/javascript">
$(function(){
	
	$(".select-family").on("click", function(){
		$('.select-family').each(function(index) { 
			$(this).removeClass("is-selected");
		});
		
		$("#mem_type").val($(this).data("value"));
		
		if($(this).data("value") == '본인'){
			$("input[name=o_name]").attr("disabled",true);
		}else{
			$("input[name=o_name]").attr("disabled",false);
		}
		
		$(this).addClass("is-selected");
	});
	
	$('#tel_input, #hp_input').keyup(function() {
        if (this.value.match(/[^0-9]/g)) {
            this.value = this.value.replace(/[^0-9]/g, '');
        }
    });
	
	$('form').ajaxForm({
        beforeSubmit: function (data,form,option) {
        	if(form.find('input[name="e_name"]').val() == ''){
    			alert("직원명을 입력해주세요.");
    			return false;
    		}
    		if(form.find('input[name="e_no"]').val() == ''){
    			alert("직번을 입력해주세요.");
    			return false;
    		}
    		if(form.find('input[name="partname"]').val() == ''){
    			alert("회사명을 입력해주세요.");
    			return false;
    		}
    		if(form.find("#mem_type").val() != '본인' && $('input[name="o_name"]').val() == ''){
    			alert("신청자명을 입력해주세요.");
    			return false;
    		}
    		
    		/* if(form.find('input[name="tel"]').val() == ''){
    			alert("신청자 전화번호를 입력해주세요.");
    			return false;
    		}
    		
    		if(form.find('input[name="tel"]').val().length < 9){
    			alert("정확한 전화번호를 입력하세요.");
    			return false;
    		} */
    		
    		if(form.find('input[name="hp"]').val() == ''){
    			alert("신청자 휴대폰번호를 입력해주세요.");
    			return false;
    		}
    		
    		if(form.find('input[name="hp"]').val().length < 10){
    			alert("정확한 휴대폰번호를 입력하세요.");
    			return false;
    		}
            
            return true;
        },
        success: function(res,status){
            //성공후 서버에서 받은 데이터 처리
        	if(res=='SUCCESS'){
	             location.replace("/lecture/user/select");
	         }else if(res=='NOT_FOUND'){
	        	 alert("등록되지 않은 직원이거나 사번이 잘못 되었습니다.");
	         }else if(res=='INVALID_TYPE'){
	        	 alert("회원구분을 다시 선택하여 주세요.");
	         }else if(res=='INVALID_PARAM'){
	        	 alert("재직자 입니다. 회원구분을 다시 선택하여 주세요.");
	         }else if(res=='DUPLICATE'){
	        	 alert("이미 신청하신 회원입니다.");
	         }else if(res=='DUPLICATE2'){
	        	 alert("가족 중 이미 신청하신 내역이 있습니다.");
	         }else if(res=='INVALID_ACCESS'){
	        	 alert("수강신청 기간이 아닙니다.");
	         }else{
	        	 alert("정상적으로 처리되지 않았습니다. 관리자에게 문의해주세요 : " +  res);
	         }
        },
        error: function(){
        	alert("정상적으로 처리되지 않았습니다. 관리자에게 문의해주세요.");
        }                               
    });
	
	/* $(".act-next").on("click", function(){
		if($('input[name="e_name"]').val() == ''){
			alert("직원명을 입력해주세요.");
			return;
		}
		if($('input[name="e_no"]').val() == ''){
			alert("직번을 입력해주세요.");
			return;
		}
		if($('input[name="partname"]').val() == ''){
			alert("회사명을 입력해주세요.");
			return;
		}
		if($("#mem_type").val() != '본인' && $('input[name="o_name"]').val() == ''){
			alert("신청자명을 입력해주세요.");
			return;
		}
		
		if($('input[name="tel"]').val() == ''){
			alert("신청자 전화번호를 입력해주세요.");
			return;
		}
		
		if($('input[name="hp"]').val() == ''){
			alert("신청자 휴대폰번호를 입력해주세요.");
			return;
		}
		
		$("#modForm").submit();
	}); */
	
});

</script>
</body>
</html>