<%@ page contentType = "text/html;charset=utf-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!doctype html>
<html xml:lang="ko" lang="ko" xmlns="http://www.w3.org/1999/html">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=0.3, minimum-scale=0.3, maximum-scale=2, user-scalable=no" />
<meta name="keywords" content="포스코 한마당, 수강신청, 수강안내" />
<meta name="naver-site-verification" content="07223d4fb7937853d905107caf1212bcadb8481d"/>
<meta property="og:type" content="website">
<meta property="og:title" content="포스코 한마당">
<meta property="og:description" content="포스코 한마당 체육관의 홈페이지입니다.">
<meta name="description" content="포스코 한마당 체육관의 홈페이지입니다.">
<title>포스코 한마당</title>
<link rel="stylesheet" type="text/css" href="/web/assets/css/style.css">
<!--[if lt IE 9]>
<script src="/web/assets/js/lib/html5shiv.min.js" type="text/javascript"></script>
<![endif]-->
<script src="/web/assets/js/lib/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/jquery-ui.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/jquery.easing.1.3.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/jquery.nice-select.min.js" type="text/javascript"></script>
<script src="/web/assets/js/lib/sly.js" type="text/javascript"></script>
<script src="/web/assets/js/entry.js" type="text/javascript"></script>
</head>
<body>

<!-- skip -->
<div id="skip" class="sr-only">
	<ul>
		<li><a href="#skip">메뉴 바로가기</a></li>
		<li><a href="#posco-main">본문 바로가기</a></li>
		<li><a href="#footer">하단 바로가기</a></li>
	</ul>
</div>
<!-- //skip -->
<!-- wrapper -->
<div id="wrapper">
	<!-- contents -->
	<main id="posco-main" role="main">
	
		<div class="posco-wrap">
			<div class="main-bg">
				<!-- bg swiper -->
				<div class="slide-wrap">
					<div class="slide-frame" id="slide-frame" style="background-color: black;">
						<ul class="clearfix">
						
						<c:choose>
						<c:when test="${empty list }">
						<li>
							<img src="/web/assets/img/bg-main.jpg" alt="한마당" />
						</li>
						</c:when>
						<c:otherwise>
						<c:forEach items="${list }" var="item" varStatus="status">
						<li>
							<c:choose>
							<c:when test="${empty item.b_link }">
							<img src='/upload/<c:out value="${item.b_img}"/>' alt="포스코한마당" />
							</c:when>
							<c:otherwise>
							<a href="<c:out value="${item.b_link }"/>"><img src="/upload/<c:out value="${item.b_img}"/>" alt="한마당" /></a>
							</c:otherwise>
							</c:choose>
							<div class="main-text"><c:out value="${item.b_name}"/></div>
						</li>
						</c:forEach>
						</c:otherwise>
						</c:choose>
						</ul>
					</div>
				</div>
				<!-- <div class="contents-text"><img src="./assets/img/contents-text-lecture.png" alt="" /></div> -->
			</div>
			
			<h1><a href="/"><img src="/web/assets/img/h1-logo-main.png" alt="포스코한마당" /></a></h1>
			<div class="quick-link">
				<a href="/hanmadang/info">포스코 한마당 소개</a>
				<a href="/hanmadang/map">찾아오시는 길</a>
			</div>

			<!-- <div class="main-title sr-only">
				포스코 한마당과 함께 건강을 관리해 보세요
			</div> -->

			<div class="main-menu">
				<div class="main-cell bg-program">
					<a href="/program/time/all">
						<p class="menu-name">프로그램 소개</p>
						<figure><img src="/web/assets/img/main-p1.png" alt="포스코한마당" /></figure>
						<span class="menu-desc">포스코 한마당의 다양한 <br>강좌 정보 보기</span>
					</a>
				</div>
				<div class="main-cell bg-lecture">
					<a href="/lecture/info">
						<p class="menu-name">수강신청</p>
						<figure><img src="/web/assets/img/main-p2.png" alt="포스코한마당" /></figure>
						<span class="menu-desc">별도의 로그인 없이 신청 가능</span>
					</a>
				</div>
				<div class="main-cell bg-rent">
					<a href="/rent/main">
						<p class="menu-name">대관현황 및 예약</p>
						<figure><img src="/web/assets/img/main-p3.png" alt="포스코한마당" /></figure>
						<span class="menu-desc">배드민턴 / 탁구 / 당구 / 구기종목<br>대관 현황 보기</span>
					</a>
				</div>
				<div class="main-cell bg-smart">
					<c:choose>
					<c:when test="${!empty member_session }">
					<a href="/my/smart">
						<p class="menu-name">마이페이지</p>
						<figure><img src="/web/assets/img/main-p4.png" alt="포스코한마당" /></figure>
						<span class="menu-desc">스마트 짐 데이터 및<br>나의 모든 등록 정보 보기</span>
					</a>
					</c:when>
					<c:otherwise>
					<a href="/my/login">
						<p class="menu-name">마이페이지</p>
						<figure><img src="/web/assets/img/main-p4.png" alt="포스코한마당" /></figure>
						<span class="menu-desc">스마트 짐 데이터 및<br>나의 모든 등록 정보 보기</span>
					</a>
					</c:otherwise>
					</c:choose>
				</div>
				<div class="main-cell bg-new">
					<a href="/notice">
						<p class="menu-name">한마당 새소식</p>
						<figure><img src="/web/assets/img/main-p5.png" alt="포스코한마당" /></figure>
