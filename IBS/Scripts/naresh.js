$(window).load(function () {
    // Animate loader off screen
    $(".page-loader").fadeOut("slow");
});
function jAlert (message, title, type) {
    try {
              $("BODY").append(
			  '<div id="over_cover"></div><div id="popup_container">' +
			    '<h1 id="popup_title"></h1>' +
			    '<div id="popup_content" class="">' +
			      '<div id="popup_message"></div>' +
				'</div>' +
			  '</div>');
              $("#popup_title").text(title);
              if (type == 'success')
                  $("#popup_content").addClass('success');
              else if (type == 'warning')
                  $("#popup_content").addClass('warning');
              $("#popup_message").text(message);
              $("#popup_message").html($("#popup_message").text().replace(/\n/g, '<br />'));
              var msgbox = document.getElementById("popup_container");
              var left = ($(window).width() / 2) - (msgbox.offsetWidth / 2);
              var top = ($(window).height() / 2) - (msgbox.offsetHeight / 2)-100;
              if (top < 0) top = 0;
              if (left < 0) left = 0;
              $("#popup_container").css({
                  minWidth: $("#popup_container").outerWidth(),
                  maxWidth: $("#popup_container").outerWidth(),
                  left: left, top: top
              });
              $("#popup_message").after('<div id="popup_panel"><input type="button" value="Ok" class="btn btn-primary" onclick="popup_ok_click();" /></div>');
              $("#popup_ok").click(function () {

              });
}
catch (err) {
    alert(err.message);
  }
}
function popup_ok_click() {
    $("#popup_container").remove();
    $("#over_cover").remove();
    //$.alerts._overlay('hide');
    //$.alerts._maintainPosition(false);
}
function ShowLoader(){
    var div = document.createElement('div');
    div.id = "div_load";
    var img = document.createElement('img');
    img.src = '../img/loading.gif';
    div.style.cssText = 'position: fixed; top:0; left:0; z-index: 5000; width:100%;height:100%;text-align: center;opacity: 0.8;padding-top: 10%; background:black;';
    div.appendChild(img);
    document.body.appendChild(div);
}
function HideLoader() {
    $("#div_load").hide();
}