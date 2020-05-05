function login() {
	var name = $('#name').val();
	var pass = $('#pass').val();
	var che = $("#che").is(":checked");

	if(name == '') {
		alert('请输入用户名');

	} else if(pass == '') {
		alert('请输入密码');
	} else {

//		if($("#che").is(":checked")) {
//			alert(11);
//		} else {
//			alert(2);
//		}

		$.ajax({
			url: '/login', // 跳转到 action
			type: 'POST',
			async: false,
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				'username': name,
				'password': pass
			},
			dataType: "json", //返回结果格式
			success: function(data) {

				if(data.success == false) {
					alert(data.msg);

				} else {
					window.location.href = '/index';
				}

			},
			error: function() {

				// view("异常！");
				//				$.alert("异常！");
			}
		});

	}

}