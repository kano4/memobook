$ ->
  $('#memos')
    .on 'click', '.edit, .cancel', (event) ->
      # 表示を切り替え
      toggleEditor $(this).closest('.memo')

    .on 'ajax:complete', '.edit_memo', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      body = response.data.body
      $container = $(this).closest('.memo')

      # 表示されている値を更新
      $container.find('.viewer .body').text body

      # 表示を戻す
      toggleEditor $container

    .on 'ajax:complete', '.delete_memo', (event, ajax, status) ->
      # 項目を削除
      $(this).closest('.memo').remove()

  $('#new_memo')
    .on 'ajax:complete', (event, ajax, status) ->
      response = $.parseJSON(ajax.responseText)
      html = response.html

      # 画面に追加
      $('#memos').append html

      # フォームを初期化
      $(this)[0].reset()

# 表示モードと編集モードを切り替える。
toggleEditor = ($container) ->
  # 表示、非表示を切り替え
  $container.find('.viewer, .editor').toggle()

  # 編集モードなら、値を戻す
  $bodyField = $container.find('.editor .body')
  if $bodyField.is(':visible')
    $bodyField
      .val($container.find('.viewer .body').text())
      .select()
