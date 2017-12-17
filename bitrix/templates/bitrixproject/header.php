<?
if(!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true)
	die();
?>
        <!DOCTYPE HTML>
        <!--
            Massively by HTML5 UP
            html5up.net | @ajlkn
            Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
        -->
        <html>
        <head>
            <title><?$APPLICATION->ShowTitle();?></title>
            <?$APPLICATION->ShowHead();?>
            <link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/assets/css/main.css" />
            <noscript><link rel="stylesheet" href="<?=SITE_TEMPLATE_PATH?>/assets/css/noscript.css" /></noscript>
        </head>
        <body class="is-loading">
        <div id="panel">
            <?$APPLICATION->ShowPanel();?>
        </div>
        <!-- Wrapper -->
        <div id="wrapper" class="fade-in">

            <!-- Intro -->
            <div id="intro">
                <h1>This is<br />
                    Massively</h1>
                <p>A free, fully responsive HTML5 + CSS3 site template designed by <a href="https://twitter.com/ajlkn">@ajlkn</a> for <a href="https://html5up.net">HTML5 UP</a><br />
                    and released for free under the <a href="https://html5up.net/license">Creative Commons license</a>.</p>
                <ul class="actions">
                    <li><a href="#header" class="button icon solo fa-arrow-down scrolly">Continue</a></li>
                </ul>
            </div>

            <!-- Header -->
            <header id="header">
                <a href="index.html" class="logo">Massively</a>
            </header>

            <?$APPLICATION->IncludeComponent(
	"bitrix:menu", 
	"topnav", 
	array(
		"ALLOW_MULTI_SELECT" => "N",
		"CHILD_MENU_TYPE" => "left",
		"DELAY" => "N",
		"MAX_LEVEL" => "1",
		"MENU_CACHE_GET_VARS" => array(
		),
		"MENU_CACHE_TIME" => "3600",
		"MENU_CACHE_TYPE" => "N",
		"MENU_CACHE_USE_GROUPS" => "Y",
		"ROOT_MENU_TYPE" => "top",
		"USE_EXT" => "N",
		"COMPONENT_TEMPLATE" => "topnav"
	),
	false
);?>