var Student = {
  observeChange: function(){
    $("#klass").change(function(){
      Student.typeChange($(this).data("url"), $(this).val());
    });
  },

  typeChange: function(url, val){
    $.get( url, {id: val}, function(){
    });
    return false;
  }
}