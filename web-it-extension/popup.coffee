$ ->
  $.getJSON("http://marutaru.com:3000/getall.json", (jsonarr) ->
    for json in jsonarr
      $("body").append "<div><a href='#{json.url}'>#{json.url}</a>:#{json.content}</div>"
    $("a").click( (e) ->
      console.log e.target
      chrome.tabs.create({"url":"#{e.target.href}","selected":true})
    )
  )
