$(function(){
  $(".get_fav").on("click", function(e){
    e.preventDefault();
    $(this).addClass("active");
    postId = $(this).data(`post_id`)
    $.ajax({
      url: $(this).attr("action"),
      type: "post",
      data: {post_id: postId},
      datatype: `json`
    })
    .done(function(json){
      $(`#post_${json.post}`).text(`いいね　${json.favorite}`);
    })
    .fail(function(){
      alert(`error`);
    })
  })
})
