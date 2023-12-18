$(document).ready(function () {
	/*$('.carousel').carousel({
		interval : 5000
	});*/

	$('.nav > li.dropdown > a').click(function (e) {
		var $target = $(e.target);
		var activeNav = $(this).siblings();
		if ($target.is('b')) {
			$(this).siblings().toggle("fast");
			$('.nav > li.dropdown > ul.dropdown-menu:visible').not($(this).siblings()).hide("fast");
			return false;
		}
	});

	signup.init();
});

var signup = {
	init : function () {
		var t = this;
		var $frm = $('#frm-signup');
		var $txtname = $frm.find('#txt-name');
		var $txtemail = $frm.find('#txt-email-address');
		var namePlaceholder = $txtname.attr('placeholder');
		var emailPlaceholder = $frm.find('#txt-email-address').attr('placeholder');

		t.placeholder($txtname, namePlaceholder);
		t.placeholder($txtemail, emailPlaceholder);

		$('#btn-toggle-subscribe').toggle(function (e) {
			e.preventDefault();
			$txtname.attr('value', namePlaceholder);
			$txtemail.attr('value', emailPlaceholder);
			t.open();
		}, function (e) {
			e.preventDefault();
			t.close();
		});

		var MailingListAdhoc = new Date();

		$('#btn-signup-subscribe').click(function (e) {
			e.preventDefault();

			if ($txtname.attr('value') == namePlaceholder) {
				$txtname.attr('value', '');
			}
			if ($txtemail.attr('value') == emailPlaceholder) {
				$txtemail.attr('value', '');
			}
			if (true) {
				/* default category assigned for mailing listing is 'Investor News' - 28-03-2013 */
				var array_values = [];
				array_values.push(2); // id value of Investor News

				// Now you can store your values in a comma separated list
				var arrayValues = array_values.join(',');

				if ($txtname.attr('value') == namePlaceholder || $txtname.attr('value') == '') {
					alert("Please input your name.");
					e.preventDefault();
					return;
				}

				if ($txtemail.attr('value') == emailPlaceholder || $txtemail.attr('value') == '') {
					alert("Please input your email address.");
					e.preventDefault();
					return;
				} else {
					if (!(_IsValidEmail($txtemail.attr('value')))) {
						alert("Please input a valid email address.");
						e.preventDefault();
						return;
					}
				}

				var data = '?WebCall=SubmitData&MailingListAdhoc=' + MailingListAdhoc.getFullYear() + '&txt-name=' + $('#txt-name').val() + '&txt-email-address=' + $('#txt-email-address').val() + '&CategoryName=' + arrayValues;
				var htmlbak = $('div#frm-signup ol').html();
				$('div#frm-signup ol').html('<li><p>submitting please wait...</p></li>');
				$('#btn-signup-subscribe').hide();
				$.ajax({
					url : '/Admin/MailingList.aspx' + data,
					contentType : "text/html; charset=utf-8",
					data : "{}",
					async : false,
					cache : false,
					success : function (data) {
						$('div#frm-signup ol').html('');
						$('div#frm-signup ol').append(data);
					},
					error : function () {
						alert('Connection error. Please try again later.');
						$('div#frm-signup ol').html(htmlbak);
						$('#btn-signup-subscribe').show();
					}
				});
			}
		});
	},
	open : function () {
		$('#popover').fadeIn('fast');
	},
	close : function () {
		$('#popover').fadeOut('fast');
	},
	placeholder : function ($target, placeholder) {
		$target.focus(function () {
			var $self = $(this);
			if ($self.attr('value') == placeholder)
				$self.attr('value', '');
		}).blur(function () {
			var $self = $(this);
			if ($self.attr('value') == '')
				$self.attr('value', placeholder);
		});
	}
};

var _IsValidEmail = function (email) {
	var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	return filter.test(email);
};


/*Sherlyn added JS for subscribe webservice*/
$(document).ready(function() {
	$('[id$=pnlEmailForm]').parent().next().remove();
    var runapifirst = false;
    $('.ModDNNCentricMultilanguageFormsC input[type=image]').on("click", function(e) {
		
		var salutation = $('[id$=ddl_Salutation]').val();
		var name = $('[id$=txt_Name]').val()
		var email = $('[id$=txt_Email]').val()
		var homenumber = $("[id$=txt_HomeNumber]").val();
		var officenumber = $("[id$=txt_OfficeNumber]").val();
		var mobilenumber = $("[id$=txt_MobileNumber]").val();
		var companyname = $("[id$=txt_CompanyName]").val();
		var companywebsite = $("[id$=txt_CompanyWebsite]").val();
		var typeofbiz = $("[id$=txt_TypeofBusiness]").val();
		var shoplocation = $("[id$=txt_CurrentShopLocation]").val();
		var ischainstore = document.getElementById("dnn_ctr7745_ViewEmailForm_dcc_rdl_Doyouhavemorethanoneshop_0").checked;
		var stringischainstore = '';
		if (ischainstore)
			stringischainstore = 'Yes';
		else
			stringischainstore = 'No';
			
		if (name == '') {
			$('.dnnFormMessage.dnnFormValidationSummary').hide();
			$('<div class="dnnFormMessage dnnFormValidationSummary">Name is Mandatory</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
			e.preventDefault();
		} else if (email == '') {
			$('.dnnFormMessage.dnnFormValidationSummary').hide();
			$('<div class="dnnFormMessage dnnFormValidationSummary">Email is Mandatory</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
			e.preventDefault();
		} else if (!isEmail(email)) {
			$('.dnnFormMessage.dnnFormValidationSummary').hide();
			$('<div class="dnnFormMessage dnnFormValidationSummary">Email is invalid</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
			e.preventDefault();
		} else if (companyname == '') {
			$('.dnnFormMessage.dnnFormValidationSummary').hide();
			$('<div class="dnnFormMessage dnnFormValidationSummary">CompanyName is Mandatory</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
			e.preventDefault();
		} else {
			if(runapifirst == true)
			{
				runapifirst = false;
				return;
			}
				e.preventDefault();
				var info = { Salutation : salutation, Contactname : name , Email : email , Homenumber : homenumber, Officenumber: officenumber , Mobilenumber : mobilenumber , Companyname : companyname , Companywebsite : companywebsite , Ischainstore : stringischainstore , Businesstype : typeofbiz , Currentlocation : shoplocation};
				console.log(info);
				$('.dnnFormMessage.dnnFormValidationSummary').hide();
				$.ajax({
					type: 'POST',
					url: '/DesktopModules/SMRTTenderAlertsWebAPI/API/WebService/InsertForm',
					data: JSON.stringify(info),
					dataType: 'json',
					contentType: "application/json",
					success: function(data) {
						console.log(data);
						//$('<div class="dnnFormMessage dnnFormSuccess">'+data+'</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
						runapifirst = true;
						$('.ModDNNCentricMultilanguageFormsC input[type=image]').click();
					},
					error: function(data) {
						e.preventDefault();
						$('.dnnFormMessage.dnnFormValidationSummary').hide();
						$('<div class="dnnFormMessage dnnFormValidationSummary">Error Occured. Please try again.</div>').insertBefore('.ModDNNCentricMultilanguageFormsC input[type=image]');
						console.log(data);
						runapifirst = false;
					}
				});
				
		}
		
    });
});

    function isEmail(email) {
        var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        return regex.test(email);
    }