$(document).ready(function(){
  setTimeout(function() {
    $("#flash_message").fadeOut(200);
  }, 2000);

  $("#attend_btn").on("click",function(){
  	$.ajax({
  		url: "/gender_discount",
  		success:function(response){
  			$("#discount_id").text("$"+response) 
  			$("#subtotal").text("$"+(10-response))
  		}
  	})
  })

  $("#subscribe").on("click",function(){
  	var random_num = Math.floor(1000+Math.random()*9999);
  	$.ajax({
  		url: "/token_generator",
      data: {tok_num: random_num},
  		success:function(response){
        console.log(response)
        if( response["status"] == 200 ){
          $("#myModal").modal("hide")
          $("#tokenModal").modal("show")
          $("notify_msg").text("Token has been sent to your email address.")
          console.log(random_num)
          console.log("---------------------------")
          $("#submit_otp").on("click",function(){
            var token = $("#otp_field").val()
            console.log(token)
            if (random_num == token){
              $.ajax({
                url: ""
              })
            }
          })
        }
  		}
  	})
  })

});