<!-- 						<span class="menu-desc ">한마당체육관 3분기 생활체육<br>특화 프로그램 운영 결과</span> -->
					</a>
				</div>
				<div class="main-cell-last bg-new">
					<div class="menu-desc-more">
						<ul>
						<c:forEach items="${notice_list }" var="item" varStatus="status">
						<c:if test="${status.index <= 2 }">
							<li><a href="/notice"><c:out value="${item.title}"/> <c:if test="${item.reg_diff < 10}"><span class="blinkcss new">New</span></c:if></a></li>
						</c:if>
						</c:forEach>
						</ul>
						<a href="/notice" class="btn" title="공지사항 더보기">더보기</a>
						<div class="menu-desc-common">
							<a href="#cctv-layer" class="footer-common js-modal__btn-open">영상정보처리기기 운영관리 방침</a>
							<a href="#policy-layer" class="footer-common js-modal__btn-open"><b style="color:blue;">개인정보 처리 방침</b></a>
							<a href="#terms-layer" class="footer-common js-modal__btn-open">이용약관</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<c:if test="${fn:length(pop_list) > 0 }">
		<c:set var="popno_x" value="100"/>
		<c:set var="popno_y" value="50"/>
		<c:forEach items="${pop_list }" var="item" varStatus="status">
		<c:set var="popno" value="${item.idx_no}"/>
		
		<div class="modal-main js-modal draggable" id="modal-main<c:out value='${popno }'/>" style="left:<c:out value='${popno_x }'/>px; top:<c:out value='${popno_y }'/>px;"><!-- layer 제어는 .is-expanded -->
			<div class="modal-basic__bg"></div>
			<div class="modal-basic__wrapper">
				<div class="modal-basic__body">
					<div class="modal-basic__contents modal-basic__main">
							<c:choose>
							<c:when test="${empty item.b_link }">
							<img src='/upload/<c:out value="${item.b_img}"/>' alt="한마당" />
							</c:when>
							<c:otherwise>
							<a href="<c:out value="${item.b_link }"/>"><img src='/upload/<c:out value="${item.b_img}"/>' alt="한마당" /></a>
							</c:otherwise>
							</c:choose>
					</div>
				</div>
				<div class="midal-basic__footer">
					<div class="checkbox">
						<input type="checkbox" class="checkbox" id="agree-terms<c:out value='${popno }'/>"><label for="agree-terms<c:out value='${popno }'/>">오늘하루 보지 않기</label>
					</div>
				</div>
				<a href="#none" data-value="<c:out value="${item.idx_no}"/>" title="닫기" class="modal-basic__btn-close act-pop-close"><img src="/web/assets/img/btn-close.png" alt="레이어 닫기" /></a>
			</div>
		</div>
		
		<c:set var="popno_x" value="${popno_x + 200}"/>
		<c:set var="popno_y" value="${popno_y + 100}"/>
		</c:forEach>
		
		</c:if>
