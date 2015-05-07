require("newrelic");
var express = require("express");
var vhost = require('vhost');
var harp = require("harp");

var main = express();
main.use(express.static(__dirname + "/public"));
main.use(harp.mount(__dirname + "/public"));

var lawsoncs = express();
lawsoncs.use(express.static(__dirname + "/public/cameras"));
lawsoncs.use(harp.mount(__dirname + "/public/cameras"));


var app = express();
app.use(vhost('lawsoncs.webcam', lawsoncs)); // Serves all subdomains via Redirect app
app.use(vhost('*.davidtschida.com', main));
app.use(vhost('davidtschida.com', main));

app.listen(process.env.PORT || 5000);
