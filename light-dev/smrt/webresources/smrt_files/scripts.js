
//Responsive Table
(function() {
    var headertext = [];
    var headers = document.querySelectorAll(".tbl-responsive thead");
    var tablebody = document.querySelectorAll(".tbl-responsive tbody");

    for (var i = 0; i < headers.length; i++) {
        headertext[i] = [];
        for (var j = 0, headrow; headrow = headers[i].rows[0].cells[j]; j++) {
            var current = headrow;
            headertext[i].push(current.textContent.replace(/\r?\n|\r/, ""));
        }
    }
    if (headers.length > 0) {
        for (var h = 0, tbody; tbody = tablebody[h]; h++) {
            for (var i = 0, row; row = tbody.rows[i]; i++) {
                for (var j = 0, col; col = row.cells[j]; j++) {
                    col.setAttribute("data-th", headertext[h][j]);
                }
            }
        }
    }
}());


$(document).ready(function() {

    if ($(window).width() < 1200) {
        $('.dropdown-submenu a').click(function(e) {
            e.preventDefault();
            e.stopPropagation();
            $(this).next('ul').toggle();
        });
    } //end if


     // mobile nav (new)
     $(window).on('load resize', function() {
        if ($(window).width() < 1200) {

            //if first level parent is clickable link
            $('.navbar-nav > li  ').each(function(index) {
                //add plus icon as bg to first level li which are not clickable
                if (($(this).has("ul").length > 0) && ($(this).children('a').attr('href') == '#')) {
                    $(this).addClass("plus2");
                }
                //add plus icon as span item to first level that are clickable
                if (($(this).has("ul").length > 0) && ($(this).children('a').attr('href') !== '#')) {
                    $('span', this).remove();
                    $(this).children('a').after("<span class='plus typeOne'></span>");
                }
            }); //first level end

            $('.navbar-nav > li > ul  > li ').each(function(index) {
                //if 2nd level is parent and clickable link and 1st parent also clickable link
                if (($(this).has("ul").length > 0) && ($(this).children('a').attr('href') !== '#') && ($(this).parents('li').find('a').attr('href') !== '#')) {
                    $(this).children('a').after("<span class='plus typeOne'></span>");
                    $(this).children('a').unbind('click');
                }
                //if 2nd level is parent and clickable link but 1st level parent is NOT clickable link
                else if (($(this).has("ul").length > 0) && ($(this).children('a').attr('href') !== '#') && ($(this).parents('li').find('a').attr('href') == '#')) {
                    $(this).children('a').after("<span class='plus  typeTwo'></span>");
                    $(this).parent().parent().find('> a').after("<span class='plus  typeTwo typeTwoB'></span>");
                    $(this).children('a').unbind('click');
                } //end if

                //if 2nd level is parent and not clickable
                else if (($(this).has("ul").length > 0) && ($(this).children('a').attr('href') == '#')) {
                    $(this).addClass("plus2");
                } //end if

            }); //2nd level end

            //if 3rd level is parent and clickable link
            $('.navbar-nav > li > ul  > li > ul > li ').each(function(index) {
                $(this).children('a').unbind('click');
            }); //sub level end

            //Plus btn
            $('.plus').click(function() {

                if ($('.plus2').hasClass('open')) {
                    $('.plus2').removeClass('open');
                }

                $('.plus').not(this).parent('li').removeClass('open');
                $(this).parent('li').toggleClass('open');
                if ($(this).parents().eq(2)) { //if there 2 levels of parent
                    $(this).parents().eq(2).toggleClass('open');
                }
            }); //click

            $('.plus2').click(function() {
                $('.plus').parent('li').removeClass('open');
            }); //click

            $('.typeTwoB').click(function() {
                $(this).remove();
            }); //click

            $('.typeTwo').click(function(e) {
                e.preventDefault();
                e.stopPropagation();
            }); //click

        } //end if width
        else {
            $('.navbar-nav > li').removeClass('open');
        }



    }); //resize
    //new mobile end




    $("footer").after("<div id='back-to-top'><span><b></b></span></div>");

    $(window).scroll(function() {
        if ($(this).scrollTop() > 50) {
            $('#back-to-top').fadeIn();
        } else {
            $('#back-to-top').fadeOut();
        }
    });
    // scroll body to 0px on click
    $('#back-to-top').click(function() {
        $('body,html').animate({ scrollTop: 0 }, 800);
        return false;
    });


    //move search on mobile
    $(window).on('load resize', function() {
         // If the current active element is a text input, we can assume the soft keyboard is visible.
         if($(document.activeElement).attr('type') !== 'text') {

            if ($(window).width() < 1200) {
                $("#header-search").insertAfter('#main-nav');
                $("#search-mobile .col-xs-12").append($("#header-search"));
        } //end if width
        else {
            $("#header-search").insertAfter('#search-gap');

        }

    }//end if
    }); //resize


    //if login page
    var dnnLogin = $('div').hasClass('dnnLogin');
    var dnnLoginService = $('div').hasClass('dnnLoginService');
    if ((dnnLogin === true) || (dnnLoginService === true)) {
        $('#quicklinks, #social-feeds').hide();
    }

    //fixed 5px extra gap below home banner
    var viewPortHeight = $('#banner-home .bx-viewport').height();
    var newHeight = viewPortHeight - 5;
    $('#banner-home .bx-viewport').height(newHeight);


    //$("#home-business h1:first-child").insertBefore('#home-business .container');



    //Accordion
    $('.accordion-wrapper').accordion({
        header: ".accordionHead",
        collapsible: true,
        active: false,
        icons: { "header": "ui-icon-plus", "activeHeader": "ui-icon-minus" },
        autoHeight: false,
        navigation: true,
        heightStyle: "content"
    });
    //open first accordion
    /* $('.accordion-PROJECT').first().accordion({ active: 0 });
    $('.Page-Class .accordion-PROJECT').first().accordion({ active: false }); */

    //ja9 TABLE CLASSES
    $('table').has('thead').each(function() {
        var tbl = $(this);
        //add ID to all tables with thead
        //add the css class for all tables with thead
        tbl.addClass('table-bordered table-striped table-condensed cf');
    });

    // TABLE DATA-TITLE


    //SET VARIABLES
    var getrowtext;
    var colspanhtml;
    var $temp;
    var $coltemp;
    var $coltemptwo;
    var colindex;
    var totalArr;
    var nextcolspan;
    var colnumber;
    var resultsArrone = [];
    var resultsArrtwo = [];
    var rowtextArr = [];

    $("table#no-more-tables").each(function(index, element) {

        if ($(this).attr("id") == "no-more-tables") {
            $(this).find("tr").first().each(function(ind, v) {
                ind += 1;

                //TABLE HTML
                getrowtext = $(this).html().trim().replace(/\s+/g, " ").replace(/^\s|\s$/g, "");

                // CHECK FOR COLSPAN
                $(this).find("th").each(function(thind, thval) {
                    if ($(this).attr('colspan') > 1) {
                        colindex = $(this).index();
                        colnumber = $(this).attr('colspan');
                        $(this).parent().parent().parent().addClass("gotcolspan");
                    }
                });

                // USE GOTCOLSPAN 
                $(".gotcolspan thead tr").first().each(function(colind, colval) {
                    var count = $(this).find("th").length;
                    //console.log(count);
                    colspanhtml = $(this).html().trim().replace(/\s+/g, " ").replace(/^\s|\s$/g, "");
                    //nextcolspan = $(this).next().html();


                    $coltemp = colspanhtml.replace(/<\/th>/g, " |").replace(/(<([^>]+)>)/ig, "").replace(/&nbsp;/g, ' ').replace(/&amp;/g, "&");
                    //$coltemptwo = nextcolspan.replace(/<\/th>/g," |").replace(/(<([^>]+)>)/ig, "").replace(/&nbsp;/g, ' ').replace(/&amp;/g, "&");

                    // MERGE ARRAY
                    resultsArrone = $coltemp.split("|");
                    //resultsArrtwo = $coltemptwo.split("|");

                    // REMOVE N MOVE ARRAY
                    Array.prototype.combine = function(arr, deleteCount, Insert) {
                        Insert.pop();
                        this.splice.apply(arr, [colindex, deleteCount].concat(Insert));
                        return this;
                    }
                    totalArr = resultsArrone.combine(resultsArrone, 1, resultsArrtwo);
                });

                // REMOVE TH, &NBSP AND &AMP AND SPLIT INTO ARRAY
                $temp = getrowtext.replace(/<\/th>/g, " |").replace(/(<([^>]+)>)/ig, "").replace(/&nbsp;/g, ' ').replace(/&amp;/g, "&");
                rowtextArr = $temp.split("|");
            });

            if ($(this).hasClass("gotcolspan")) {
                // APPEND DATA-TITLE BACK FOR GOTCOLSPAN
                $(this).find("tr").each(function() {
                    $(this).find("td").each(function(ind, v) {
                        $(this).attr("data-title", totalArr[ind]);
                    });
                });
            } else {
                // APPEND DATA-TITLE BACK FOR NORMALZ
                $(this).find("tr").each(function() {
                    $(this).find("td").each(function(ind, v) {
                        $(this).attr("data-title", rowtextArr[ind]);
                    });
                });
            }

        }
    });



    $('.websparks_banner .banner-btn').each(function(index) {
        var bannerURL = $(this).attr('href');
        if (bannerURL == '#') {
            $(this).addClass('banner-no-link');
        } else {
            $(this).before(' <a class="bannerLink" href="' + bannerURL + '" target="_blank"></a> ');
           //$(this).closest('.banner-text').find('.banner-desc').after('<a class="banner-btn">Read more</a>');
        } //end if
    });


//google search
$('#googleSearchBtn').click(function(){
    if ($('#googleSearch').val() === ''){
        $('#googleSearch').attr('placeholder','Enter a search keyword');
        return false;
    }
    else {
        $('#googleSearch').attr('placeholder','Search...');
        var gSearchUrl = 'https://cse.google.com/cse?cx=003430314777171509064:l0asmzzpk3q&q=' + $('#googleSearch').val();
        window.open(gSearchUrl);
    }
});



$("#googleSearch").keypress(function(event) {
    if (event.which == 13) {
      $('#googleSearchBtn').trigger('click');
      return false;
    }
});




}); //end document