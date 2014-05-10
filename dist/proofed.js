(function() {
  var app, express;

  express = require("express");

  app = express();

  app.set("port", process.env.PORT || 5000);

  app.use(express["static"](__dirname + "/public"));

  app.get("/", function(request, response) {
    return response.send("<h1>Proofed</h1>");
  });

  app.listen(app.get("port"), function() {
    return console.log("Node app is running at localhost:" + app.get("port"));
  });

}).call(this);
