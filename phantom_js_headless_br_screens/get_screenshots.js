var page = require('webpage').create();
page.viewportSize = {
    width: 1920,
    height: 1080
};
page.open('http://new.loc/', function() {

    setTimeout(function() {
        page.render('screen1.png');
        phantom.exit();
    }, 200);
});