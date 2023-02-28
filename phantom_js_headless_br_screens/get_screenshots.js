var page = require('webpage').create();
page.viewportSize = {
    width: 1920,
    height: 1080
};
page.open('http://new.loc/', function() {

    setTimeout(function() {
        page.render('screen.png');
        phantom.exit();
    }, 200);
});