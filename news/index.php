<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Новости");
?><!-- Main --><br>
 <!-- Featured Post -->
<div id="main">
 <article class="post featured">
	<div class="major">
		 <?$APPLICATION->IncludeComponent(
	"bitrix:catalog.section.list",
	".default",
	Array(
		"ADD_SECTIONS_CHAIN" => "Y",
		"CACHE_GROUPS" => "Y",
		"CACHE_TIME" => "36000000",
		"CACHE_TYPE" => "A",
		"COMPONENT_TEMPLATE" => ".default",
		"COUNT_ELEMENTS" => "Y",
		"IBLOCK_ID" => "1",
		"IBLOCK_TYPE" => "Information",
		"SECTION_CODE" => "",
		"SECTION_FIELDS" => array(0=>"",1=>"",),
		"SECTION_ID" => $_REQUEST["SECTION_ID"],
		"SECTION_URL" => "/news/#SECTION_CODE_PATH#",
		"SECTION_USER_FIELDS" => array(0=>"",1=>"",),
		"SHOW_PARENT_NAME" => "Y",
		"TOP_DEPTH" => "2",
		"VIEW_MODE" => "LINE"
	)
);?> <?$APPLICATION->IncludeComponent(
	"bitrix:news",
	".default",
	Array(
		"ADD_ELEMENT_CHAIN" => "Y",
		"ADD_SECTIONS_CHAIN" => "Y",
		"AJAX_MODE" => "Y",
		"AJAX_OPTION_ADDITIONAL" => "",
		"AJAX_OPTION_HISTORY" => "N",
		"AJAX_OPTION_JUMP" => "N",
		"AJAX_OPTION_STYLE" => "Y",
		"BROWSER_TITLE" => "-",
		"CACHE_FILTER" => "N",
		"CACHE_GROUPS" => "Y",
		"CACHE_TIME" => "36000000",
		"CACHE_TYPE" => "A",
		"CHECK_DATES" => "Y",
		"COMPONENT_TEMPLATE" => ".default",
		"DETAIL_ACTIVE_DATE_FORMAT" => "d.m.Y",
		"DETAIL_DISPLAY_BOTTOM_PAGER" => "Y",
		"DETAIL_DISPLAY_TOP_PAGER" => "N",
		"DETAIL_FIELD_CODE" => array(0=>"",1=>"",),
		"DETAIL_PAGER_SHOW_ALL" => "Y",
		"DETAIL_PAGER_TEMPLATE" => "",
		"DETAIL_PAGER_TITLE" => "Страница",
		"DETAIL_PROPERTY_CODE" => array(0=>"",1=>"",),
		"DETAIL_SET_CANONICAL_URL" => "N",
		"DISPLAY_BOTTOM_PAGER" => "Y",
		"DISPLAY_DATE" => "Y",
		"DISPLAY_NAME" => "Y",
		"DISPLAY_PICTURE" => "Y",
		"DISPLAY_PREVIEW_TEXT" => "Y",
		"DISPLAY_TOP_PAGER" => "N",
		"HIDE_LINK_WHEN_NO_DETAIL" => "Y",
		"IBLOCK_ID" => "1",
		"IBLOCK_TYPE" => "Information",
		"INCLUDE_IBLOCK_INTO_CHAIN" => "N",
		"LIST_ACTIVE_DATE_FORMAT" => "d.m.Y",
		"LIST_FIELD_CODE" => array(0=>"",1=>"",),
		"LIST_PROPERTY_CODE" => array(0=>"",1=>"",),
		"MESSAGE_404" => "",
		"META_DESCRIPTION" => "-",
		"META_KEYWORDS" => "-",
		"NEWS_COUNT" => "3",
		"PAGER_BASE_LINK_ENABLE" => "N",
		"PAGER_DESC_NUMBERING" => "N",
		"PAGER_DESC_NUMBERING_CACHE_TIME" => "36000",
		"PAGER_SHOW_ALL" => "N",
		"PAGER_SHOW_ALWAYS" => "N",
		"PAGER_TEMPLATE" => "modern",
		"PAGER_TITLE" => "Новости",
		"PREVIEW_TRUNCATE_LEN" => "",
		"SEF_FOLDER" => "/news/",
		"SEF_MODE" => "Y",
		"SEF_URL_TEMPLATES" => array("news"=>"","section"=>"#SECTION_CODE_PATH#/","detail"=>"#SECTION_CODE_PATH#/#ELEMENT_CODE#",),
		"SET_LAST_MODIFIED" => "N",
		"SET_STATUS_404" => "Y",
		"SET_TITLE" => "Y",
		"SHOW_404" => "N",
		"SORT_BY1" => "ACTIVE_FROM",
		"SORT_BY2" => "SORT",
		"SORT_ORDER1" => "DESC",
		"SORT_ORDER2" => "ASC",
		"STRICT_SECTION_CHECK" => "N",
		"USE_CATEGORIES" => "N",
		"USE_FILTER" => "N",
		"USE_PERMISSIONS" => "N",
		"USE_RATING" => "N",
		"USE_RSS" => "N",
		"USE_SEARCH" => "N",
		"USE_SHARE" => "N"
	)
);?> <a href="#"> <span class="date">April 25, 2017</span> </a>
		<h2><a href="#"></a><a href="#">And this is a<br>
		 massive headline</a></h2>
		<p>
			 Aenean ornare velit lacus varius enim ullamcorper proin aliquam<br>
			 facilisis ante sed etiam magna interdum congue. Lorem ipsum dolor<br>
			 amet nullam sed etiam veroeros.
		</p>
	</div>
 <a href="#" class="image main"><img src="/bitrix/templates/bitrixproject/images/pic01.jpg" alt=""></a>
	<ul class="actions">
		<li><a href="#" class="button big">Full Story</a></li>
	</ul>
 </article>
	<!-- Posts --> <section class="posts"> <article>
	<div>
 <span class="date">April 24, 2017</span>
		<h2><a href="#">Sed magna<br>
		 ipsum faucibus</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic02.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> <article>
	<div>
 <span class="date">April 22, 2017</span>
		<h2><a href="#">Primis eget<br>
		 imperdiet lorem</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic03.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> <article>
	<div>
 <span class="date">April 18, 2017</span>
		<h2><a href="#">Ante mattis<br>
		 interdum dolor</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic04.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> <article>
	<div>
 <span class="date">April 14, 2017</span>
		<h2><a href="#">Tempus sed<br>
		 nulla imperdiet</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic05.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> <article>
	<div>
 <span class="date">April 11, 2017</span>
		<h2><a href="#">Odio magna<br>
		 sed consectetur</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic06.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> <article>
	<div>
 <span class="date">April 7, 2017</span>
		<h2><a href="#">Augue lorem<br>
		 primis vestibulum</a></h2>
	</div>
 <a href="#" class="image fit"><img src="/bitrix/templates/bitrixproject/images/pic07.jpg" alt=""></a>
	<p>
		 Donec eget ex magna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Pellentesque venenatis dolor imperdiet dolor mattis sagittis magna etiam.
	</p>
	<ul class="actions">
		<li><a href="#" class="button">Full Story</a></li>
	</ul>
 </article> </section> <footer>
	<div class="pagination">
		 <!--<a href="#" class="previous">Prev</a>--> <a href="#" class="page active">1</a> <a href="#" class="page">2</a> <a href="#" class="page">3</a> <span class="extra">…</span> <a href="#" class="page">8</a> <a href="#" class="page">9</a> <a href="#" class="page">10</a> <a href="#" class="next">Next</a>
	</div>
 </footer>
</div>
 &nbsp;<?$APPLICATION->IncludeComponent(
	"bitrix:main.include",
	"",
	Array(
		"AREA_FILE_SHOW" => "page",
		"AREA_FILE_SUFFIX" => "inc",
		"EDIT_TEMPLATE" => ""
	)
);?><br><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>