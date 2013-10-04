
###
Module dependencies.
###
express = require 'express'
routes = require './routes'
user = require './routes/user'
http = require 'http'
path = require 'path'
app = express()
#underscore
_ = require 'underscore'
#fs
fs = require 'fs'
#exec
exec = require 'child_process'

app.configure ->
  app.set "port", process.env.PORT or 3000
  app.set "views", __dirname + "/views"
  app.set "view engine", "jade"
  app.use express.favicon()
  app.use express.logger("dev")
  app.use express.bodyParser()
  app.use express.methodOverride()
  app.use app.router
  app.use express.static(path.join(__dirname, "public"))

app.configure "development", ->
  app.use express.errorHandler()

alljsonarr = new Array()

json = (content,position_x,position_y,url) ->
  content: content
  position:
    x: position_x
    y: position_y
  url: url
alljsonarr.push json("testjson",45,56,"all")

app.get "/getdata.json", (req,res) ->
  res.header "Access-Control-Allow-Origin","*"
  sendjsonarr = new Array()
  res.contentType('application/json;charset=UTF-8')
  for data in alljsonarr
    if req.headers.referer is data.url
      sendjsonarr.push data
  res.send sendjsonarr

app.get "/getall.json",(req,res) ->
  res.header "Access-Control-Allow-Origin","*"
  res.contentType('application/json;charser=UTF-8')
  res.send alljsonarr

app.post "/postdata.json", (req,res) ->
  console.log req.body
  alljsonarr.push json(req.body.content,req.body.positionx,req.body.positiony,req.headers.referer)
  res.redirect req.headers.referer

app.post "/deletedata.json",(req,res) ->
  console.log req.body
  res.redirect req.headers.referer

server = http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
#io = require("socket.io").listen(server)

#io.sockets.on "connection", (socket) ->
#  console.log "connected"
#  socket.on "disconnect", ->
#    console.log "disconnected"
