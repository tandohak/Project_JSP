	$(function(){
		
		$("#select_email").change(function(){
			$("#com").val($(this).val());
		})
	
		$("#submit").click(function(){
			
			var check = $("#check_btn").is(":checked");
			var empty = isEmpty();
			
			/*만약 회원이라면 개인정보 동의에 동의할 필요가 없다.*/
			if($("#hiddenmember").val()!=""){
				check=true;
			}
			
			if(empty==false){
				alert("필수항목을 입력해주세요");
				return false;
			}
			if(check==false){
				alert("개인정보 수집에 동의해 주세요");
				return false;
			}
			if(check&&empty){
				$("textarea").val($("textarea").val().replace(/(?:\r\n|\r|\n)/g, '<br />'));
				$("#f").submit();
			}
			
		})
	})
	/*공백확인*/
	function isEmpty(){
		var err = true;
		
		$(".import").each(function(j,obj){
			
			if($(this).val()==""){
				$(this).focus();
				err = false;
			}
			
		})
		
		return err;
		
	}