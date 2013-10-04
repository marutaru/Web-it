exports.index = (req, res) ->
#  res.render "index", 
#    title: "web-it"
  res.contentType('application/json')
  testjson =
    name: "aaa"
    content: "asdas"
    position:
      x: 123
      y: 234
  res.send testjson