<footer id="footer">
<div class="modal-basic js-modal" id="terms-layer"><!-- layer 제어는 .is-expanded -->
			<div class="modal-basic__bg"></div>
			<div class="modal-basic__wrapper">
				<div class="modal-wide__body">
					<div class="modal-wide__contents">
						<p class="modal-wide-title">포스코 한마당 체육관의 이용약관 입니다.</p>
						<div class="modal-wide__scroll">
							<div class="terms-box">
	<pre>

		제1조(목적 등)

		1 본 약관은 주식회사 포스코(이하 "회사"라 합니다)가 홈페이지(www.poscohanmadang.co.kr)를 (이하 "사이트"라 합니다) 통하여 제공하는 인터넷 관련 서비스(이하 "서비스"라 합니다)를 이용함에 있어 이용자와"회사"의 권리•의무 및 책임사항을 규정함을 목적으로 합니다.

		2 본 약관에 정하는 이외의 "이용자"와 "회사"의 권리, 의무 및 책임사항에 관해서는 전기통신사업법 기타 대한민국의 관련 법령과 상관습에 의합니다.



		제2조(이용자의 정의)

		1 "이용자"란 "사이트"에 접속하여 "회사"가 제공하는 서비스를 받는 자를 말하며 이는 "회원"과 "비회원"으로 구분됩니다.

		2 "회원"이란 "포스코 한마당 체육관" 현장에서 일정의 가입 절차를 거쳐 개인정보를 제공하고 등록을 마친 자로서 "사이트"를 통해 제공되는 모든 서비스를 이용할 수 있습니다.

		3 "비회원"이란 회원 가입 없이 "회사"가 제공하는 서비스를 제한적으로 이용하는 자를 말합니다.



		제3조(회원 가입)

		1 "회원"이 되고자 하는 자는 "회사"가 정한 가입 양식에 따라 포스코한마당체육관 현장에서 개인 정보를 기입하고 회원 가입을 신청합니다.

		2 "회사"는 제1항과 같이 회원으로 가입할 것을 신청한 자가 다음 각 호에 해당하지 않는 한 신청한 자를 회원으로 등록합니다.

		① 가입신청자가 본 약관 제6조 제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만 제6조 제3항에 의한 회원자격 상실 후 3년이 경과한 자로서"회사"의 회원재가입 승낙을 얻은 경우에는 예외로 합니다.

		② 등록 내용에 허위, 기재누락, 오기가 있는 경우

		③ 기타 회원으로 등록하는 것이 "회사"의 기술상 현저히 지장이 있다고 판단되는 경우

		3 회원가입계약의 성립시기는 "회사"의 승낙이 가입신청자에게 도달한 시점으로 합니다.

		4 "회원"은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.



		제4조(서비스의 제공 및 변경)

		1 "이용자"에게 아래와 같은 서비스를 제공합니다.

		① 운동이력관리 온라인 서비스
		② 식이관리 온라인 서비스
		③ 온라인 수강, 대관신청 서비스
		④ 이메일 뉴스레터 서비스
		⑤ 기타 "회사"가 자체 개발하거나 다른 회사와의 협력계약 등을 통해 "이용자"들에게 제공할 일체의 서비스
		⑥ 응모/추첨 온라인 서비스

		2 제1항의 서비스는 "비회원"에게는 제한적으로 제공될 수 있으며 제한된 "서비스"의 경우 "회원"들은 log-in 후 이용 가능합니다.

		3 "회사"는 그 변경될 서비스의 내용 및 제공일자를 제7조 제2항에서 정한 방법으로 "이용자"에게 통지하고, 제1항에 정한 서비스를 변경하여 제공할 수 있습니다.

		4 "회원"은 제1항의 회원정보 기재 내용에 변경이 발생한 경우, 즉시 변경사항을 정정하여 기재하여야 합니다.



		제5조(서비스의 중단)

		1 "회사"는 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있고, 새로운 서비스로의 교체 기타 "회사"가 적절하다고 판단하는 사유에 기하여 현재 제공되는 서비스를 완전히 중단할 수 있습니다.

		2 제1항에 의한 서비스 중단의 경우에는 "회사"는 제7조 제2항에서 정한 방법으로 이용자에게 통지합니다. 다만, "회사"가 통제할 수 없는 사유로 인한 서비스의 중단(시스템 관리자의 고의, 과실이 없는 디스크 장애, 시스템 다운 등)으로 인하여 사전 통지가 불가능한 경우에는 그러하지 아니합니다.



		제6조(이용자 탈퇴 및 자격 상실 등)

		1 "회원"은 "회사"에 언제든지 자신의 회원 등록을 말소해 줄 것(회원 탈퇴)을 요청할 수 있으며 "회사"는 위 요청을 받은 즉시 해당 "회원"의 등록 말소를 위한 절차를 밟습니다.

		2 "회원"이 다음 각 호의 사유에 해당하는 경우, "회사"는 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.

		① 가입 신청 시에 허위 내용을 등록한 경우
		② 다른 사람의 "서비스" 이용을 방해하거나 그 정보를 도용하는 등 전자 거래질서를 위협하는 경우
		③ "서비스"를 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

		3 "회사"가 회원자격을 상실시키기로 결정한 경우에는 회원등록을 말소합니다. 이 경우 "회원"에게 회원등록 말소 전에 이를 통지하고, 소명할 기회를 부여합니다.

		4 회원 가입 후 "서비스"를 이용하는 도중, 연속하여 1년 동안 "서비스"를 이용하기 위해 log-in한 기록이 없는 경우, "회사"는 회원자격을 상실시킬 수 있습니다.



		제7조(이용자에 대한 통지)

		1 "회사"가 특정 이용자에 대한 통지를 하는 경우 "이용자"가 회원 가입 시 제공한 메일주소로 할 수 있습니다.

		2 "회사"가 불특정다수 이용자에 대한 통지를 하는 경우 "사이트" 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다.



		제8조(이용자의 개인정보보호)

		"회사"는 관련법령이 정하는 바에 따라서 이용자 등록정보를 포함한 "이용자"의 개인정보를 보호하기 위하여 노력합니다. "이용자"의 개인정보보호에 관해서는 관련법령 및 "회사"가 정하는 "개인정보취급방침"에 정한 바에 의합니다.



		제9조("회사"의 의무)

		1 "회사"는 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는 바에 따라 지속적이고, 안정적으로 서비스를 제공하기 위해서 노력합니다.

		2 "회사"는 "이용자"가 안전하게 인터넷 서비스를 이용할 수 있도록 "이용자"의 개인정보 보호를 위한 보안 시스템을 구축합니다.

		3 "회사"는 "이용자"가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.



		제10조(이용자의 ID 및 비밀번호에 대한 의무)

		1 "회사"가 관계법령, "개인정보취급방침"에 의해서 그 책임을 지는 경우를 제외하고, 자신의 ID와 비밀번호에 관한 관리책임은 각 회원에게 있습니다.

		2 "회원"은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.

		3 "회원"은 자신의 ID 및 비밀번호를 도난 당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 "회사"에 통보하고 "회사"의 안내가 있는 경우에는 그에 따라야 합니다.



		제11조(이용자의 의무)

		1 이용자는 다음 각 호의 행위를 하여서는 안됩니다.

		① 회원가입신청 또는 변경 시 허위내용을 등록하는 행위
		② "회사"에 게시된 정보를 변경하는 행위
		③ "회사" 기타 제3자의 인격권 또는 지적재산권을 침해하거나 업무를 방해하는 행위
		④ 다른 회원의 ID를 도용하는 행위
		⑤ 정크메일(junk mail), 스팸메일(spam mail), 행운의 편지(chain letters), 피라미드 조직에 가입할 것을 권유하는 메일, 외설 또는 폭력적인 메시지•화상•음성 등이 담긴 메일을 보내거나 기타 공서양속에 반하는 정보를 공개 또는 게시하는 행위
		⑥ 관련 법령에 의하여 그 전송 또는 게시가 금지되는 정보(컴퓨터 프로그램 등)를 전송 또는 게시하는 행위
		⑦ "회사"의 직원이나 "사이트" 서비스의 관리자를 가장하거나 사칭하여 또는 타인의 명의를 도용하여 글을 게시하거나 메일을 발송하는 행위
		⑧ 컴퓨터 소프트웨어, 하드웨어, 전기통신 장비의 정상적인 가동을 방해, 파괴할 목적으로 고안된 소프트웨어 바이러스, 기타 다른 컴퓨터 코드, 파일, 프로그램을 포함하고 있는 자료를 게시하거나 전자우편으로 발송하는 행위
		⑨ 스토킹(stalking) 등 다른 이용자를 괴롭히는 행위
		⑩ 다른 이용자에 대한 개인정보를 그 동의 없이 수집, 저장, 공개하는 행위
		⑪ 불특정 다수의 자를 대상으로 하여 광고 또는 선전을 게시하거나 스팸 메일을 전송하는 등의 방법으로 "사이트"의 서비스를 이용하여 영리 목적의 활동을 하는 행위
		⑫ "회사"가 제공하는 서비스에 정한 약관 기타 서비스 이용에 관한 규정을 위반하는 행위

		2 제1항에 해당하는 행위를 한 "이용자"가 있을 경우 "회사"는 본 약관 제6조 제2, 3항에서 정한 바에 따라 "이용자"의 회원자격을 적절한 방법으로 제한 및 정지, 상실시킬 수 있습니다.

		3 "이용자"는 그 귀책사유로 인하여 "회사"나 다른 "이용자"가 입은 손해를 배상할 책임이 있습니다.



		제12조(공개게시물의 삭제)

		"이용자"의 공개게시물의 내용이 다음 각 호에 해당하는 경우 "회사"는 "이용자"에게 사전 통지 없이 해당 공개게시물을 삭제할 수 있고,
		해당 "이용자"의 회원 자격을 제한, 정지 또는 상실시킬 수 있습니다.

		1 다른 이용자 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용

		2 공서양속에 위반되는 내용의 정보, 문장, 도형 등을 유포하는 내용

		3 범죄행위와 관련이 있다고 판단되는 내용

		4 다른 이용자 또는 제3자의 저작권 등 기타 권리를 침해하는 내용

		5 기타 관계 법령에 위배된다고 판단되는 내용



		제13조(게시물에 대한 책임과 정책)

		"이용자"가 게시판 내에 게시한 게시물의 저작권은 게시자 본인에게 있으며, 본 게시판에 올린 정보나 의견은 "회사"의 입장과는 무관합니다.
		게시판에 게시한 게시물로 파생되는 문제에 대해서는 전적으로 해당 게시물을 게시한 본인에게 책임이 있습니다.
		"회사"는 "이용자"가 게시판에 게시, 게재하거나 서비스를 통해 전송한 내용물에 대하여 책임이 없으며, 삭제 대상이 되는 게시물에 해당하는
		경우에는 사전 통지 후 삭제할 수 있습니다.
		단 게시물이 불법적인 내용이 확실할 경우 통보 없이도 삭제가 가능합니다.
		"이용자"가 게시한 게시물이 타인의 저작권, 프로그램 저작권 등을 침해하더라도 이에 대한 민,형사상의 책임을 부담하지 않으며, 만일 이를
		이유로 "회사"가 타인으로부터 손해배상청구 등 이의 제기를 받은 경우 해당 "이용자"는 그로 인해 발생한 모든 손해를 부담하여야 합니다.

		1 "회사"는 "이용자"가 게시한 서비스 내의 모든 내용물이 게시판 운영원칙에 위배된다고 판단할 경우 해당 게시자에게 사전 또는 사후 통보 없이 삭제할 수 있으며, 더불어 해당 "이용자"에게는 그 경중에 따라 합당한 제재를 가할 수 있습니다.

		2 "회사"는 필요에 의해 제공되는 카테고리 및 게시판의 추가 생성과 삭제를 임의로 할 수 있으며, 또한 게시판에 저장된 자료에 대해 게재기간 또는 저장기간을 정할 수 있고, 이를 변경할 수 있습니다.

		3 "회사"는 필요에 따라 "이용자"가 게시한 게시물을 사전 통지 없이 편집, 이동할 수 있으며, "이용자"가 해지하거나 적법한 사유로 해지된 경우 해당 "이용자"가 게시하였던 게시물을 삭제할 수 있습니다.



		제14조(게시물 삭제기준/ 제재조치)

		'정보 통신 윤리 위원회 규칙'을 기본 원칙으로 하며 다음과 같은 내용의 게시물은 등록을 금합니다.

		1 현행법을 어기고 공공질서, 미풍양속을 저해하는 내용의 게시물
		- 국가이념과 국가의 존립을 훼손하고 반국가적 행위의 수행을 목적으로 하는 내용
		- 타인 또는 타 단체의 권리를 침해하거나 명예를 훼손하는 내용
		- 사회적 혼란을 야기시키는 허위 사실인 내용
		- 개인의 사생활을 침해하는 내용
		- 인명을 경시하고 폭력성이 짙은 내용 및 범죄 혹은 비행행위를 찬미, 조장하는 내용
		- 범죄행위의 구체적인 방법을 묘사하여 모방범죄를 유발하게 하는 내용
		- 보는 이에게 혐오감을 유발하는 내용과 정보
		- 성적인 욕구를 지나치게 자극하거나 혐오감을 주는 음란한 내용
		- 불륜관계, 근친상간 등 패륜적, 반인류적 성행위를 자세하게 소개하거나 흥미위주로 묘사한 내용
		- 성폭력, 강간, 윤간 등 성범죄를 구체적, 사실적으로 묘사하거나 미화한 내용
		- 성을 상품화하거나 특정 신체부위를 지나치게 노출 및 언급한 내용
		- 욕설 또는 언어 폭력 등의 저속한 표현으로 타인의 인격을 모독하거나 불괘감 또는 혐오감을 불러일으키는 내용
		- 특정 종교 간의 감정 대립을 조장하는 내용
		- 미신 또는 비과학적인 생활태도를 조장하는 내용

		2 적절하지 못한 내용을 담은 게시물
		- 스팸성 글(저주성 글,행운의 편지 등)
		- 특정 개인 신상 정보 노출로 인해 피해가 예상되는 경우
		- 근거 없는 내용을 게재함으로 인해 개인,특히 공인의 사생활침해 및 명예 훼손의 소지가 있는 경우
		- 게시물의 내용이 게시판의 성격에 위배되거나 동일한 게시물을 여러 게시판에 등록한 경우
		- 지나치게 무성의, 무의미한 내용의 게시물
		- 버그 현상으로 인해 화면상에서 그 내용을 확인할 수 없는 게시물
		- 카테고리에 대한 주제와 무관하게 진행되는 논쟁으로 인해 게시판 이용에 혼란을 야기시키는 게시물
		- 관리자에 의해 삭제된 게시물을 전체 인용하는 경우
		- 매춘, 사이버섹스, 노골적인 성적대화 등 성적유희 대상을 찾거나 매개하는 내용
		- 음란 정보 또는 퇴폐업소가 있는 장소를 안내 또는 매개하는 내용
		- 특정 이용자, 개인을 감정적으로 비난하고 분쟁을 유도하는 내용의 게시물
		- 의료, 기구, 약품, 건강 보조 식품 등을 과장되게 소개하여 오용 또는 남용을 조장하는 내용을 담은 게시물
		- 출처가 불분명한 인용문(일명 퍼온글) 및 게시자가 책임지지 못하는 정보 및 주장을 담은 게시물
		- 정보통신설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염자료를 등록 또는 유포하는 행위

		3 저작권에 위반되는 내용의 게시물
		- 상용 프로그램의 등록과 게재, 배포를 안내하는 내용
		- 정품 확인이 안 되는 소프트웨어, 각종 저작물의 유통을 담은 내용
		- 타인의 권리에 속하는 저작권, 상표권, 의장권 등을 무단으로 침해하는 내용

		4 온라인 판매/구매/돈벌기 관련 게재 금지 게시물
		- 돈벌기 사이트 관련 게시물
		- 특정 사이트 및 제품에 대한 직접적인 홍보 및 간접 홍보의 내용
		- 불법 게임, 소프트웨어, 음반, 영상의 복사 및 판매(백업CD 포함)의 내용
		- 음란, 폭력물을 판매할 목적으로 선전하는 내용
		- 미풍양속을 위반하고 사행심을 조장하는 영상 및 저작물

		5 기타
		- 타인의 아이디를 도용해 부정하게 사용하는 경우
		- "회사"의 정상적인 경영활동 및 서비스를 방해하고 회사 이익에 막대한 지장과 해악을 미친다고 판단되는 게시물
		- "이용자"들에게 피해 및 손해를 입힐 우려가 있다고 판단되는 게시물

		이상의 내용에 저촉되는 게시물 등에 대해서는 사전 통지 없이 임의 삭제될 수 있으며 위반사항이 거듭되거나 위반으로 인한 피해가 극심하다고 판단되는 경우, "이용자"를 경고 또는 이용 중지 처리할 수 있습니다.



		제15조(저작권의 귀속 및 이용제한)

		1 "사이트"와 관련한 자산은 저작권, 상표권, 기술에 대한 정보, 텍스트, 그래픽, 오디오, 비디오, 다운로드, 링크, 그리고 소스코드 (이하 웹사이트 서비스)이며, "회사"는"서비스"에 대해 모든 권리를 가지고 있습니다. 모든 형태의 정보는 "이용자" 여러분들을 위한 것이며, 여러분들의 편의를 위해 제공되는 것입니다. 그러나, "회사"는 이러한 정보에 대한 상업적 사용권을 허락하는 것은 아님을 밝혀드립니다. "이용자"는 개인적인 용도가 아닌 어떠한 경우에도 이 "사이트" "서비스"를 사용할 수 없습니다.

		2 이용자는 "사이트"를 이용함으로써 얻은 정보를 "회사"의 사전승낙 없이 복제, 전송, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.



		제16조(면책)

		1 "회사"는 "이용자"가 "서비스"를 이용함으로써 기대되는 수익을 얻지 못하거나 "서비스"를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다.

		2 "회사"는 자체적인 기준에 의거해 다양한 링크를 제공하고 있습니다. 링크된 웹사이트들은 모두 "이용자"들의 정보획득과 편의를 위해 제공하고 있으나 링크 사이트에 대한 어떤 법적 책임도"회사"에는 있지 않으며 웹사이트의 신뢰성에 대한 보장을 "회사"가 하지는 않습니다. 각 링크 사이트는 "이용자" 여러분께서 판단하시어 효율적으로 이용하시기 바랍니다.

		3 "이용자"가 화면에 게재한 정보, 자료, 사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 "이용자"가 책임을 부담하며, "회사"는 내용의 부정확 또는 허위로 인해 "이용자" 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.

		4 "회사"는 "서비스" 이용과 관련하여 "이용자"의 고의 또는 과실로 인하여 "이용자" 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.



		제17조(약관의 개정)

		1 "회사"는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률 등 관련법을 위배하지 않는 범위에서 본 약관을 개정할 수 있습니다.

		2 "회사"가 본 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 초기화면에 그 적용일자 칠(7)일 이전부터 적용일자 전일까지 공지합니다.

		3 "이용자"는 변경된 약관에 대해 거부할 권리가 있습니다. "이용자"는 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표명할 수 있습니다."이용자"가 거부하는 경우 "회사"는 당해 "이용자"와의 계약을 해지할 수 있습니다. 만약 "이용자"가 변경된 약관이 공지된 후 십오(15)일 이내에 거부의사를 표시하지 않는 경우에는 동의하는 것으로 간주합니다.




		제18조(재판관할)

		"회사"와 이용자 간에 발생한 서비스 이용에 관한 분쟁에 대하여는 대한민국 법을 적용하며, 본 분쟁으로 인한 소는 민사소송법상의 관할을 가지는
		대한민국의 법원에 제기합니다.



		부 칙

		본 약관은 2011년 6월 1부터 적용됩니다.
	</pre>
							</div>
						</div>
					</div>
				</div>
				<a href="#none" title="닫기" class="modal-basic__btn-close js-modal__btn-close"><img src="/web/assets/img/btn-close.png" alt="레이어 닫기" /></a>
			</div>
		</div>
		<!-- layer popup//end -->


	<div class="modal-basic js-modal" id="policy-layer"><!-- layer 제어는 .is-expanded -->
			<div class="modal-basic__bg"></div>
			<div class="modal-basic__wrapper">
				<div class="modal-wide__body">
					<div class="modal-wide__contents">
						<p class="modal-wide-title">개인정보처리방침</p>
						<div class="modal-wide__scroll">
							<div class="terms-box">
	<pre>

