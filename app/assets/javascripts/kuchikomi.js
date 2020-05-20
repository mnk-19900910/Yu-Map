$(function(){
  function buildHTML(kuchikomi){
    var html = `<p>
                  <strong>
                    <a href=/users/${kuchikomi.user_id}>${kuchikomi.user_name}</a>
                    ：
                  </strong>
                  ${kuchikomi.text}
                </p>`
    return html;
  }
  $('#new_kuchikomi').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.kuchikomis').append(html);
      $('.textbox').val('');
      $('.form__submit').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})