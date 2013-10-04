$ ->
  console.log "read web-it.js"
#  socket = io.connect "http://marutaru.com:3000"
#  socket.on("connect", ->

  $("body").dblclick( (e) ->
    $("body").append "<div class='popup'><form action='http://marutaru.com:3000/postdata.json' method='POST' accept-charset='UTF-8'><input type='text' name='content'/><input type='hidden' name='positionx' value=#{e.pageX} /><input type='hidden' name='positiony' value=#{e.pageY} /></form></div>"
    $(".popup").css "position", "absolute"
    $(".popup").css "left", "#{e.pageX}px"
    $(".popup").css "top", "#{e.pageY}px"
    $(".popup").css "background-color", "forestgreen"
    $(".popup").css "opacity", "0.8"
    $(".popup").css "border-radius", "10px"
    $(".popup").css "padding", "2px"
  )
  $.getJSON("http://marutaru.com:3000/getdata.json", (jsonarr) ->
    $(".sealed").empty()
    for json in jsonarr
      $("body").append "<div class='sealed' style='position:absolute;left:#{json.position.x}px;top:#{json.position.y}px;background-color:forestgreen;opacity:0.8;border-radius:1em;padding:2px'><form action='http://marutaru.com:3000/deletedata.json' method='POST'>#{json.content}<input type='submit' value='×'/></form></div>"
  )
#  )