1. 총칙
포스코 한마당 체육관(이하 '회사'라 한다)은 「정보통신망 이용 촉진 및 정보 보호에 관한 법률」 및 「개인정보 보호법」에 따라 정보주체의 개인 정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인 정보 처리 방침을 수립∙공개합니다.

2. 개인 정보의 처리 목적 및 보유현황
회사는 다음의 목적을 위하여 개인 정보를 처리합니다. 처리하고 있는 개인 정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인 정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 
[온라인 수강추첨 접수]
* 수집항목
- 포스코 직원 및 가족 필수 - 회원정보(직원명, 직번, 회사명, 부서명), 회원과의 관계, 성별, 연락처
- 그룹사/협력사 직원 및 배우자 필수 - 회원정보(직원명, 직번, 회사명, 부서명), 회원과의 관계, 성별, 연락처
- 포스코,그룹사,협력사 퇴직자(OB) 필수 - 회원정보(직원명, 직번, 회사명, 부서명), 회원과의 관계, 성별, 연락처
- 일반회원 필수 – 성별, 신청자명, 연락처 

* 수집목적
- 수강추첨 및 회원제 서비스 제공에 따른 본인 확인
- 체육관 운영 및 고지사항 발송
* 보유기간
- 추첨발표 15일 후
* 수집근거
- 정보주체 동의
* 수집방법
- 온라인 수집(홈페이지)

