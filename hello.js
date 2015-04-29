'use strict';

module.exports = function(param) {
  var execFile = require('child_process').execFile;
  var args = param == undefined ? [] : [param];
  execFile('./hello.o', args, {cwd: __dirname}, function(err, stdout) {
    if(err) console.log(err);
    console.log(stdout.trim());
  });  
}
