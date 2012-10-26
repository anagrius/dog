var path = require('path')
var Parser = require(path.join(__dirname, '..', 'lib', 'dog', 'parser'))

global.assert = require("chai").assert
global.expect = require("chai").expect
global.parse = Parser.parse
