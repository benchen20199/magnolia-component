$(document).ready(function () {
    var pr_image = $(".ws_pr_img");
    if (pr_image.height() <= 375) {
        pr_image.css("margin-top", 0);
        pr_image.css("margin-bottom", 0);
    }
});