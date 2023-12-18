[#include "/smrt/includes/ftls/settings.ftl"/]
<!DOCTYPE html>
<html data-ctzscriptallow="true" lang="en-US">
<head id="Head">
    [@cms.page /]
    [@cms.area name="htmlHeader" /]
</head>

<body id="Body">
<form method="post" action="/" id="Form" enctype="multipart/form-data">
    <div class="aspNetHidden">
        <input type="hidden" name="StylesheetManager_TSSM" id="StylesheetManager_TSSM" value="">
        <input type="hidden" name="ScriptManager_TSM" id="ScriptManager_TSM" value=";;System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35:en:1453655a-6b8d-49b1-94c2-f77a352f5241:ea597d4b:b25378d2">
        <input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="">
        <input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="">
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="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">
    </div>
    <script src="${htmlInResources}/WebResource.js" type="text/javascript"></script>
    <script src="${htmlInResources}/Telerik.js" type="text/javascript"></script>
    <div class="aspNetHidden">
        <input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334">
        <input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="">
        <input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="gZjOEXF3WvKaVzr5sSlkZq4S+WWpTTsGqnyeKlTL2kWpRDEUBjUkIUJFh4Bq8PCBVqxM9/8L0ZLNrMkQAovYZ36v9D6RqX7fASvvl35p3qrgKE0S">
    </div>
    <script src="${htmlInResources}/dnn.js" type="text/javascript"></script><script src="${htmlInResources}/dnn_002.js" type="text/javascript"></script><script src="${htmlInResources}/bootstrap-hover-dropdown.js" type="text/javascript"></script><script src="${htmlInResources}/dnncore.js" type="text/javascript"></script><script src="${htmlInResources}/dnn_003.js" type="text/javascript"></script>
    <script type="text/javascript">
        //<![CDATA[
        Sys.WebForms.PageRequestManager._initialize('ScriptManager', 'Form', [], [], [], 90, '');
        //]]>
    </script>
    <!--CDF(Css|https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700&cdv=218)-->
    <!--CDF(Css|/Portals/0/skins/smrtnew/css/font-awesome.min.css?cdv=218)-->
    <!--CDF(Css|/Portals/0/skins/smrtnew/css/jquery.bxslider.css?cdv=218)-->
    <!--CDF(Javascript|/Portals/0/skins/smrtnew/js/bootstrap.min.js?cdv=218)-->
    <!--CDF(Javascript|/Portals/0/skins/smrtnew/js/bootstrap-hover-dropdown.min.js?cdv=218)-->
    <div id="wrapper">
        <!--__HEADER AND NAVIGATION__-->
        <header>
            <section id="top">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 pull-right text-right">
                            <a id="dnn_Header_dnnLOGIN2_loginLink" class="loginLink" rel="nofollow" onclick="this.disabled=true;" href="https://www.smrt.com.sg/GoCorp?returnurl=%2f"> </a>
                        </div>
                        <div class="col-md-3">
                            <a id="dnn_Header_LOGO1_hypLogo" title="SMRT" href="https://www.smrt.com.sg/"><img id="dnn_Header_LOGO1_imgLogo" src="${htmlInResources}/SMRT_Corp_Logo.png" alt="SMRT"></a>
                        </div>
                        <div class="col-md-3 col-md-offset-6">
                            <div id="search-gap"> </div>
                            <div id="header-search">
                              <span class="searchInputContainer">
                              <input name="googleSearch" type="text" maxlength="255" size="20" id="googleSearch" class="NormalTextBox" autocomplete="off" placeholder="Search...">
                              <a class="dnnSearchBoxClearText" title="Clear search text"></a>
                              </span>
                                <a id="googleSearchBtn" class="SearchButton glyphicon glyphicon-search" title="Click to view search results"></a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            [@cms.area name="navigation" /]
            <section id="search-mobile">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                        </div>
                    </div>
                </div>
            </section>
        </header>
[#--        <script>--]
[#--            //press enter to search--]
[#--            $("input#googleSearch").keypress(function(event) {--]
[#--                if (event.which == 13) {--]
[#--                    event.preventDefault();--]
[#--                    $( "#googleSearchBtn" ).trigger( "click" );--]
[#--                }--]
[#--            });--]
[#--        </script>--]

        <!--__MAIN CONTENT__-->
        <main>
            [@cms.area name="main" /]
        </main>


        <!--__FOOTER__-->

        [@cms.area name="footer" /]
    </div>
    <!--wrapper end-->
[#--    <script>--]
[#--        $(document).ready(function() {--]
[#--            $('.bxslider-business').bxSlider({--]
[#--                auto: true,--]
[#--                speed: 2000,--]
[#--                pause: 4000,--]
[#--                pager: false,--]
[#--                controls: true,--]
[#--                maxSlides: 3--]
[#--            });--]
[#--        });--]
[#--    </script>--]
    <script type="text/javascript" src="${htmlInResources}/common.js"></script>
    <input name="ScrollTop" type="hidden" id="ScrollTop" value="0">
    <input name="__dnnVariable" type="hidden" id="__dnnVariable" autocomplete="off" value="`{`trackLinks`:`false`,`__scdoff`:`1`,`sf_siteRoot`:`/`,`sf_tabId`:`129`,`evoq_TabId`:`129`,`evoq_PageLanguage`:`en-US`,`evoq_ContentItemId`:`-1`,`evoq_UrlReferrer`:``,`evoq_UrlPath`:`https%3a%2f%2fwww.smrt.com.sg%2f`,`evoq_UrlQuery`:`%3fTabId%3d129%26language%3den-US`,`evoq_ContentItemReferrer`:`-1`,`evoq_PersonalizedUrlReferrer`:`-1`,`evoq_DisableAnalytics`:`False`}">
    <input name="__RequestVerificationToken" type="hidden" value="foCwGhdNswMmuy0vo9H_qLADjTwzRMD3u--3WVt9UCq-7rFM9IdvVF98QYjTJIgBK7aiZg2"><script src="${htmlInResources}/bootstrap.js" type="text/javascript"></script><script src="${htmlInResources}/jquery.js" type="text/javascript"></script><script src="${htmlInResources}/scripts.js" type="text/javascript"></script>
</form>
<!--CDF(Javascript|/js/dnncore.js?cdv=218)--><!--CDF(Javascript|/js/dnn.modalpopup.js?cdv=218)--><!--CDF(Css|/Resources/Shared/stylesheets/dnndefault/7.0.0/default.css?cdv=218)--><!--CDF(Css|/Portals/0/skins/smrtnew/skin.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/DarkKnightMobile/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/Gravity/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/Gravity/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/Cavalier/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/Websparks.Modules.InteractiveBanner.V3/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/Websparks.Modules.InteractiveBanner.V3/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/DarkKnightMobile/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/Containers/DarkKnightMobile/container.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/DesktopModules/HTML/module.css?cdv=218)--><!--CDF(Css|/Portals/_default/admin.css?cdv=218)--><!--CDF(Css|/Portals/0/portal.css?cdv=218)--><!--CDF(Javascript|/js/dnn.js?cdv=218)--><!--CDF(Javascript|/js/dnn.servicesframework.js?cdv=218)--><!--CDF(Javascript|/Resources/libraries/jQuery/01_09_01/jquery.js?cdv=218)--><!--CDF(Javascript|/Resources/libraries/jQuery-UI/01_11_03/jquery-ui.js?cdv=218)-->
<iframe scrolling="no" allowtransparency="true" src="${htmlInResources}/widget_iframe.html" title="Twitter settings iframe" style="display: none;" frameborder="0"></iframe><iframe id="rufous-sandbox" scrolling="no" allowtransparency="true" allowfullscreen="true" style="position: absolute; visibility: hidden; display: none; width: 0px; height: 0px; padding: 0px; border: medium none;" title="Twitter analytics iframe" frameborder="0"></iframe>
</body>
</html>