[회원등록]
*수집항목
&lt;필수&gt;
- 성명, 아이디, 패스워드, 직원과의 관계, 생년월일, 연락처, 사진, 성별

&lt;선택&gt;
- 회사명, 부서, 직원명, 직번
※포스코 직원 및 가족, 그룹사.협력사 직원및 배우자는 구분을 위함이니 모두 필수 입력

* 수집목적
- 회원제 서비스 제공에 따른 본인 식별o인증, 회원자격 유지o관리 및 회원구분
- 홈페이지 회원등록
- 체육관 운영 및 고지사항 발송
* 보유기간
- 회원 탈퇴 시까지
* 수집근거
- 정보주체 동의
* 수집방법
- 오프라인 수집 후 전산등록

[스마트짐 이용]
* 수집항목
&lt;필수&gt;
- 측정정보: 신장, 체중, 복부지방율, 체지방량, 기초대사량, 근육량, 체지방율, 체질량지수, 혈압, 최대산소섭취량, 안정시심박수, 근력,
          근지구력, 유연성, 부위별 근육발달, 부종평가, 코어, 유연성, 상체근지구력, 하체근지구력, 평형성(21개 항목)
- 상담항목: 가족력, 과거병력, 질환유무, 수술이력, 현재상태(5개 항목)

&lt;선택&gt;
- 설문항목: 흡연, 음주, 혈당, 고지혈증, 간기능, 골다공증, 생활방식(Life Style)(7개 항목)

* 수집목적
- 맞춤형 운동 가이드 제공 및 운동이력 관리
* 보유기간
- 회원 탈퇴 시까지
* 수집근거
- 정보주체동의
* 수집방법
- 오프라인 수집 후 전산등록

3. 개인 정보처리의 위탁
포스코 한마당 체육관 홈페이지는 원활한 개인 정보 업무처리를 위하여 다음과 같이 개인 정보 처리 업무를 위탁하고 있습니다.
* 수탁업체 : 포스웰
* 위탁업무 내용 : 회원관리, 체육관 운영/관리
* 개인정보의 보유 및 이용기간 : 회원 탈퇴 시 혹은 위탁 계약 종료 시까지

3.1. 회사는 위탁 계약 체결 시 개인정보 보호법 제25조에 따라 위탁업무 수행 목적 외 개인 정보 처리 금지, 기술적․관리적 보호 조치, 재 위탁 제한, 수탁자에 대한 관리∙감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인 정보를 안전하게 처리하는지를 감독하고 있습니다.

3.2. 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체 없이 본 개인 정보처리 방침을 통하여 공개하도록 하겠습니다.

4. 개인 정보의 제3자 제공
포스코 한마당 체육관은 원칙적으로 정보주체의 개인 정보를 수집·이용 목적으로 명시한 범위 내에서 처리하며, 
다음의 경우를 제외하고는 정보주체의 사전 동의 없이는 본래의 목적 범위를 초과하여 처리하거나 제3자에게 제공하지 않습니다.
① 정보주체로부터 별도의 동의를 받는 경우
② 법률에 특별한 규정이 있는 경우

