(function($) {
	
	// init irl object
	irl = {

		// common
		base_url : $('div.meta').attr('base-url'),

		init : function() {

			// don't submit form when calendar picker button is clicked
			$('.bfCalendar').click(function(e){
				e.preventDefault();
			});

			// validation: validate form on submit
			$('#move_type_form, #page_2_form').submit(function(e) {
				irl.validate(e, $(this));
			});

			// init datepicker
			if($('.datepicker').length > 0) {
				$( ".datepicker" ).datepicker();
			}
			if($('#page_2_form').length>0){
				$('input[name="destination_zip"]').focus();
			}
		},

		canada_1 : {
			
			setup: function() {
				
				// show hide appropriate field based on move type
				$('#move_type').change(function() {

					$('.move-type').hide().find('select, input').attr('disabled', 'disabled');
					$('.FPnearestTown').hide();
					$('.DPnearestTown').hide();
					switch ($(this).val()) {

						case 'CanadaToCanadaLeads' :
							$('.move-type.from.province, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;

						case 'CanadaToUSALeads' :
							$('.move-type.from.province, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;

						case 'USAToCanadaLeads' :
							$('.move-type.from.city, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;

						case 'USAToUSALeads' :
							$('.move-type.from.city, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;
					}

				});

				// validation: remove error from field on focus
				$('#move_type_form').on('focus', 'select, input', function() {

					$(this).removeClass('error');

				});
			}
		},

		canada_2 : {

			setup: function() {
				
				// save autocomplete inputs to var
				irl.ac_inputs = irl.ac_inputs || $( '[name="from_city"], [name="destination_city"]' );
				irl.zip_from = $( '[name="from_zip"]' );
				irl.zip_to = $( '[name="destination_zip"]' );

				// add / remove rollover class
				$('.bfElemWrap').on({
					mouseenter: function(){
						$(this).addClass("bfRolloverBg");
					},
					mouseleave: function(){
						$(this).removeClass("bfRolloverBg");
					}
				});
				
				// if city fields have a value make them read only otherwise make them autocomplete
				
				
			
			}
		},

        international: {
            setup: function () {
				

                var selectOrigin = jQuery('#origin-country'),
                    originZip = jQuery('#bfElemWrap1453'),
                    chooseProvince = jQuery('#choose-province');
                selectOrigin.change(function () {;
                    var val = jQuery(this).find(':selected').attr('value');
                    switch (val) {
                        case 'usa':
                            originZip.show();
                            originZip.find('input').prop('disabled', false);
                            chooseProvince.hide();
                            chooseProvince.find('select').prop('disabled', true);
                            break;
                        case 'canada':
                            originZip.hide();
                            originZip.find('input').prop('disabled', true);
                            chooseProvince.show();
                            chooseProvince.find('select').prop('disabled', false);
                            break;
                        default:
                            originZip.hide();
                            originZip.find('input').prop('disabled', true);
                            chooseProvince.hide();
                            chooseProvince.find('select').prop('disabled', true);
                    }
                });
                selectOrigin.trigger('change');

				$('input[name="phone_type"]').change(function(){
					var val = $(this).val();
					console.log("radio: " + val);
					if(val == 'usa'){
						$('#intphone').hide();
						$('input[name="phone_field"]').attr('irl-required',true);
						$('input[name="int_phone"]').attr('irl-required',false);
						$('input[name="int_phone"]').attr('disabled','disabled');
						$('input[name="phone"]').removeAttr('disabled');
						$('input[name="phone2"]').removeAttr('disabled');
						$('input[name="phone3"]').removeAttr('disabled');
						$('input[name="phone_field"]').removeAttr('disabled');
						$('#usaphone').show();
					}else if(val == 'int'){
						$('#usaphone').hide();
						$('input[name="int_phone"]').attr('irl-required',true);
						$('input[name="phone_field"]').attr('irl-required',false);
						$('input[name="phone_field"]').attr('disabled','disabled');
						$('input[name="phone"]').attr('disabled','disabled');
						$('input[name="phone2"]').attr('disabled','disabled');
						$('input[name="phone3"]').attr('disabled','disabled');
						$('input[name="int_phone"]').removeAttr('disabled');
						$('#intphone').show();
					}
				})
				$("form input[type=text]").keyup(function (e) {
					var maxLength = $(this).attr('maxlength');
					
					if($(this).val().length >= maxLength) {
						$(this).blur();
						var nextIdx = $("form input[type=text]").index(this) + 1;
						$(":input:text:eq(" +nextIdx + ")").focus();
					}
				});                
            }
        },

        international_2: {
            setup: function () {
/*            	console.log('tuu');
                var usaPhoneBlock = jQuery('#us_phone'),
                    intPhoneBlock = jQuery('#int_phone'),
                    phoneType = jQuery('input[name="phone_type"]'),
                    onRadioChange = function () {
                    	console.log(this.value);
                        switch (this.value) {
                            case 'usa':
                                usaPhoneBlock.show();
                                usaPhoneBlock.find('input').prop('disabled', false);
                                intPhoneBlock.hide();
                                intPhoneBlock.find('input').prop('disabled', true);
                                break;
                            case 'int':
                                usaPhoneBlock.hide();
                                usaPhoneBlock.find('input').prop('disabled', true);
                                intPhoneBlock.show();
                                intPhoneBlock.find('input').prop('disabled', false);
                                break;
                            default:
                                usaPhoneBlock.hide();
                                usaPhoneBlock.find('input').prop('disabled', true);
                                intPhoneBlock.hide();
                                intPhoneBlock.find('input').prop('disabled', true);
                        }
                    };

                phoneType.click(onRadioChange);
                onRadioChange();

                if (usaPhoneBlock.find('input:first-child').val().length > 0) {
                    phoneType[0].click();
                } else if (intPhoneBlock.find('input').val().length > 0) {
                    phoneType[1].click();
                }*/

                irl.ac_inputs = $( '[name="from_city"]' );
                irl.canada_2.setup();
            }
        },
		office_1 : {
			
			setup: function() {
				
				
				// show hide appropriate field based on move type
				$('#move_type').change(function() {

					$('.move-type').hide().find('select, input').attr('disabled', 'disabled');
					$('.FPnearestTown').hide();
					$('.DPnearestTown').hide();
					switch ($(this).val()) {

						case 'USAToUSALeads' :
							$('.move-type.from.city, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;

						case 'CanadaToCanadaLeads' :
							$('.move-type.from.province, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;

						case 'CanadaToUSALeads' :
							$('.move-type.from.province, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;

						case 'USAToCanadaLeads' :
							$('.move-type.from.city, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;
					}

				});

				// validation: remove error from field on focus
				$('#move_type_form').on('focus', 'select, input', function() {

					$(this).removeClass('error');

				});
			}
		},

		office_2 : {


			setup: function() {
				
				// save autocomplete inputs to var
				irl.ac_inputs = irl.ac_inputs || $( '[name="from_city"], [name="destination_city"]' );
				irl.zip_from = $( '[name="from_zip"]' );
				irl.zip_to = $( '[name="destination_zip"]' );

				// add / remove rollover class
				$('.bfElemWrap').on({
					mouseenter: function(){
						$(this).addClass("bfRolloverBg");
					},
					mouseleave: function(){
						$(this).removeClass("bfRolloverBg");
					}
				});
				
				// if city fields have a value make them read only otherwise make them autocomplete
			
				
			}
		},

		canada_auto : {
			
			setup: function() {
				
				// show hide appropriate field based on move type
				$('#move_type').change(function() {

					$('.move-type').hide().find('select, input').attr('disabled', 'disabled');
					$('.FPnearestTown').hide();
					$('.DPnearestTown').hide();
					switch ($(this).val()) {

						case 'CanadaToCanadaLeads' :
							$('.move-type.from.province, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;

						case 'CanadaToUSALeads' :
							$('.move-type.from.province, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;

						case 'USAToCanadaLeads' :
							$('.move-type.from.city, .move-type.to.province').show().find('select, input').removeAttr('disabled');
						break;

						case 'USAToUSALeads' :
							$('.move-type.from.city, .move-type.to.city').show().find('select, input').removeAttr('disabled');
						break;
					}

				});

				// validation: remove error from field on focus
				$('#move_type_form').on('focus', 'select, input', function() {

					$(this).removeClass('error');

				});
			}
		},

		canada_auto_2 : {

			setup: function() {
				
				// save autocomplete inputs to var
				irl.ac_inputs = irl.ac_inputs || $( '[name="from_city"], [name="destination_city"]' );
				irl.zip_from = $( '[name="from_zip"]' );
				irl.zip_to = $( '[name="destination_zip"]' );

				// add / remove rollover class
				$('.bfElemWrap').on({
					mouseenter: function(){
						$(this).addClass("bfRolloverBg");
					},
					mouseleave: function(){
						$(this).removeClass("bfRolloverBg");
					}
				});
				
				// if city fields have a value make them read only otherwise make them autocomplete
				
				
			
			}
		},	

		from_zip : {

			setup: function() {

					if(is_staging == 1){
						if (typeof host != 'undefined'){
							var defurl = host;
						}
						else{
							var defurl = 'staging.moving360.net';
						}
					}else{
						var defurl = 'moving360.net';
					}

				
			}

		},

		phone_validation : {
			setup: function() {
				if(is_staging == 1){
					if (typeof host != 'undefined'){
						var defurl = host;
					}
					else{
						var defurl = 'staging.moving360.net';
					}
				}else{
					var defurl = 'moving360.net';
				}

				$('input[name="phone_field"]').change(function(){
					var phone = $('input[name="phone_field"]').val();
					if(phone.length == 14){
						$.ajax({
							url:'http://'+defurl+'/ajax/verify_phone',
							data:{phone:phone,verification:'123456'},
							type:"POST",
							dataType:"json",
							success:function(data){
								if(data.status == 1){
									$('input[name="phone_field"]').css('border-color','#ccc');
									$('input[name="phone_field"]').css('background','#fff');
									$('div.invalid_phone').hide();
								}else{
									$('input[name="phone_field"]').css('border-color','red');
									$('input[name="phone_field"]').css('background','url(../_assets/img/invalid_phone.png) no-repeat 97% center');
									$('input[name="phone_field"]').css('background-color','#ffffff');
									$('input[name="phone_field"]').css('background-size','25px 25px');
									$('div.invalid_phone').show();
								}
							}
						})
					}
				})				
			}
		},

		validate: function(e, form) {
			
			$('button[name="submit"]').attr('disabled', 'disabled');
			// remove any previous error classes
			form.find('.error').removeClass('error');
			$('.red').remove();

			// loop through required elements and check validation
			form.find('[irl-required]:visible').not('[disabled]').each(function() {
				if($(this).val() === '') {
					$(this).addClass('error');
				}
				else
				{
						if($(this).attr("id")=="move_date")
						{
							var selectedDate = $(this).val();
							if(selectedDate.indexOf('/') != -1)
							{
								var tmp=selectedDate.split("/");
								if(tmp.length==3)
								{
									var day = selectedDate.split("/")[1];
									var month = selectedDate.split("/")[0];
									var year = selectedDate.split("/")[2];
									if(year.length==2)
									{
										year="20"+year;
									}
									selectedDate = month+"/"+day+"/"+year;
								}
							}
							selectedDate = new Date(Date.parse(selectedDate))
							today = new Date();
							
							var now = new Date();
							now.setHours(0,0,0,0)
						//	alert(selectedDate+"----" + now);
							
							if (selectedDate < now) {
							  $(this).addClass('error');
							  e.preventDefault();
							  alert("Move date must be a future date");
							
							}
						}else if($(this).attr("id")=="destination_country"){
							if($(this).val()=='0'){
								$(this).addClass('error');
								e.preventDefault();
							}
						}
				}
			});
	
			// loop through pattern elements and check validation
			form.find('[irl-pattern]').not('[disabled]').each(function() {
				
				// don't validate pattern for empty field (irl-required will take care of that)
				if($(this).val() !== '' ) {
					var pattern = new RegExp($(this).attr('irl-pattern'), "g");
					var match = pattern.test($(this).val());
					if(! match) {
						$(this).addClass('error');
					}
				}
			});
			
			if($('input[name="destination_zip"]').hasClass("invalid-zip")){
				$('input[name="destination_zip"]').addClass('error');
			}
			if($('input[name="from_zip"]').hasClass("invalid-zip")){
				$('input[name="from_zip"]').addClass('error');
			}	
			// don't submit form if there are errors
			if(form.find('.error').length > 0) {
				$('button[name="submit"]').removeAttr('disabled');
				e.preventDefault();
				$('input').each(function(){
					if($(this).hasClass('error')){
						$(this).stop().css("background-color", "#fff").animate({ backgroundColor: "#ff0000"}, 500).animate({ backgroundColor: "#fff"}, 1000);
						if($(this).parent('div').siblings('.info_input').length == 0 && $('#move_type_form').length == 0){
							$(this).parent('div').after('<div class="info_input red">Required</div>');
						}
						//var place = $(this).attr('placeholder');
						//if(place!=''){
							//$(this).attr('placeholder','Required');
						
						//}else{
						//	$(this).attr('placeholder','Required');
						//}
					}
				})
				$('select').each(function(){
					if($(this).hasClass('error')){
						if($(this).parent('div').siblings('.info_input').length == 0 && $('#move_type_form').length == 0){
							$(this).parent('div').after('<div class="info_input red">Required</div>');
						}
						//var place = $(this).attr('placeholder');
						//if(place!=''){
							//$(this).attr('placeholder','Required');
						
						//}else{
						//	$(this).attr('placeholder','Required');
						//}
					}
				})
			}
		}
	};
}(jQuery));

JQuery('document').ready(function() {

	irl.init();

	if(JQuery('#home, #local').length > 0) {

		irl.canada_1.setup();

	} else if (JQuery('.bc_canada_2').length > 0 || JQuery('.local_movers_part2').length > 0) {

		irl.canada_2.setup();

	} else if (JQuery('.international-movers').length > 0) {

        irl.international.setup();
    } else if (JQuery('.international_movers_2').length > 0) {

        irl.international_2.setup();
    } else if(jQuery('.bc_office').length > 0){

     	irl.office_1.setup();
    } else if(jQuery('.bc_office_2').length > 0){

     	irl.office_2.setup();
    } else if (JQuery('.canada_auto').length > 0) {

		irl.canada_auto.setup();
	} else if (JQuery('.canada_auto_2').length > 0) {

		irl.canada_auto_2.setup();
	} 

	if (JQuery('#move_type_form').length > 0) {
		irl.from_zip.setup();
	}
	
	if($('input[name="phone_field"]').length > 0 && usa_to_usa == 1){
	//	irl.phone_validation.setup();
	}


});

/*
 Hide the moving from and to blocks initially.
 */
$(document).ready(function () {
	$('input[name="drop_off_country"]').change(function(){
		var val = $(this).val();
		if(val == 'US'){
			if($('input.from_zip').hasClass('canada_zip')){
				$('input[name="move_type"]').val('CanadaToUSALeads');
			}else{
				$('input[name="move_type"]').val('USAToUSALeads');
			}
		}else if(val == 'CANADA'){
			if($('input.from_zip').hasClass('canada_zip')){
				$('input[name="move_type"]').val('CanadaToCanadaLeads');
			}else{
				$('input[name="move_type"]').val('USAToCanadaLeads');
			}
		}else if(val == 'inter'){
			if($('input.from_zip').hasClass('canada_zip')){
				$('input[name="move_type"]').val('CanadaToInternationalLeads');
			}else{
				$('input[name="move_type"]').val('USAToInternationalLeads');
			}
		}
	})

   "use strict";
   var movingFromBlock = $('#bfElemWrap2609'),
       movingToBlock = $('#bfElemWrap2614');

    movingFromBlock.hide();
    movingToBlock.hide();

   	checkph(is_canada);
    $(window).resize(function() {
    	checkph(is_canada);
	});
});
function checkph(is_canada){
	var w = $(window).width();
	if(w <= 481){
		if(is_canada == 1){
			$('input[name="from_zip"]').attr('placeholder','Enter Postal Code');
		}else{
			$('input[name="from_zip"]').attr('placeholder','Enter Zip Code');
		}
		$('input#FPnearestTownInput').attr('placeholder','Enter Nearest City');
		$('div.tranpsort_vehicle').html('Transport My Car');
	}else{
		if(is_canada == 1){
			$('input[name="from_zip"]').attr('placeholder','Enter Your Postal Code');
		}else{
			$('input[name="from_zip"]').attr('placeholder','Enter Your Zip Code');
		}
		$('input#FPnearestTownInput').attr('placeholder','Type and Select Nearest City');
		$('div.tranpsort_vehicle').html('Transport My Vehicle');
	}
}
