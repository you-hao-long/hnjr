$("#ChangChart").change(function() {
	console.log('改变');
	var clas = $('#ChangChart option:selected').attr('value');

	listload(1, clas);

});



function pagess() {

	var pagess = $('#pagess').val();
	var clas = $('#ChangChart option:selected').attr('value');
	pagess = pagess / clas;
	paget=pagess % clas;
//	alert(paget);
	if(paget==0){
		var page=parseInt(pagess);
	}else{
		var page = parseInt(pagess + 1);
	}
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

function add() {

	$('#myModal').modal('show');
	
	$.ajax({
		url: '/product/getProductIdNum', // 跳转到 action
		type: 'POST',
		
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

	      $('#podid').val(data.msg)

		},
		error: function() {

		}
	});
	
}

function sut() {
	$('#addxmxz').html('');
	$('#sutup').modal('show');

	$.ajax({
		url: '/project/findProjectAll', // 跳转到 action
		type: 'POST',
		data: {
			"page": 1,
			'pagesize': 10000,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {

			var allList = data.obj.list;

			for(var i = 0; i < allList.length; i++) {

				if(allList[i].financingType == 1) {
					var type = '股权型';
				} else if(allList[i].financingType == 2) {
					var type = '货币型';
				} else if(allList[i].financingType == 3) {
					var type = '偏股型';
				} else if(allList[i].financingType == 4) {
					var type = '股债平衡型';
				} else if(allList[i].financingType == 5) {
					var type = '偏债型';
				} else if(allList[i].financingType == 6) {
					var type = '债券型';
				} else if(allList[i].financingType == 7) {
					var type = '保本型';
				} else if(allList[i].financingType == 8) {
					var type = '指数型';
				} else if(allList[i].financingType == 9) {
					var type = '短债型';
				}

				if(allList[i].state == 1) {
					var state = '立项';
				} else if(allList[i].state == 2) {
					var state = '立项审核';

				} else if(allList[i].state == 3) {
					var state = '立项尽职调查';

				}else if(allList[i].state == 4){
					var state = '项目评审';
				}else if(allList[i].state == 5){
					var state = '项目小组跟进';
				}else if(allList[i].state == 6){
					var state = '申请出款';
				}else if(allList[i].state == 7){
					var state = '财务放款';
				}else if(allList[i].state == 8){
					var state = '清算';
				}else if(allList[i].state == 9){
					var state = '结束';
				}

				var html = '';

				html += '<tr><td class=" col-xs-1">'+allList[i].projectName+'</td><td class=" col-xs-1">'+type+'</td><td class=" col-xs-1">'+allList[i].createTime+'</td><td class=" col-xs-2">'+allList[i].name+'</td><td class=" col-xs-1">'+state+'</td><td class=" col-xs-1">'+allList[i].manageName+'</td><td class=" col-xs-1"><a class="btn btn1" href="javascript:xmxz('+allList[i].id+')" >选择</a></td></tr>';

				$('#addxmxz').append(html);

			}

		},
		error: function() {

		}
	});

}


function xmxz(index){
	$('#sutup').modal('hide');
	
	$.ajax({
		url: '/project/findProjectByProjectNum', // 跳转到 action
		type: 'POST',
		data: {
			"id":index,

		},
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		dataType: "json", //返回结果格式
		success: function(data) {
			$('#prjname').val(data.obj.projectname);
			$('#prjid').val(data.obj.projectidnum);
			$('#prjid1').val(data.obj.id);
			$('#prj1').val(data.obj.financing);
			$('#prj2').val(data.obj.userName);
			$('#prj3').val(data.obj.dockingcontact);
			$('#userId').val(data.obj.userid);


		},
		error: function() {

		}
	});
	
	
}


function chanpian(){
	$('#addxmxz1').html('');
	$('#sutup1').modal('show');
	
	$.ajax({
		url: '/user/dataGrid', // 跳转到 action
		type: 'POST',
		data: {
			'page': 1,
			'rows': 1000000,
			
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

				html += '<tr><td>'+allList[i].name+'</td><td>'+allList[i].phone+'</td><td>'+allList[i].organizationName+'</td><td>'+js+'</td><td><a class="btn btn1" href="javascript:xmxz1('+allList[i].id+')" >选择</a></td></tr>';

				$('#addxmxz1').append(html);

			}
			

		

		},
		error: function() {

		}
	});
	
}


function xmxz1(id){
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
			$('#formGroupInputSmall').val(data.obj.name);
			$('#xxiphone').val(data.obj.phone);
			$('#employeeId').val(data.obj.id);
		

		},
		error: function() {

		}
	});
	
}