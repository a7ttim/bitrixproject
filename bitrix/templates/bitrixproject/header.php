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

            <?$APPLICATION->IncludeComponent("bitrix:menu", "topnav", Array(
	"ALLOW_MULTI_SELECT" => "N",	// Разрешить несколько активных пунктов одновременно
		"CHILD_MENU_TYPE" => "left",	// Тип меню для остальных уровней
		"DELAY" => "N",	// Откладывать выполнение шаблона меню
		"MAX_LEVEL" => "1",	// Уровень вложенности меню
		"MENU_CACHE_GET_VARS" => array(	// Значимые переменные запроса
			0 => "",
		),
		"MENU_CACHE_TIME" => "3600",	// Время кеширования (сек.)
		"MENU_CACHE_TYPE" => "N",	// Тип кеширования
		"MENU_CACHE_USE_GROUPS" => "Y",	// Учитывать права доступа
		"ROOT_MENU_TYPE" => "top",	// Тип меню для первого уровня
		"USE_EXT" => "N",	// Подключать файлы с именами вида .тип_меню.menu_ext.php
	),
	false
);?>