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

        //binding.pry
        var val = $('#post_ids').val();
        var post_ids = val.split(",");
        var x = post_ids.indexOf($(this).val());
        //alert('unchecked')
        post_ids.splice(x,1);
        //console.log(post_ids.value)
        //$('#post_ids').val("")
        // add checked values
        //$('#post_ids').val("232")
     }
console.log(post_ids);

  });

});
