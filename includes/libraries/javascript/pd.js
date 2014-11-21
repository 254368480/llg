function pd(){
		
		var  ad_name = theForm.ad_name.value;
		var  ad_link = theForm.ad_link.value;
		var  ad_int = theForm.ad_int.value;
		
		
		if(ad_name == ""){
			  
			  alert("广告名称不能为空");
			  theForm.ad_name.focus();
			  return false;
		}
		else if(ad_link == ""){
			  alert("广告链接不能为空");
			  theForm.ad_link.focus();
			  return false;
		}
		else if(ad_int == ""){
			  alert("广告积分不能为空");
			  theForm.ad_int.focus();
			  return false;
		}
		else{
			  return true;
		}
	
}