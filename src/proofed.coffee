express = require "express"

app = express()

app.set "port", (process.env.PORT or 5000)
app.use express.static(__dirname + "/public")
app.get "/", (request, response) ->
  response.send "<h1>Proofed</h1>"

app.listen app.get("port"), ->
  console.log "Node app is running at localhost:" + app.get("port")