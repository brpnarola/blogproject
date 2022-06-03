$(document).ready(function()
{
  $(".approve").click(function()
  {
    if ($(this).prop("checked") == true)
    {
      var t = this.value;
      var post_id = $('#post_ids').val();
      if (post_id == "")
      {
        $('#post_ids').val(t);
      }
      else
      {
        $('#post_ids').val(post_id + "," + t);
      }
    }
    else
    {
      var checkbox_value = ""
      $('.approve').each(function ()
      {
        if (this.checked)
        {
          var current_value = this.value;
          checkbox_value += (checkbox_value=="" ? current_value : "," + current_value)
        }
      });
    $('#post_ids').val(checkbox_value);
    }
  });

  
  $(".approve_admin").click(function()
  {
    if ($(this).prop("checked") == true)
    {
      var t = this.value;
      var user_id = $('#user_ids').val();
      if (user_id == "")
      {
        $('#user_ids').val(t);
      }
      else
      {
        $('#user_ids').val(user_id + "," + t);
      }
    }
    else
    {
      var checkbox_value = ""
      $('.approve_admin').each(function ()
      {
        if (this.checked)
        {
          var current_value = this.value;
          checkbox_value += (checkbox_value=="" ? current_value : "," + current_value)
        }
      });
    $('#user_ids').val(checkbox_value);
    }
  });




});
