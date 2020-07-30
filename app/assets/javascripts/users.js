$(document).on('turbolinks:load', function() { 
  $(function(){
  
    let tabs = $(".tab")
    function tabSwitch(){
      console.log(this)
      $(".is-active").removeClass("is-active");
      $(this).addClass("is-active");
      const index = tabs.index(this);
      $(".panel").removeClass("is-show").eq(index).addClass("is-show");
    }
    tabs.click(tabSwitch);
  });
});

