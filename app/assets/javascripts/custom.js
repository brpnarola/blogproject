$(document).ready(function()
{
  // Approve Post In Post Table Using Fom_Tag hidden_field_tag
  // $(".approve").click(function()
  // {
  //   if ($(this).prop("checked") == true)
  //   {
  //     var t = this.value;
  //     var post_id = $('#post_ids').val();
  //     if (post_id == "")
  //     {
  //       $('#post_ids').val(t);
  //     }
  //     else
  //     {
  //       $('#post_ids').val(post_id + "," + t);
  //     }
  //   }
  //   else
  //   {
  //     var checkbox_value = ""
  //     $('.approve').each(function ()
  //     {
  //       if (this.checked)
  //       {
  //         var current_value = this.value;
  //         checkbox_value += (checkbox_value=="" ? current_value : "," + current_value)
  //       }
  //     });
  //   $('#post_ids').val(checkbox_value);
  //   }
  // });

  // Change User Role as Admin And Multiple delete using Form Tag & Hidden Field Tag
  // $(".approve_checkbox").click(function()
  // {
  //   if ($(this).prop("checked") == true)
  //   {
  //     var t = this.value;
  //     var user_id = $('#user_ids').val();
  //     var user_id = $('#user_ids1').val();
  //     if (user_id == "")
  //     {
  //       $('#user_ids').val(t);
  //       $('#user_ids1').val(t);
  //     }
  //     else
  //     {
  //       $('#user_ids').val(user_id + "," + t);
  //       $('#user_ids1').val(user_id + "," + t);
  //     }
  //   }
  //   else
  //   {
  //     var checkbox_value = ""
  //     $('.approve_admin').each(function ()
  //     {
  //       if (this.checked)
  //       {
  //         var current_value = this.value;
  //         checkbox_value += (checkbox_value=="" ? current_value : "," + current_value)
  //       }
  //     });
  //   $('#user_ids').val(checkbox_value);
  //   $('#user_ids1').val(checkbox_value);
  //
  //   }
  // });

    // ajax for approve post in Post table
  $("#approve_post").on("click", function()
  {
    var post_ids = []
    $('.approve').each(function ()
    {
      if (this.checked)
      {
        post_ids.push($(this).val())
      }
    });
    $.ajax (
    {
      url: "posts/approve_all",
      method: "put",
      data: { post_ids: post_ids },
      success: function()
      {
        console.log("success");
        location.reload();
      }
    });
  });

  // ajax code for Change User Role as Admin In User Table
  $("#admin_role").on("click", function()
  {
    var user_roles = []
    $(".approve_checkbox").each(function()
    {
      if (this.checked)
      {
        user_roles.push($(this).val())
      }
    });

    $.ajax(
    {
      url: "users/set_role_admin",
      method: "put",
      data: {user_roles: user_roles},
      success: function()
      {
        console.log("Success");
        location.reload();
      }
    });
  });

  // ajax for multiple user delete
  $("#multiple_user_delete").on("click", function()
  {
    var user_data = []
    $(".approve_checkbox").each(function()
    {
      if (this.checked)
      {
        user_data.push($(this).val())
      }
    });

    $.ajax(
    {
      url: "users/destroy_multiple",
      method: "put",
      data: {user_data: user_data},
      success: function()
      {
        console.log("success")
        location.reload();
      }
    });
  });
});
