$(function(){
	var $parent = null;
	
		// 검색하기 버튼 
		$("#searchBtn").click(function(){
			$("section").addClass("backSetting");
			$parent = $("div#container");
			startLoading($parent, "이용가능한 객실을 검색하는 중입니다.");
			
			$(".roomText").remove();
			$(".roomInfo").remove();
			$(".emptyTr").remove();
			
			var sDate = $("#sYear").text() + $("#sMonth").text() + $("#sDay").text();
			var eDate = $("#eYear").text() + $("#eMonth").text() + $("#eDay").text();
			
			$.ajax({
				url: "/Project_JSP/search.do?sDate="+ sDate + "&eDate=" + eDate,
				type : "get",
				dataType : "json",
				success : function(data){
					stopLoading($parent);
					$("section").removeClass("backSetting"); 
					
					// console.log(data);

					$(".deleteTr").remove();
					
					$("#resultTable").append(
						"<tr class='roomText'>" +
							"<td colspan='2'>객실</td> +" +
							"<td colspan='2'>현재 예약 가능한 객실입니다.</td>+" +
						"</tr>");
							
					
					$(data.resultRoom).each(function(i, room){
						$("#resultTable").append(
							"<tr class='roomInfo'>" +
								"<td>" +
									"<img src='/Project_JSP/img/room/"+ room.roomInfoNum.roomInfoName + "/" + room.roomInfoNum.reservationImg +"'>" +
								"</td>" +
								"<td colspan='2'>" + 
									"<div>" +
									"	<span class='roomGrade'>["+ room.roomInfoNum.roomGrade +"]</span>" +
									"	<span class='roomName'>"+ room.roomInfoNum.roomInfoName +"</span><br>" +
									"	<span class='roomSize'>크기 : "+ room.roomInfoNum.roomSize +"</span><br>" +
									"	<span class='roomView'>전망 : "+ data.resultViewType[i]+ "</span>" +
									"</div>" +
								"</td>" +
								"<td>" +
								"	<div>" +
								"		<span class='roomPrice'>"+ room.roomPrice +"~</span><br>" +
								"		<span class='perDay'>원/1박</span>" +
								"		<img class='reservationBtn' src='/Project_JSP/img/reservation/reservationBtn.jpg'>" +
								"	</div>" +
								"</td>" +
								"<td class='hideInfo'>" +
									"<span>"+ i +"</span>" +
								"</td>" +
							"</tr>" +
							"<tr class='emptyTr'>" +
								"<td colspan='4'></td>" +
							"</tr>"
						);
					})
				}
			})

		})
		
					
		// 예약하기 버튼
		$(document).on("click", ".reservationBtn", function(){
			var imgPath = $(this).attr("src");
			
			if(imgPath.indexOf("reservationBtn") > 0){
				$(".reservationBtn").attr("src", "/Project_JSP/img/reservation/reservationBtn.jpg");
			}else if(imgPath.indexOf("closeBtn") > 0){
				$(this).attr("src", "/Project_JSP/img/reservation/reservationBtn.jpg");
				$(".selectViewAndBedTr").remove();
				return;
			}
			
			
			$("section").addClass("backSetting");
			startLoading($parent, "객실 정보를 가져오는 중입니다.");

			$(".selectViewAndBedTr").remove();
			
			var roomName = $(this).parents(".roomInfo").find(".roomName").text();
			var index = $(this).parents(".roomInfo").find(".hideInfo").text();
			var sDate = $("#sYear").text() + $("#sMonth").text() + $("#sDay").text();
			var eDate = $("#eYear").text() + $("#eMonth").text() + $("#eDay").text();
			
			
			$.ajax({
				url: "/Project_JSP/search2.do?name=" + roomName + "&index=" + index + "&sDate="+ sDate + "&eDate=" + eDate,
				type : "get",
				dataType : "json",
				success : function(data){
										
					stopLoading($parent);
					$("section").removeClass("backSetting");
					
					console.log(data);
					
					$(data.roomInfo).each(function(i, room){
						if(i == data.roomInfo.length - 1){
							$(".roomInfo").eq(data.index).after(
								"<tr class='selectViewAndBedTr'>" +
								"	<td colspan='3'><input type='radio' name='selectViewAndBed'> " + 
								"		<span class='viewAndBed'>" + room.roomInfoNum.viewType + " / " + room.roomInfoNum.bedType + "</span>" +
								"		<span class='secondPrice'>"+ room.roomPrice+" 원 ~</span>" +
								"		<span class='hideRoomNum'>"+ room.roomNum+"</span>" +
								"	</td>" +
								"	<td rowspan='"+ data.roomInfo.length +"'>" +
										"<img class='finalBtn' src='/Project_JSP/img/reservation/selectBtn.gif'>" +
									"</td>" +
								"</tr>"					
							);
						}else{
							$(".roomInfo").eq(data.index).after(
								"<tr class='selectViewAndBedTr'>" +
								"	<td colspan='3'><input type='radio' name='selectViewAndBed'> " + 
								" 		<span class='viewAndBed'>" + room.roomInfoNum.viewType + " / " + room.roomInfoNum.bedType + "</span>" +
								"		<span class='secondPrice'>"+ room.roomPrice+" 원 ~</span>" +
								"		<span class='hideRoomNum'>"+ room.roomNum+"</span>" +
								"	</td>" +
								"</tr>"					
							);
						}

					})

				}
			})
			
			$(this).attr("src", "/Project_JSP/img/reservation/closeBtn.jpg");
		})
		
		// 선택 버튼
		
		$(document).on("click", ".finalBtn", function(){
			var radio = $("input[type='radio']");
			var checked = false;

			for(var i = 0; i < radio.length; i++){
				if(radio[i].checked == true){
					checked = true;
					break;
				}
			}
			 
			if(checked == false){ 
				alert("객실 타입을 먼저 선택해주세요.");
			}else{
				var adultNum = $("#adultNum").text();
				var kidNum = $("#kidNum").text();
				var babyNum = $("#babyNum").text();
								
				var roomGrade = $(this).parents(".selectViewAndBedTr").prev(".roomInfo").find(".roomGrade").text();
				var roomName = $(this).parents(".selectViewAndBedTr").prev(".roomInfo").find(".roomName").text();
				var imgIndex = $(this).parents(".selectViewAndBedTr").prev(".roomInfo").find("img").attr("src");
				var roomImg = imgIndex.substr(imgIndex.lastIndexOf("/"));
				
				var roomPrice = "";
				var view = "";
				var bed = "";
				
				var select = $(".selectViewAndBedTr input[type='radio']");
				for(var i = 0; i < select.length; i++){
					if($(select[i]).prop("checked") == true){
						roomPrice = $(select[i]).next().next().text().split("원")[0];
						view = $(select[i]).next().text().split("/")[0];
						bed= $(select[i]).next().text().split("/")[1];
					}
				}
				var sDate = $("#sYear").text() + $("#sMonth").text() + $("#sDay").text();
				var eDate = $("#eYear").text() + $("#eMonth").text() + $("#eDay").text();

				location.href="step2.do?adultNum="+ adultNum + "&kidNum="+ kidNum + "&babyNum=" + babyNum + "&view=" + view +
				"&bed=" + bed + "&roomGrade=" + roomGrade + "&roomName=" + roomName +"&sDate=" + sDate + "&eDate=" + eDate +
				"&roomImg=" + roomImg + "&roomPrice=" + roomPrice;
			}
				
		})
		
		// 인원선택 버튼 이벤트
		$(".selectBtn .selectPlus img").click(function(){
			var imgPath = $(this).attr("src");
			var selectText = $(this).parents(".selectType").find(".selectText").text();
			var adultNum = Number($("#adultNum").text());
			var KidNum = Number($("#kidNum").text());
			var babyNum = Number($("#babyNum").text()); 
			
			if(imgPath.indexOf("selectPlus") > 0 && selectText == "성인"){
				adultNum++;
				$("#adultNum").text(adultNum);
			}else if(imgPath.indexOf("selectPlus") > 0 && selectText == "어린이"){
				KidNum++;
				$("#kidNum").text(KidNum);
			}else if(imgPath.indexOf("selectPlus") > 0 && selectText == "유아"){
				babyNum++;
				$("#babyNum").text(babyNum);
			}else if(imgPath.indexOf("noPlus") > 0){
				alert("객실 1실 당 성인과 소인 동반 시 최대 4인까지만 투숙 가능합니다.");
			}
			$(this).parents(".selectNum").find(".selectMinus img").attr("src", "/Project_JSP/img/reservation/selectMinus.png");
		
			var changeType = adultNum + KidNum + babyNum;
			
			if(changeType < 4){
				$(this).parents(".selectNum").find(".selectPlus img").attr("src", "/Project_JSP/img/reservation/selectPlus.png");
			}
			
			if(changeType >= 4){
				$(this).parents().find(".selectPlus img").attr("src", "/Project_JSP/img/reservation/noPlus.png");
			}
		})
		
		$(".selectBtn .selectMinus img").click(function(){
			var imgPath = $(this).attr("src");
			var selectText = $(this).parents(".selectType").find(".selectText").text();
			var adultNum = Number($("#adultNum").text());
			var KidNum = Number($("#kidNum").text());
			var babyNum = Number($("#babyNum").text());
			
		
			if(imgPath.indexOf("selectMinus") > 0 && selectText == "성인"){
				if(adultNum == 1){
					$("#adultNum").text(adultNum);
					$(this).parents(".selectNum").find(".selectMinus img").attr("src", "/Project_JSP/img/reservation/noMinus.png");
					return;
				}
				adultNum--;
				$("#adultNum").text(adultNum);
			}else if(imgPath.indexOf("selectMinus") > 0 && selectText == "어린이"){
				KidNum--;
				$("#kidNum").text(KidNum);
				if(KidNum == 0){
					$(this).parents(".selectNum").find(".selectMinus img").attr("src", "/Project_JSP/img/reservation/noMinus.png");
				}
			}else if(imgPath.indexOf("selectMinus") > 0 && selectText == "유아"){
				babyNum--;
				$("#babyNum").text(babyNum);
				if(babyNum == 0){
					$(this).parents(".selectNum").find(".selectMinus img").attr("src", "/Project_JSP/img/reservation/noMinus.png");
				}
			}
			var changeType = adultNum + KidNum + babyNum;
			
			if(changeType == 1){
				$(this).parents().find(".selectMinus img").attr("src", "/Project_JSP/img/reservation/noMinus.png");
				return;
			}
			
			if(changeType < 4){
				$(this).parents().find(".selectPlus img").attr("src", "/Project_JSP/img/reservation/selectPlus.png");
			}
		})
		
		// 어린이, 유아 안내문구
		$(".importantImg").eq(0).hover(function(){
			$("span.alertText").eq(0).css("display", "block");
		}, function(){
			$("span.alertText").eq(0).css("display", "none");
		})
		
		$(".importantImg").eq(1).hover(function(){
			$("span.alertText").eq(1).css("display", "block");
		}, function(){
			$("span.alertText").eq(1).css("display", "none");
		})
		
		// 달력 
		var month = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"];
		var sElement = document.getElementById("start-calendar");
		var sCalendar = jsCalendar.new(sElement);
		
		var date = new Date();
		
		// 시작 시 날짜 설정
		$("#sYear").text(date.getFullYear());
		$("#sMonth").text(month[date.getMonth()]);
		
		$("#eYear").text(date.getFullYear());
		$("#eMonth").text(month[date.getMonth()]);
		if(date.getDate() >= 1 && date.getDate() < 10){
			$("#sDay").text("0"+ date.getDate());
		}else{
			$("#sDay").text(date.getDate());
		}
		$("#eDay").text(Number($("#sDay").text()) + 1);
		
		
		
		$("#sDay").click(function(){
			$("#start-calendar").addClass("auto-jsCalendar material-theme shilla");
			$("#start-calendar").css("display", "block");
		})
		
		sCalendar.onDateClick(function(event, date){
			$("#end-calendar").css("display", "none");
			$("#sYear").text(date.getFullYear());
			$("#sMonth").text(month[date.getMonth()]);
			var date = date.getDate();
			if(date >= 1 && date < 10){
				$("#sDay").text("0"+date);
			}else{
				$("#sDay").text(date);
			}
			$("#start-calendar").css("display", "none");
		});
		
		var eElement = document.getElementById("end-calendar");
		var eCalendar = jsCalendar.new(eElement);
		
		$("#eDay").click(function(){
			$("#end-calendar").addClass("auto-jsCalendar material-theme shilla");
			$("#end-calendar").css("display", "block");
		})
		
		eCalendar.onDateClick(function(event, date){
			$("#start-calendar").css("display", "none");
			var sYear = Number($("#sYear").text());
			var sMonth = Number($("#sMonth").text());
			var sDay = Number($("#sDay").text());
			
			if(date.getFullYear() < sYear){
				alert("체크인 날짜보다 이전 날짜를 선택할 수 없습니다.");
				return; 
			} 
			
			if(Number(month[date.getMonth()]) < sMonth){
				alert("체크인 날짜보다 이전 날짜를 선택할 수 없습니다.");
				return; 
			} 
			
			if(Number(month[date.getMonth()]) == sMonth && date.getDate() < sDay){
				alert("체크인 날짜보다 이전 날짜를 선택할 수 없습니다.");
				return; 
			} 
			
			$("#eYear").text(date.getFullYear());
			$("#eMonth").text(month[date.getMonth()]);
			var date = date.getDate();
			if(date >= 1 && date < 10){
				$("#eDay").text("0"+date);
			}else{
				$("#eDay").text(date);
			}
			$("#end-calendar").css("display", "none");
		});

		
		
		
})