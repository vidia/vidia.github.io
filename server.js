require("newrelic");
var express = require("express");
var harp = require("harp");
var ua = require('universal-analytics');
var main = express();

var tracker = ua("UA-50369942-1", "server");

main.use(express.static(__dirname + "/public"));
main.use(harp.mount(__dirname + "/public"));

var app = express();
app.use(function(req, res, next) {
    tracker.event("pagerequest", req.path, "server").send();
    next();
});

app.use(main);
app.listen(process.env.PORT || 5000);
