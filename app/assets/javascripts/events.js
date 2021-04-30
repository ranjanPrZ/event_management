$(document).ready(function(){
  setTimeout(function() {
    $("#flash_message").fadeOut(200);
  }, 2000);

  $("#attend_btn").on("click",function(){
    return
  	$.ajax({
  		url: "/gender_discount",
  		success:function(response){
  			$("#discount_id").text("$"+response) 
  			$("#subtotal").text("$"+(10-response))
  		}
  	})
  })

  $(".attend_button").on("click",function(){
    localStorage.setItem("sel_event_id",$(this).children().text());
  })

  $("#subscribe").on("click",function(){
  	var random_num = Math.floor(1000+Math.random()*9999);
  	$.ajax({
  		url: "/token_generator",
      data: {tok_num: random_num},
  		success:function(response){
        if( response["status"] == 200 ){
          $("#myModal").modal("hide")
          $("#tokenModal").modal("show")
          $("notify_msg").text("Token has been sent to your email address.")
          $("#submit_otp").on("click",function(){
            var token = $("#otp_field").val()
            var sel_event_id = localStorage.getItem("sel_event_id")
            if (random_num == token){
              localStorage.removeItem("sel_event_id")
              $.ajax({
                url: '/attend',
                beforeSend(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
                data: {event_id: sel_event_id},
                method: 'post',
                success:function(){

                }
              })
            }

          })
        }
  		}
  	})
  })

});