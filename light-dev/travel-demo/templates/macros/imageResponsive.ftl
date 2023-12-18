[#-- Renders an image (asset) rendition --]
[#macro imageResponsive image content imageClass="content-image" useOriginal=false definitionParameters={}]
    [#if image?has_content]
        [#-- Fallback text for alt text --]
        [#assign assetTitle = i18n['image.no.alt']]
        [#if image.asset?? && image.asset.title?has_content]
            [#assign assetTitle = image.asset.title]
        [/#if]

        [#-- Alt text and title --]
        [#assign imageAlt = content.imageAltText!content.imageTitle!assetTitle!]
        [#assign imageTitle = content.imageTitle!content.imageAltText!assetTitle!]

        [#assign imageLink = image.link]
        [#-- For PNGs/GIFs it might be useful to use render the original asset and therefore bypassing imaging --]
        [#if useOriginal]
            [#assign imageLink = image.asset.link]
        [/#if]

        [#-- Image caption / credit; Falls back to asset's properties --]
        [#assign imageCaption = content.imageCaption!image.asset.caption!""]
        [#assign dc = damfn.getAssetMap(image.asset).metadata.dc!]
        [#assign imageCredit = content.imageCredit!dc.contributor?first!""]

        [#-- CSS --]
        [#-- Image class is used from def.parameters, otherwise falls back to given parameter --]
        [#assign divWrapperClass = definitionParameters.imageWrapperClass!"content-image-wrapper"]
        [#assign imgClass = imageClass][#-- Using another variable here as the macro parameter cannot be re-assinged --]
        [#if definitionParameters.imageClass?has_content]
        [#-- Adding custom parameters as img class when specified --]
            [#assign imgClass = "${imgClass} ${definitionParameters.imageClass}"]
        [/#if]

        [#-------------- RENDERING  --------------]
        [#-- Using a wrapper to be able to position caption+credit nicely --]
        [#if imageCaption?has_content || imageCredit?has_content]
        <!-- image with caption/credit -->
        <div class="${divWrapperClass}">
        [/#if]

        [#assign constrainAspectRatio = (content.constrainAspectRatio!false)]
        
        [@responsiveImageTravel image.asset imageAlt imageTitle imgClass "" constrainAspectRatio /]
        
        [#if imageCaption?has_content || imageCredit?has_content]
            [#if imageCaption?has_content]
                <span class="image-caption">${imageCaption}</span>
            [/#if]
            [#if imageCredit?has_content]
                <span class="image-credit">${imageCredit}</span>
            [/#if]
        </div><!-- end image with caption/credit -->
        [/#if]
    [/#if]
[/#macro]


[#-- Macro to render a responsive image with the variations configured in the theme. --]
[#macro responsiveImageTravel asset  alt="" title="" cssClass="" additional="" constrainAspectRatio=false]
    [#if constrainAspectRatio ]
        [#assign srcs = [
            {"name":"480x360", "width":"480"},
            {"name":"960x720", "width":"960"},
            {"name":"1366x1024","width":"1366"},
            {"name":"1600x1200", "width":"1600"}]]

        [#assign fallback="960x720"]

        [@responsiveImageLazySizes asset alt title cssClass srcs fallback additional /]
    [#else]
        [#assign srcs = [
            {"name":"480", "width":"360"},
            {"name":"960", "width":"768"},
            {"name":"1366","width":"1366"},
            {"name":"1600","width":"1600"}]]

        [#assign fallback="960"]

        [@responsiveImageLazySizes asset alt title cssClass srcs fallback additional /]
    [/#if]
[/#macro]

[#-- Macro to render responsive image using lazysizes javascript library.
        Use data-srcset attribute to only load the size of image that the current image width requires --]
[#macro responsiveImageLazySizes asset  alt="" title="" cssClass="" srcs="" fallbackName="" additional="" ]
    [#if asset?exists]
        [#assign variations = damfpfn.variations!]
        [#assign cssClass = cssClass + " lazyload"]
        [#assign rendition = damfn.getRendition(asset, fallbackName)!]
        <noscript>
            <img class="${cssClass}" src="${rendition.link}" alt="${alt}" title="${title}" ${additional} />
        </noscript>
        [#--  
            <img  srcset="1.jpeg 360w,2.jpeg 375w" sizes="180px"/>  
            正常情况下size应该会落在(0，360],(360，375],(375，∞),但是对于屏幕是2x视网膜屏，sizes需要在原来的基础上除以2，
            也就是说之前sizes<=360px时选择1.jpeg,现在sizes需要<= 360/2px
            千万注意：描述图片的像素宽度是用'w'单位，且一定要是图片的真实像素宽度，如果私自改动，那么会影响浏览器对图片的选择！
            
            在DPR不为1时，要转化一下像素值才能去区间里比较，套用上述规则。
            如在DPR=2时，把114px转化为物理像素，即114px * 2 = 228px，用228px去(0, 229px]、(229px, 618px]、(618px, ∞]里做比较，落在了(0, 229px]中，取229px对应的3.jpg
            
            兼容性问题：
            Firefox可以通过设置像素大小任意切换

        --]

        [#--
        sizes
        iphonex     345px      9/16    360
        iphone6/7/8 384px      3/4     480
        ipad        720px      7/5     770
        ipadPro     940px      16/9    960
        platform    940px              (960,∞)
        --]

        <img data-sizes="auto" class="${cssClass} lazyload" ${additional} src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="${alt}" title="${title}"
             data-srcset="[#compress]
            [#if variations?has_content]
                [#list variations as variation]
                    [#assign width = variation.minWidth]
                    [#assign height = variation.minHeight]
                    [#assign url = damfpfn.getVariationUrl(rendition.asset, width, height)!]
                    [#assign focalPoint = damfpfn.getFocalPoint(rendition.asset)!]
                    [#assign absouluteUrl = ctx.contextPath  + url ]
                    ${absouluteUrl} ${width}w,
                [/#list]
            [/#if]
            [/#compress]" />
    [/#if]
[/#macro]
