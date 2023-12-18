[#include "/smrt/includes/ftls/link.ftl"/]
<!-- content -->
<main>
    <div class="container subContainerX">
        <!-- breadcrumbs -->
        <div class="col-md-12">
            <div class="subpage-breadcrumbs">
                <span id="dnn_Breadcrumb_lblBreadCrumb" itemprop="breadcrumb" itemscope=""
                      itemtype="https://schema.org/breadcrumb">
                    <span itemscope="" itemtype="http://schema.org/BreadcrumbList">
                        <span itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                            <a href="https://www.smrt.com.sg/" class="SkinObject" itemprop="item">
                                <span itemprop="name">Home</span>
                            </a>
                            <meta itemprop="position" content="1">
                        </span>&nbsp;›&nbsp;

                        <span itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                            <a href="https://www.smrt.com.sg/News-Room/Announcements-News-Releases" class="SkinObject"
                               itemprop="item">
                                <span itemprop="name">News Room</span>
                            </a>
                            <meta itemprop="position" content="2">
                        </span>&nbsp;›&nbsp;

                        <span itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                            <a href="https://www.smrt.com.sg/News-Room/Announcements-News-Releases" class="SkinObject"
                               itemprop="item">
                                <span itemprop="name">Announcements &amp; News Releases</span>
                            </a>
                            <meta itemprop="position" content="3">
                        </span>&nbsp;›&nbsp;

                        <span itemprop="itemListElement" itemscope="" itemtype="http://schema.org/ListItem">
                            <a href="https://www.smrt.com.sg/Announcements" class="SkinObject" itemprop="item">
                                <span itemprop="name">Announcement</span>
                            </a>
                            <meta itemprop="position" content="4">
                        </span>
                    </span>
                </span>
            </div>
        </div>

        <!-- main  content -->
        [#assign contentJcrNode = cmsfn.asJCRNode(content)]
[#--        [#assign parent = cmsfn.parent(content)]--]
[#--        [#assign parentNode = cmsfn.parent(contentJcrNode)]--]
        [#assign imageUrl = getAssetLink(contentJcrNode, "image")!]

        <div class="col-md-9 col-xs-12 pull-right">
            <h1 class="page-title">Announcement</h1>
            <div id="dnn_contentPane">
                <div class="DnnModule DnnModule-Websparks_Article DnnModule-11089">
                    <a name="11089"></a>
                    <div class="DNNContainer_Title_h2 SpacingBottom">
                        <h2><span id="dnn_ctr11089_dnnTITLE_titleLabel" class="TitleH2"></span></h2>
                        <div id="dnn_ctr11089_ContentPane">
                            <!-- Start_Module_11089 -->
                            <div id="dnn_ctr11089_ModuleContent" class="DNNModuleContent ModWebsparksArticleC">
                                <script language="javascript" type="text/javascript">
                                    function EnterEvent(e) {
                                        if (e.keyCode == 13) {
                                            __doPostBack('dnn$ctr11089$ArticleList$cmdSearch', "");
                                            e.stopPropagation();
                                            e.preventDefault();
                                        }
                                    }
                                </script>

                                <div id="dnn_ctr11089_ArticleList_divReader">
                                    <h3 class="pageTitle" style="line-height: 30px; margin: -20px 0 20px; padding: 0px 0;">
                                        <span id="dnn_ctr11089_ArticleList_lblTitle">${content.title!'default title'}</span>
                                    </h3>
                                    <div class="hdr_space"></div>
                                    <div id="dnn_ctr11089_ArticleList_divContent" class="WebsparksReader">
                                        [#if imageUrl?has_content]
                                        <div id="pr-img-wrap">
                                            <a id="dnn_ctr11089_ArticleList_hlArticleImage" data-title="Image Title" data-toggle="lightbox">
                                                <img id="dnn_ctr11089_ArticleList_imgArticleImage"class="ws_pr_img" style="margin-top: 0px; margin-bottom: 0px;"
                                                     src="${imageUrl!}"></a>
                                        </div>
                                        [/#if]
                                        <div id="dnn_ctr11089_ArticleList_lblContent" class="Normal">
                                            [#if content.publishDate?has_content]
                                                [#assign publishDateTime = content.publishDate!]
                                                [#assign publishDate = publishDateTime?date]
                                                <p>${publishDate?string["dd MMMM yyyy"]}<br></p>
                                            [/#if]

                                            [@cms.area name="main" /]

                                        </div>
                                    </div>
                                </div>

                            </div><!-- End_Module_11089 --></div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="DnnModule DnnModule-DNN_HTML DnnModule-655 DnnVersionableControl"><a name="655"></a>
                    <div class="dnnPEMContNotitle">
                        <div id="dnn_ctr655_ContentPane" class="dnnPEMContNotitleBody"><!-- Start_Module_655 -->
                            <div id="dnn_ctr655_ModuleContent" class="DNNModuleContent ModDNNHTMLC">
                                <div id="dnn_ctr655_HtmlModule_lblContent"></div>


                            </div><!-- End_Module_655 --></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-3 col-xs-12 pull-left leftNav">
            <span id="dnn_MYTREEVIEWMENU1_lblTest"></span>

            <ul id="dnn_MYTREEVIEWMENU1_TreeviewMenu" style="list-style: none;" class="templatemo_menu">
                <li style="list-style: none;">
                    <a id="dnn_MYTREEVIEWMENU1_lblHeader"
                       style="font-weight:bold;color:#222;font-family:Arial;font-size:13px;margin:0px 0px 0px 0px;padding:5px 5px 0px 15px;background-color:#e5fde4;">NEWS
                        ROOM</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_0"
                       href="https://www.smrt.com.sg/News-Room/Announcements-News-Releases"
                       style="padding-left:15px;padding-right:15px;">Announcements &amp; News Releases</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_1"
                       href="https://www.smrt.com.sg/News-Room/Forum-Replies"
                       style="padding-left:15px;padding-right:15px;">Forum Replies</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_2"
                       href="https://www.smrt.com.sg/News-Room/Videos" style="padding-left:15px;padding-right:15px;">Videos</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_3"
                       href="https://www.smrt.com.sg/News-Room/Images" style="padding-left:15px;padding-right:15px;">Images</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_4"
                       href="https://www.smrt.com.sg/News-Room/COVID-19-Efforts"
                       style="padding-left:15px;padding-right:15px;">COVID-19 Efforts</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_5"
                       href="https://www.smrt.com.sg/News-Room/Information-Kit"
                       style="padding-left:15px;padding-right:15px;">Information Kit</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_6"
                       href="https://www.smrt.com.sg/News-Room/Annual-Reports"
                       style="padding-left:15px;padding-right:15px;">Annual Reports</a>
                </li>

                <li id="liRep" class=" " style="padding-right: 0px">
                    <a id="dnn_MYTREEVIEWMENU1_TreeviewRepeater_innerLink_7" href="http://blog.smrt.com.sg/"
                       style="padding-left:15px;padding-right:15px;">SMRT Blog</a>
                </li>

            </ul>

            <script type="text/javascript">
                $(document).ready(function () {
                    $('.templatemo_menu li#liRep a').each(function () {
                        var o = $(this);
                        if (o.attr('style') == 'padding-left:30px;padding-right:15px;')
                            o.attr('class', 'menu-child-node');
                    });

                    $('.templatemo_menu li.NodeActive a').each(function () {
                        var o = $(this);
                        var temp = '<label label-default="" class="tree-toggler nav-header active">' + o.html() + '<span class="caret-down"></span></label>';
                        var liParent = $('.templatemo_menu li.NodeActive');
                        liParent.html(temp);
                    });

                });
            </script>

        </div>


    </div>
</main>