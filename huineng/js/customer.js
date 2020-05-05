jQuery(document).ready(function() {
	//alert(2);
});
$("#ChangChart").change(function() {
	console.log('改变');
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas);

});

function pagess() {
	
	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);
	for(var i = 1; i <= page; i++) {
		var oTest = document.getElementById("page");
		var newNode = document.createElement("li");
		var reforeNode = document.getElementById("last");
		
		newNode.innerHTML = "<a href='javascript:fenye(" + i + ");'>" + i + "</a>";
		oTest.insertBefore(newNode, reforeNode);
	}

}
function fenye(index) {

	var clas = $('#ChangChart option:selected').attr('value');
	listload(index, clas);

}

function fenye1(index) {

	var now = $('#now').val();
	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	var page = parseInt(pagess + 1);

	if(index == 1) {
		now = parseInt(now - 1);
		if(now >= 1) {
			listload(now, clas);

		} else {
			alert('这是第一页');
		}

	} else if(index == 2) {
		now = parseInt(now) + parseInt(1);

		if(now <= page) {
			listload(now, clas);

		} else {
			alert('这是最后一页');
		}

	}

}
//添加客户
function add() {
	$('#myModal').modal('show')
}
function addUser(){
	console.log(111)
	var num = $('#addnum').val();
	var name = $('#addname').val();
//	var sex = $('#sex').val();
	var idtype = $('#idtype').val();
	var idcode = $('#idcode').val();
	var province = $('#province').val();
	var city = $('#city').val();
	var address = $('#address').val();
	var email = $('#email').val();
	var qq = $('#qq').val();
	var weixin = $('#weixin').val();
	var mobileone = $('#mobileone').val();
	var mobiletwo = $('#mobiletwo').val();
	var phone = $('#phone').val();
	var bankname = $('#bankname').val();
	var bankcode = $('#bankcode').val();
	var refereeid = $('#refereeid').val();
	var refeid = $('#refeid').val();
	var department = $('#department').val();
	var remarks = $('#remarks').val();
	var createid = $('#createid').val();
	
//	if(sex=='男'){
//		var addsex = 0
//	}else if(sex=='女'){
//		var addsex = 1
//	}else if(sex=='不明'){
//		var addsex = 2
//	}
	var addsex = $('#sex option:selected').attr('value');
	var addidtype = $('#idtype option:selected').attr('value');
	var usertype = $('#usertype option:selected').attr('value');
	var bankdeposit = $('#bankdeposit option:selected').attr('value');
	

	if(name==''){
		alert('请输入姓名')
	}else if(sex==''){
		alert('请输入性别')
	}else if(idtype==''){
		alert('请输入证件类型')
	}else if(idcode==''){
		alert('请输入证件号码')
	}else if(province==''){
		alert('请输入省')
	}else if(city==''){
		alert('请输入市')
	}else if(address==''){
		alert('请输入详细地址')
	}else if(email==''){
		alert('请输入邮箱')
	}else if(qq==''){
		alert('请输入QQ')
	}else if(weixin==''){
		alert('请输入微信')
	}else if(mobileone==''&&mobiletwo==''&&phone==''){
		alert('请输入手机号')
	}else if(usertype==''){
		alert('请输入客户类别')
	}else if(bankdeposit==''){
		alert('请输入开户行')
	}else if(bankname==''){
		alert('请输入开户名')
	}else if(bankcode==''){
		alert('请输入银行账号')
	}else if(refereeid==''){
		alert('请输入推荐人')
	}else if(department==''){
		alert('请输入推荐部门')
	}else if(remarks==''){
		alert('请输入备注')
	}else{
		
		
		$.ajax({
			url: '/userInfo/addUser', // 跳转到 action
			type: 'POST',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'userNum': 1234,
				'name': name,
				'sex': addsex,
				'idType': addidtype,
				'idCode': idcode,
				'province': province,
				'city': city,
				'address': address,
				'email': email,
				'qq': qq,
				'weixin': weixin,
				'mobileOne': mobileone,
				'mobileTwo': mobiletwo,
				'regularPhone': phone,
				'userType': usertype,
				'bankDeposit': bankdeposit,
				'bankName': bankname,
				'bankCode': bankcode,
				'refereeId': refeid,
				'refereeDepartment': department,
				'remarks': remarks,
				'createId': createid,
				'createId':12312
			},
			dataType: "json", //返回结果格式
			success: function(data) {
				alert(data.msg);
				$('#myModal').modal('hide');
				listload(1, clas);
				$('.reset').trigger('click');
			},
			error: function() {
				console.log('请求失败')
			}
		});
		
	}
	
}
function addcancel(){
	$('#myModal').modal('hide');
	$('.reset').trigger('click');
}
function xzcon(){
	$('#addxmxz').html('');
	$('#sutup').modal('show');
	
	$.ajax({
		url: '/user/dataGrid', // 跳转到 action
		type: 'POST',
		data: {
			'page': 1,
			'rows': 1000,
			
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.rows;

			for(var i = 0; i < allList.length; i++) {

				var map=[];
				if(allList[i].rolesList!=null){
					for(var j = 0; j < allList[i].rolesList.length; j++) {
					var childrenItem =allList[i].rolesList[j].name;
						
					
					map[j]=allList[i].rolesList[j].name;
					var js=map;
//						console.log(js)
					}
				}
				var html = '';
				html += '<tr><td>'+allList[i].name+'</td><td>'+allList[i].phone+'</td><td>'+allList[i].organizationName+'</td><td>'+js+'</td><td><a class="btn btn1" href="javascript:xmxz('+allList[i].id+')" >选择</a></td></tr>';
				$('#addxmxz').append(html);

			}
		},
		error: function() {

		}
	});

}
function xmxz(id){
	$('#xxid').val(id);
	$.ajax({
		url: '/user/getUserInfo', // 跳转到 action
		type: 'POST',
		data: {
			'id': id,
	
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#sutup').modal('hide');
			$('#refereeid').val(data.obj.name);
			$('#refeid').val(data.obj.id);
			$('#department').val(data.obj.organizationName);
		

		},
		error: function() {

		}
	});
	
}
//投资记录
function investment(page, pagesize,userId){
	
	$("#invastab").html('')
		
	$.ajax({
		url: '/userInfo/findInvestProductByUserid', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'page':page,
			'pagesize':pagesize,
			'userId': userId,
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data);
			var all = data.obj.list;
			if(data.success ==true){
				$('#investment').modal('show');
				for (var i = 0; i < all.length; i++) {
					if(all[i].type==1){
						var type = '债券型'
					}else if(all[i].type==2){
						var type = '股权型'
					}
					/*if(all[i].applyTime==1){
						var applyTime = '股权型'
					}else if(all[i].applyTime==2){
						var applyTime = '货币型'
					}else if(all[i].applyTime==3){
						var applyTime = '偏股型'
					}else if(all[i].applyTime==4){
						var applyTime = '股债平衡型'
					}else if(all[i].applyTime==5){
						var applyTime = '偏债型'
					}else if(all[i].applyTime==6){
						var applyTime = '债券型'
					}else if(all[i].applyTime==7){
						var applyTime = '保本型'
					}else if(all[i].applyTime==8){
						var applyTime = '指数型'
					}else if(all[i].applyTime==9){
						var applyTime = '短债型'
					}*/
					var applyTime = all[i].applyTime + '月'
					
					
				var html = '';
				if(all[i].incomeRatio==''){
					html += '<tr><td>'+all[i].name+'</td><td>'+type+'</td><td>'+all[i].createTime+'</td><td>'+applyTime+'</td><td>'+all[i].applyMoney+'</td><td>'+all[i].incomeRatio+'</td><td>'+all[i].employeeName+'</td></tr>'
				}else{
					html += '<tr><td>'+all[i].name+'</td><td>'+type+'</td><td>'+all[i].createTime+'</td><td>'+applyTime+'</td><td>'+all[i].applyMoney+'</td><td>'+all[i].incomeRatio+'%</td><td>'+all[i].employeeName+'</td></tr>'
				}
				
				$('#invastab').append(html);	
				
			}
			}else{
				alert(data.msg);
				$('#investment').modal('hide');
			}
		},
		error: function() {
			console.log('请求失败')
			}
		});
}
function invescancel(){
	$('#investment').modal('hide');
}
//个人详情
var id = '';
function personal(userId) {
	id = userId
	$.ajax({
		url: '/userInfo/findUserBuUserID', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'userId': userId,
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data);
			
			var all = data.obj
			if(data.success ==true){
				$('#personal').modal('show');

				$("#pername").val(all.name)
				$("#persex").val(all.sex)
				
				$("#perid_type").val(all.idType)
				$("#perid_code").val(all.idCode)
				$("#perprovince").val(all.province)
				$("#percity").val(all.city)
				$("#peraddress").val(all.address)
				$("#peremail").val(all.email)
				$("#perqq").val(all.qq)
				$("#perweixin").val(all.weixin)
				$("#permobile_one").val(all.mobileOne)
				$("#permobile_two").val(all.mobileTwo)
				$("#perphone").val(all.regularPhone)
				$("#peruser_types").val(all.userType)
				$("#perdeposit").val(all.bankId)
				$("#perbank_name").val(all.bankName)
				$("#perbank_code").val(all.bankCode)
				$("#perid").val(all.refereename)
				$("#pid").val(all.refereeId)
				$("#perdepartment").val(all.refereeDepartment)
				$("#perremarks").val(all.remarks)
				
			}else{
				alert(data.msg);
				$('#personal').modal('hide');
			}
		},
		error: function() {
			alert('请求失败')
			}
		});
}
function percancel(){
	$('#personal').modal('hide');
}
function mod(){
	$('#addxmxz1').html('');
	$('#sutup1').modal('show');
	
	$.ajax({
		url: '/user/dataGrid', // 跳转到 action
		type: 'POST',
		data: {
			'page': 1,
			'rows': 1000,
			
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.rows;

			for(var i = 0; i < allList.length; i++) {

				var map=[];
				if(allList[i].rolesList!=null){
					for(var j = 0; j < allList[i].rolesList.length; j++) {
					var childrenItem =allList[i].rolesList[j].name;
						
					
					map[j]=allList[i].rolesList[j].name;
					var js=map;
//						console.log(js)
					}
				}
				var html = '';
				html += '<tr><td>'+allList[i].name+'</td><td>'+allList[i].phone+'</td><td>'+allList[i].organizationName+'</td><td>'+js+'</td><td><a class="btn btn1" href="javascript:tjr('+allList[i].id+')" >选择</a></td></tr>';
				$('#addxmxz1').append(html);

			}
		},
		error: function() {

		}
	});
}
function tjr(id){
	$('#xxid').val(id);
	$.ajax({
		url: '/user/getUserInfo', // 跳转到 action
		type: 'POST',
		data: {
			'id': id,
	
		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#sutup1').modal('hide');
			$('#perid').val(data.obj.name);
			$('#pid').val(data.obj.id);
			$('#perdepartment').val(data.obj.organizationName);
		

		},
		error: function() {

		}
	});
	
}
function modify() {
	console.log('修改')
	var name = $("#pername").val()
	var addsex = 	$("#persex").val()
	var addidtype = 	$("#perid_type").val()
	var idcode = 	$("#perid_code").val()
	var naprovinceme = 	$("#perprovince").val()
	var city = 	$("#percity").val()
	var address = 	$("#peraddress").val()
	var email = 	$("#peremail").val()
	var qq = 	$("#perqq").val()
	var weixin = 	$("#perweixin").val()
	var mobileone = 	$("#permobile_one").val()
	var mobiletwo = 	$("#permobile_two").val()
	var phone = 	$("#perphone").val()
	var usertype = 	$("#peruser_types").val()
	var bankdeposit = 	$("#perdeposit").val()
	var bankname = 	$("#perbank_name").val()
	var bankcode = 	$("#perbank_code").val()
	var refereeid = 	$("#pid").val()
	var department = 	$("#perdepartment").val()
	var remarks = 	$("#perremarks").val()
	if(name==''){
		alert('请输入姓名')
	}else if(addsex==''){
		alert('请输入性别')
	}else if(addidtype==''){
		alert('请输入证件类型')
	}else if(idcode==''){
		alert('请输入证件号码')
	}else if(naprovinceme==''){
		alert('请输入省')
	}else if(city==''){
		alert('请输入市')
	}else if(address==''){
		alert('请输入详细地址')
	}else if(email==''){
		alert('请输入邮箱')
	}else if(qq==''){
		alert('请输入QQ')
	}else if(weixin==''){
		alert('请输入微信')
	}else if(mobileone==''&&mobiletwo==''&&phone==''){
		alert('请输入手机号')
	}else if(usertype==''){
		alert('请输入客户类别')
	}else if(bankdeposit==''){
		alert('请输入开户行')
	}else if(bankname==''){
		alert('请输入开户名')
	}else if(bankcode==''){
		alert('请输入银行账号')
	}else if(refereeid==''){
		alert('请输入推荐人')
	}else if(department==''){
		alert('请输入推荐部门')
	}else if(remarks==''){
		alert('请输入备注')
	}else{
	$.ajax({
		url: '/userInfo/updateUser',// 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: {
			'id': id,
			'userNum': 1,
			'name': name,
			'sex': addsex,
			'idType': addidtype,
			'idCode': idcode,
			'province': naprovinceme,
			'city': city,
			'address': address,
			'email': email,
			'qq': qq,
			'weixin': weixin,
			'mobileOne': mobileone,
			'mobileTwo': mobiletwo,
			'regularPhone': phone,
			'userType': usertype,
			'bankDeposit': bankdeposit,
			'bankName': bankname,
			'bankCode': bankcode,
			'refereeId': refereeid,
			'refereeDepartment': department,
			'remarks': remarks,
			'updateId': 1
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data);
			
			alert(data.msg);
			$('#personal').modal('hide');
			listload(1, clas);
			
		},
		error: function() {
			console.log('请求失败')
			}
		});
	}
}
//查询
function query(page, pagesize) {
	console.log('查询')
	$('#page').html('');
	$('#mytbody').html('');
	$('#now').val(page);
	$.ajax({
		url: '/userInfo/getAllUser', // 跳转到 action
		type: 'POST',
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data:{
			'page':page,
			'pagesize':pagesize,
		},
		dataType: "json", //返回结果格式
		success: function(data) {
			console.log(data)
			var allList = data.obj.list;
			for(var i = 0; i < allList.length; i++) {
				if(allList[i].sex == 0) {
					var sex = '男';
				} else if(allList[i].sex == 1) {
					var sex = '女';
				} else if(allList[i].sex == 2) {
					var sex = '不明';
				}
				
				if(allList[i].mobile_one != "") {
					var mobile = allList[i].mobile_one;
				}
				if(!allList[i].mobile_two != '') {
					var mobile = allList[i].mobile_two;
				} 
				if(!allList[i].regular_phone != '') {
					var mobile = allList[i].regular_phone;
				} 
				console.log(mobile)
				
				
				if(allList[i].user_type == 0) {
					var user_type = '个人';
				} else if(allList[i].user_type == 1) {
					var user_type = '机构';
				}
				id = allList[i].id
				var name = allList[i].name;
				var qurname = $("#total_name").val()
				
				if(name == qurname){
					var html = '';
				html += '<tr><td>'+allList[i].userNum+'</td><td>'+allList[i].name+'</td><td>'+sex+'</td><td>'+mobile+'</td><td>'+user_type+'</td><td>'+allList[i].employeeName+'</td><td>'+allList[i].create_date+'</td><td><a class="btn btn-default btn-sm" onclick="investment(1, clas, '+allList[i].id+')">投资记录</a><a class="btn btn-default btn-sm" onclick="personal('+allList[i].id+')">个人详细信息</a></td></tr>';
				$('#mytbody').append(html);
				}
				
			}
			
			var page = '';
			page += '<input type="hidden" id="pagess" value="" /><li><a href="javascript:fenye1(1)" aria-label="Previous"><span aria-hidden="true">上一页</span></a></li><li id="last"><a href="javascript:fenye1(2)" aria-label="Next"><span aria-hidden="true">下一页</span></a></li>';
			$('#page').append(page);
$('#pagess').val(data.total);
			pagess();
		},
		error: function() {
			console.log('请求失败')
		}
	});
}