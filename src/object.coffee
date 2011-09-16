jsdom = require('jsdom')
document = jsdom.jsdom('<html><head></head><body></body></html>')
window = document.createWindow()

$ = require('jquery').create(window)


class object extends Object

object::extend = $.extend

exports.object = object