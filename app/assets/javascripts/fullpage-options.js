$(document).ready(function() {
    $('#fullpage').fullpage({
        anchors: ["page1", "page2", "page3", "page4", "page5"],
    });
});

new fullpage('#fullpage', {
    licenseKey: "OPEN-SOURCE-GPLV3-LICENSE",
    anchors: ["page1", "page2", "page3", "page4", "page5"],
});
