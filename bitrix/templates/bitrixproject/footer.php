<?
if(!defined('B_PROLOG_INCLUDED') || B_PROLOG_INCLUDED !== true)
    die();
?>
<!-- Footer -->
<footer>
    <div class="pagination">
        <!--<a href="#" class="previous">Prev</a>-->
        <a href="#" class="page active">1</a>
        <a href="#" class="page">2</a>
        <a href="#" class="page">3</a>
        <span class="extra">&hellip;</span>
        <a href="#" class="page">8</a>
        <a href="#" class="page">9</a>
        <a href="#" class="page">10</a>
        <a href="#" class="next">Next</a>
    </div>
</footer>

</div>

<!-- Footer -->
<footer id="footer">
    <section>
        <form method="post" action="#">
            <div class="field">
                <label for="name">Name</label>
                <input type="text" name="name" id="name" />
            </div>
            <div class="field">
                <label for="email">Email</label>
                <input type="text" name="email" id="email" />
            </div>
            <div class="field">
                <label for="message">Message</label>
                <textarea name="message" id="message" rows="3"></textarea>
            </div>
            <ul class="actions">
                <li><input type="submit" value="Send Message" /></li>
            </ul>
        </form>
    </section>
    <section class="split contact">
        <section class="alt">
            <h3>Address</h3>
            <p>1234 Somewhere Road #87257<br />
                Nashville, TN 00000-0000</p>
        </section>
        <section>
            <h3>Phone</h3>
            <p><a href="#">(000) 000-0000</a></p>
        </section>
        <section>
            <h3>Email</h3>
            <p><a href="#">info@untitled.tld</a></p>
        </section>
        <section>
            <h3>Social</h3>
            <ul class="icons alt">
                <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
            </ul>
        </section>
    </section>
</footer>

<!-- Copyright -->
<div id="copyright">
    <ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
</div>

</div>

<!-- Scripts -->
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/jquery.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/jquery.scrollex.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/jquery.scrolly.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/skel.min.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/util.js"></script>
<script src="<?=SITE_TEMPLATE_PATH?>/assets/js/main.js"></script>

</body>
</html>
