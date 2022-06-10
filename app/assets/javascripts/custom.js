$(document).ready(function()
{
    //Approve Post In Post Table Using ajax
 $("#approve_post").on("click",function(){
  var post_ids = []
  $(".approve").each(function()
  {
   if (this.checked){
     post_ids.push($(this).val())
    }
  });
  $.ajax({
   url: "posts/approve_all",
   method: "patch",
   data: {post_ids: post_ids},
   success: function(){
    console.log("success");
    location.reload();
    }
  });
 });

    // Multiple User Delete And Change User role
 $(".approve_checkbox").click(function() {
  if ($(this).prop("checked") == true){
   var t = this.value;
   var post_id = $('#user_ids').val();
   if (post_id == ""){
    $('#user_ids').val(t);
    $('#user_ids1').val(t);
    }
    else{
     $('#user_ids').val(post_id + "," + t);
     $('#user_ids1').val(post_id + "," + t);
     }
    }
  else{
   var checkbox_value = ""
   $('.approve_checkbox').each(function (){
   if (this.checked){
    var current_value = this.value;
    checkbox_value += (checkbox_value=="" ? current_value : "," + current_value)
       }
      });
    $('#user_ids').val(checkbox_value);
    $('#user_ids1').val(checkbox_value);
      }
    });

 }); //main end