5. 정보주체의 권리∙의무 및 행사방법
○ 개인 정보의 열람 및 정정
귀하는 언제든지 등록되어 있는 귀하의 개인 정보를 열람하거나 정정하실 수 있습니다. 개인 정보 열람 및 정정을 하고자 할 경우에는 개인 정보관리담당자에게 서면, 전화, E-mail 등으로 연락하시면 즉시 조치하겠습니다.
- 이용자가 개인 정보의 오류에 대한 정정을 요청한 경우, 정정을 완료하기 전까지 당해 개인 정보를 이용하지 않습니다. 또한, 잘못된 개인 정보를 제3자에게 이미 제공한 경우에는 정정 처리결과를 제3자에게 지체 없이 통지하여 정정이 되도록 조치하겠습니다.
○ 개인 정보의 처리정지
- 이용자는 개인 정보의 처리정지를 요구할 수 있습니다. 다만 개인 정보 처리정지 요구 시 법 제37조 2항에 의하여 처리정지 요구가 거절될 수 있습니다. 
○ 동의 철회 및 삭제 요청
- 이용자 및 법정대리인은 언제든지 회사의 개인 정보의 수집/이용, 개인정보 제3자 제공 및 개인 정보 처리 위탁에 대한 동의를 철회하거나 회원 탈퇴를 요청할 수 있습니다. 
-동의 철회: 한마당 체육관 운영사무실(054-221-9280)
-회원 탈퇴: 홈페이지 로그인 -> 회원정보 수정 -> 회원 탈퇴를 클릭하시거나 개인 정보관리 담당자에게 서면, 전화, E-mail로 연락하시면 즉시 개인 정보의 삭제 등 필요한 조치를 취하도록 하겠으며, 이용자 또는 법정대리인의 요청에 의해 삭제된 개인 정보는 "2. 개인 정보의 처리 목적 및 보유현황"에 명시된 바에 따라 처리하고, 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.
○ 정보주체의 권리행사 요구 거절 시 불복을 위한 이의제기 절차는 다음과 같습니다.
- 개인 정보 관리부서에서 열람 등 요구에 대한 연기 또는 거절 시 요구받은 날로부터 10일 이내에 정당한 사유 및 이의 제기 방법 등을 통지
- 개인 정보 관리부서에서 정보주체의 이의 제기 신청 및 접수(서면, 전화, E-mail) 개인 정보 담당자가 내용 확인
- 개인 정보관리 책임자가 처리결과에 대해 최종 검토
- 개인 정보 관리부서에서 정보주체에게 처리결과 통보

6. 개인 정보의 파기
포스코 한마당 체육관은 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 회원의 개인정보를 지체 없이 파기합니다. 정보주체로부터 동의 받은 개인 정보의 보유기간이 경과하거나, 처리 목적이 달성되었음에도 불구하고 다른 법령에 따라 개인 정보를 계속 보관하여야 하는 경우에는 해당 개인 정보를 별도의 데이터베이스(DB)로 옮기거나, 보관 장소를 달리하여 보존합니다.
개인 정보 파기절차 및 방법은 다음과 같습니다.
○ 파기절차 
위 개인정보 수집목적 달성 시 즉시파기 원칙에도 불구하고, 관련법령의 규정 및 내부 방침에 의하여 거래 관련 관리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 다음과 같이 일정기간 보유합니다.
① 가입 또는 환불 등에 관한 기록: 5년
② 대금결제 및 재화 등의 공급에 관한 기록: 5년
③ 소비자의 불만 또는 분쟁처리에 관한 기록: 5년
④ 재방문 서비스를 제공하기 위한 본인 식별번호: 가입을 탈퇴한 이후로 1년
○ 파기방법
① 종이에 출력된 개인정보: 분쇄기로 분쇄하거나 소각
② 전자적 파일형태로 저장된 개인정보: 복원이 불가능한 방법으로 영구 삭제합니다.


7. 개인 정보의 안전성 확보 조치
회사는 정보주체의 개인 정보가 분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 아래와 같은 조치를 취하고 있습니다. 
○ 개인 정보의 안전한 처리를 위한 내부 관리 계획의 수립·시행 
- 년 1회 개인 정보 취급자에 대한 개인 정보 보호 교육, 기술적·관리적 보호조치 이행 여부의 내부 점검 및 감사, 기술적·관리적 보호대책 수립 및 이행, 개인 정보 보호 관련 지침의 검토 및 개정 등 기타 개인 정보 보호를 위하여 필요한 업무계획을 수립·시행하고 있습니다.
○ 개인 정보에 대한 접근 통제 및 접근 권한의 제한 조치 	
- 개인 정보 관리 업무에 대한 권한 및 인력을 최소한으로 한정하여 운영하며, 개인정보 관련 시스템의 접근을위한 관리자 아이디 및 암호는 3개월 단위 또는 관련 직원 변동 시에 반드시 변경 관리하여 내부 침입에도 적극 대응하고 있습니다.
○ 개인 정보를 안전하게 저장·전송할 수 있는 암호화 기술의 적용 
- 중요 개인 정보에 대해 암호화하여 저장 및 관리하고 있습니다. 이용자의 웹 브라우저와 서버 간에 개인 정보(비밀번호 등)의 안전한 송수신을 위하여 SSL(Secure Socket Layer) 암호화 통신을 제공하고 있습니다.
○ 개인 정보 침해 사고 발생에 대응하기 위한 접속기록의 보관 및 위조·변조 방지를 위한 조치 
- 개인 정보처리 시스템에 대한 접속기록을 최소 6개월 이상 보관·관리하고 있으며 접속 기록이 위·변조 및 
도난, 분실되지 않도록 보안 기능을 사용하고 있습니다.
○ 개인 정보에 대한 보안 프로그램의 설치 및 갱신 
- 개인 정보처리 시스템 및 개인 정보처리자가 개인 정보 처리에 이용하는 정보기기에 컴퓨터 바이러스, 
스파이웨어 등 악성 프로그램의 침투 여부를 항시 점검·처리할 수 있도록 백신 프로그램을 설치하며 주기적으로 업데이트하고 있습니다.
○ 개인 정보의 안전한 보관을 위한 보관시설의 마련 또는 잠금장치의 설치 등 물리적 조치 
- 전산실 및 자료 보관실 등을 특별 보호구역으로 설정하여 출입통제 등 출입관리 절차를 시행하고 있습니다.
○ 회사는 시스템 및 네트워크의 보안을 위해 인터넷망을 통한 해커의 불법적 침입 등 시스템으로의 무단
접근을 방지하기 위하여 침입차단시스템(방화벽), 침입탐지시스템(IDS) 및 침입방지시스템 (IPS)을 설치하여 운영하고 있습니다.
○ 새로운 해커 기술에 대비하여 주기적으로 시스템 소프트웨어 패치(업그레이드) 및 시스템 점검을 수행하고 
상시 보안 시스템을 모니터링하는 등 보안성을 확보하기 위하여 노력하고 있습니다

