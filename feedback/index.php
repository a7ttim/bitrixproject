<?
require($_SERVER["DOCUMENT_ROOT"]."/bitrix/header.php");
$APPLICATION->SetTitle("Обратная связь");
class FbackForm
{
    function BeforeSend($arFields, $arTemplate)
    {
        if ($arTemplate["ID"]==7) //Если нужный шаблон
        {
            //подключаем модуль ИБ
            if(CModule::IncludeModule("iblock"))
            {
                $arElFields=array(
                    "IBLOCK_ID" => 2, //Нужный ИБ
                    "IBLOCK_SECTION_ID" => 28, //Нужный раздел
                    "NAME" => $arFields["AUTHOR"], //Название элемента
                    "DETAIL_TEXT" => $arFields["TEXT"], //Текст отзыва или любое бла-бла
                    "PROPERTY_VALUES" => array( //Пользовательские поля, обязательно перечислять все, даже те, что просто будут пустые
                        "FB_EMAIL" => $arFields["AUTHOR_EMAIL"],
                        "FB_MARK" => "",
                        "FB_THEME" => "",
                    ),
                );
                $oElement = new CIBlockElement();
                $idElement = $oElement->Add($arElFields, false, false, false);
            }
        }
        return false;
    }
}
?><br>
 <!-- Footer --><br>
<footer id="footer"> <section>
<?$APPLICATION->IncludeComponent(
	"bitrix:main.feedback",
	"",
	Array(
		"EMAIL_TO" => "attim38@gmail.com",
		"EVENT_MESSAGE_ID" => AddEventHandler('main', 'OnBeforeEventSend', array("FbackForm", "BeforeSend")),
		"OK_TEXT" => "Спасибо, ваше сообщение принято.",
		"REQUIRED_FIELDS" => array(),
		"USE_CAPTCHA" => "Y"
	)
);?>
<form method="post" action="#">
	<div class="field">
 <label for="name">Name</label> <input type="text" name="name" id="name">
	</div>
	<div class="field">
 <label for="email">Email</label> <input type="text" name="email" id="email">
	</div>
	<div class="field">
 <label for="message">Message</label> <textarea name="message" id="message" rows="3"></textarea>
	</div>
	<ul class="actions">
		<li><input type="submit" value="Send Message"></li>
	</ul>
</form>
 </section> <section class="split contact"> <section class="alt">
<h3>Address</h3>
<p>
	 1234 Somewhere Road #87257<br>
	 Nashville, TN 00000-0000
</p>
 </section> <section>
<h3>Phone</h3>
<p>
 <a href="#">(000) 000-0000</a>
</p>
 </section> <section>
<h3>Email</h3>
<p>
 <a href="#">info@untitled.tld</a>
</p>
 </section> <section>
<h3>Social</h3>
<ul class="icons alt">
	<li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
	<li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
	<li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
	<li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
</ul>
 </section> </section> </footer><?require($_SERVER["DOCUMENT_ROOT"]."/bitrix/footer.php");?>