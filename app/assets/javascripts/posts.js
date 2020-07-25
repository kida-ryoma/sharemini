document.addEventListener("turbolinks:load", function(){
  $(function(){
    $(".title").on("click", function(){
      $(this).css("font-weight", "bold");
      console.log("クリックはされてる")
    })
  })
}