8. 개인 정보 자동 수집장치의 설치∙운영 및 거부에 관한 사항
○ 회사는 정보주체의 이용정보를 저장하고 수시로 불러오는 '쿠키(cookie)'를 사용하지 않습니다.

9. 개인 정보 관리 책임자 및 담당자
○ 회사는 이용자의 개인 정보를 보호하고 개인 정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인 정보 관리책임자 및 개인 정보 관리담당자를 지정하고 있습니다.
○ 귀하의 개인 정보 보호에 관련하여 의견이나 문의사항이 있는 경우 개인 정보관리책임자 또는 개인 정보 
관리담당자에게 연락 주시면 최선을 다해 처리해드리겠습니다.
성명      소속                  직책    연락처
권세정    포스코행정섭외그룹    팀장    sejeong@posco.com
최원철    포스코행정섭외그룹    과장    054-220-1155

10. 권익 침해에 대한 구제방법
아래의 기관에 대해 개인 정보 침해에 대한 피해 구제, 상담 등을 문의하실 수 있습니다. (아래의 기관은 회사와는 별개의 기관으로서, 회사의 자체적인 개인 정보 불만 처리, 피해 구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.)     
○ 개인 정보 침해신고센터 (한국 인터넷진흥원 운영) 
- 소관 업무 : 개인 정보 침해 사실 신고, 상담 신청 
- 홈페이지 : privacy.kisa.or.kr 
- 전화 : (국번 없이) 118 
- 주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인 정보 침해신고센터
○ 개인 정보 분쟁 조정위원회
- 소관 업무 : 개인 정보 분쟁 조정 신청, 집단분쟁 조정 (민사적 해결) 
- 홈페이지 : www.kopico.go.kr
- 전화 : (국번 없이) 1833-6972
- 주소 : (03171) 서울특별시 종로구 세종대로 209 정부 서울 청사 4층
○ 대검찰청 사이버 범죄수사단 : 02-3480-3573 (www.spo.go.kr)
○ 경찰청 사이버 안전국 : 182 (http://cyberbureau.police.go.kr)

11. 개인 정보처리 방침의 변경
본 개인 정보처리 방침은 2018년 12월 7일부터 적용됩니다. 내용의 추가, 삭제 및 수정이 있을 시에는 변경
사항의 시행일 7일 전부터 홈페이지의 공지사항을 통하여 고지할 것입니다. 
개인 정보처리 방침 버전 번호 : v2.1

<a href="/policy/20" target="_blank">개인정보처리방침 이전 버전 : V2.0</a>
<a href="/policy/11" target="_blank">개인정보처리방침 이전 버전 : V1.1</a>
<a href="/policy/10" target="_blank">개인정보처리방침 이전 버전 : V1.0</a>


	</pre>
							</div>
						</div>
					</div>
				</div>
				<a href="#none" title="닫기" class="modal-basic__btn-close js-modal__btn-close"><img src="/web/assets/img/btn-close.png" alt="레이어 닫기" /></a>
			</div>
		</div>
		<!-- layer popup//end -->



	<div class="modal-basic js-modal" id="cctv-layer"><!-- layer 제어는 .is-expanded -->
			<div class="modal-basic__bg"></div>
			<div class="modal-basic__wrapper">
				<div class="modal-wide__body">
					<div class="modal-wide__contents">
						<p class="modal-wide-title">영상정보처리기기 운영관리 방침</p>
						<div class="modal-wide__scroll">
							<div class="terms-box">
	<pre>
<style>
#cctv-layer pre p{  margin: -25px 0; }
</style>

<p><strong>포스코한마당체육관 (이하 본 사라 함)은 영상정보처리기기 운영.관리</strong></p>

<p><strong>방침을 통해 본 사에서 처리하는 영상정보가 어떠한 용도와 방식으로 이용.관리되고</strong></p>

<p><strong>있는지 알려드립니다.</strong></p>

<p>&nbsp;</p>

<p><strong>1. </strong><strong>영상정보처리기기의 설치 근거 및 설치 목적</strong></p>

<p>&nbsp;본 사는「개인정보보호법」제25조 제1항에 따라 다음과 같은 목적으로 영상정보처리기기를설치.운영 합니다.</p>

<p>&nbsp;&nbsp; - 시설안전 및 화재 예방</p>

<p>&nbsp;&nbsp; - 고객의 안전을 위한 범죄 예방</p>

<p>&nbsp;</p>

<p><strong>2. </strong><strong>설치 대수, 설치 위치 및 촬영범위</strong></p>

<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<td style="background-color:#bfbfbf; width:83.4pt; text-align:center;">
			<p>설치대수</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:240.95pt; text-align:center;">
			<p>설치위치</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:177.2pt; text-align:center;">
			<p>촬영범위</p>
			</td>
		</tr>
		<tr>
			<td style="border-color:currentColor black black; width:83.4pt; text-align:center;">
			<p>44대</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:240.95pt; text-align:center;">
			<p>한마당체육관 내부(44)</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:177.2pt; text-align:center;">
			<p>실내</p>
			</td>
		</tr>
		<tr>
			<td style="border-color:currentColor black black; width:83.4pt; text-align:center;">
			<p>13대</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:240.95pt; text-align:center;">
			<p>한마당 체육관 건물 외부 주차장 등</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:177.2pt; text-align:center;">
			<p>건물 외부</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><strong>3. </strong><strong>관리책임자 및 접근권한자</strong></p>

<p>&nbsp;귀하의 영상정보를 보호하고 개인영상정보와 관련한 불만을 처리하기 위하여 아래와 같이</p>

<p>개인영상정보 보호책임자를 두고 있습니다.</p>

<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<td style="background-color:#bfbfbf; width:104.65pt; text-align:center;">
			<p>구분</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:99.2pt; text-align:center;">
			<p>이름</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:78pt; text-align:center;">
			<p>직위</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:106.3pt; text-align:center;">
			<p>소속</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:4cm; text-align:center;">
			<p>연락처</p>
			</td>
		</tr>
		<tr>
			<td style="border-color:currentColor black black; width:104.65pt; text-align:center;">
			<p>관리책임자</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:99.2pt; text-align:center;">
			<p>김종연</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:78pt; text-align:center;">
			<p>관장</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:106.3pt; text-align:center;">
			<p>포스웰</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:4cm; text-align:center;">
			<p>221-9282</p>
			</td>
		</tr>
		<tr>
			<td style="border-color:currentColor black black; width:104.65pt; text-align:center;">
			<p>접근권한자</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:99.2pt; text-align:center;">
			<p>김성광</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:78pt; text-align:center;">
			<p>주임</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:106.3pt; text-align:center;">
			<p>포스웰</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:4cm; text-align:center;">
			<p>221-9284</p>
			</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;</p>

<p><strong>4. </strong><strong>영상정보의 촬영시간, 보관기간, 보관장소 및 처리방법</strong></p>

<table border="1" cellspacing="0">
	<tbody>
		<tr>
			<td style="background-color:#bfbfbf; width:168.45pt; text-align:center;">
			<p>촬영시간</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:155.9pt; text-align:center;">
			<p>보관기간</p>
			</td>
			<td style="background-color:#bfbfbf; border-color:black black black currentColor; width:177.2pt; text-align:center;">
			<p>보관장소</p>
			</td>
		</tr>
		<tr>
			<td style="border-color:currentColor black black; width:168.45pt; text-align:center;">
			<p>24시간</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:155.9pt; text-align:center;">
			<p>촬영일로부터 30일</p>
			</td>
			<td style="border-color:currentColor black black currentColor; width:177.2pt; text-align:center;">
			<p>체육관 시설 사무실</p>
			</td>
		</tr>
	</tbody>
</table>

<p>- 처리방법 : 개인영상정보의 목적 외 이용, 제3자 제공, 파기, 열람 등 요구에 관한 사항을 기록.관리</p>

<p>하고, 보관기간 만료 시 복원이 불가능한 방법으로 영구 삭제(출력물의 경우 파쇄 또는 소각)합니다.</p>

<p>&nbsp;</p>

<p><strong>5. </strong><strong>개인영상정보의 확인 방법 및 장소에 관한 사항</strong></p>

<p>&nbsp;&nbsp; - 확인 방법 : 영상정보 관리책임자에게 미리 연락하고 본 사를 방문하시면 확인 가능합니다.</p>

<p>&nbsp;&nbsp; - 확인 장소 : 한마당체육관시설 사무실</p>

<p><strong>6. </strong><strong>정보주체의 영상정보 열람 등 요구에 대한 조치</strong></p>

<p>&nbsp;귀하는 개인영상정보에 관하여 열람 또는 존재확인.삭제를 원하는 경우 언제든지 영상정보처리기기 운영자에게 요구하실 수 있습니다. 단, 귀하가 촬영된 개인영상정보 및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다.</p>

<p>&nbsp;본 사는 개인영상정보에 관하여 열람 또는 존재확인.삭제를 요구한 경우 지체 없이 필요한 조치를</p>

<p>하겠습니다.</p>

<p>&nbsp;</p>

<p><strong>7. </strong><strong>영상정보의 안전성 확보조치</strong></p>

<p>&nbsp;본 사는 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고 있습니다. 또한 본 사는 개인영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등부여하고 있고, 개인영상정보의 위.변조 방지를 위하여 개인영상정보의 생성 일시, 열람 시 열람 목적/열람자/열람 일시 등을 기록하여 관리하고 있습니다. 이 외에도 개인영상정보의 안전한 물리적 보관을 위하여 잠금장치를 설치하고 있습니다.</p>

<p>&nbsp;</p>

<p><strong>8. </strong><strong>개인정보 처리방침 변경에 관한 사항</strong></p>

<p>&nbsp;이 영상정보처리기기 운영.관리방침은 2017년 8월 17일에 제정되었으며 법령ㆍ정책 또는 보안기술의 변경에 따라 내용의 추가ㆍ삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 본 사 홈페이지를 통해 변경사유 및 내용 등을 공지하도록 하겠습니다.</p>

<p>&nbsp;</p>

<p>&nbsp;  - 버전번호 :  v1.1</p>

<p>&nbsp;  - 공고일자 : 2017년 8월 17일</p> 

<p>&nbsp;  - 시행일자 : 2017년 8월 17일</p>


	</pre>
							</div>
						</div>
					</div>
				</div>
				<a href="#none" title="닫기" class="modal-basic__btn-close js-modal__btn-close"><img src="/web/assets/img/btn-close.png" alt="레이어 닫기" /></a>
			</div>
		</div>
		<!-- layer popup//end -->
		
</footer>
</div>
<!-- //wrapper -->
<script>  
// 쿠키 가져오기  
function getCookie( name ) {  
   var nameOfCookie = name + "=";  
   var x = 0;  
   while ( x <= document.cookie.length )  
   {  
       var y = (x+nameOfCookie.length);  
       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
               endOfCookie = document.cookie.length;  
           return unescape( document.cookie.substring( y, endOfCookie ) );  
       }  
       x = document.cookie.indexOf( " ", x ) + 1;  
       if ( x == 0 )  
           break;  
   }  
   return "";  
}  
  
