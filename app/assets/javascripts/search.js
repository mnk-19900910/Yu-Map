$(function() {

  var search_list = $(".top-contents__in");

  function appendPost(post) {
    var html = `
    <div class="contents">
    <div class="contents__detail--name">温泉名：${ post.name }</div>
  <div class="contents__location">場所：${ post.location }</div>
  <a class="contents__user" href="/users/${ post.user_id }">
    <div>投稿者：${ post.user_name }</div>
  </a>
</div>
                    `
    search_list.append(html);
  }

  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(posts) {
      search_list.empty();
      if (posts.length !== 0) {
        posts.forEach(function(post){
          appendPost(post);
        });
      }
      else {
        appendErrMsgToHTML("一致する温泉がありません");
      }
    })
    .fail(function(){
      alert('error');
    });
  });
});