// 24시간 기준 쿠키 설정하기  
// expiredays 후의 클릭한 시간까지 쿠키 설정  
function setCookie( name, value, expiredays ) {   
   var todayDate = new Date();   
   todayDate.setDate( todayDate.getDate() + expiredays );   
   document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
}  
  
// 00:00 시 기준 쿠키 설정하기  
// expiredays 의 새벽  00:00:00 까지 쿠키 설정  
function setCookieAt00( name, value, expiredays ) {   
    var todayDate = new Date();   
    todayDate = new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
    if ( todayDate > new Date() )  
    {  
    expiredays = expiredays - 1;  
    }  
    todayDate.setDate( todayDate.getDate() + expiredays );   
     document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"   
  }  
   
 function checkPop(){
	 <c:if test="${fn:length(pop_list) > 0 }">
	 <c:forEach items="${pop_list }" var="item" varStatus="status">
	 var blnCookie = getCookie(<c:out value="${item.idx_no}"/>);
	 if( !blnCookie ) { 
		 $("#modal-main<c:out value='${item.idx_no}'/>").addClass("is-expanded");
	  }else{
		  $("#modal-main<c:out value='${item.idx_no}'/>").removeClass("is-expanded");
	  }
	 </c:forEach>
	 </c:if>
 }
 
$(function(){
	checkPop();
	
	$( ".draggable" ).draggable();
	
	$(".act-pop-close").on("click", function(){
		var idx = $(this).data("value");
		$(this).parents(".js-modal").removeClass('is-expanded');
		
		if($(this).parent().find('.checkbox').is(":checked"))
			setCookieAt00(idx, "done", 1);
	});
});
</script>  
</body>
</html>