<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
        <meta name="mit" content="2021-11-21T11:24:09-03:00+168669">
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <?= $head; ?>

    <link rel="icon" type="image/png" href="<?= theme("/assets/images/favicon.png"); ?>"/>
    <link rel="stylesheet" href="<?= theme("/assets/style.css"); ?>"/>
</head>
<body>

<div class="ajax_load">
    <div class="ajax_load_box">
        <div class="ajax_load_box_circle"></div>
        <p class="ajax_load_box_title">Aguarde, carregando...</p>
    </div>
</div>

<!--HEADER-->
<header class="main_header gradient gradient-green">
    <div class="container">
        <div class="main_header_logo">
            <h1><a class="icon-home transition" title="Home" href="<?= url(); ?>">ProConsult</b></a></h1>
        </div>

        <nav class="main_header_nav">
            <span class="main_header_nav_mobile j_menu_mobile_open icon-menu icon-notext radius transition"></span>
            <div class="main_header_nav_links j_menu_mobile_tab">
                <span class="main_header_nav_mobile_close j_menu_mobile_close icon-error icon-notext transition"></span>
                <?php if (\Source\Models\Auth::user()): ?>
                    <a class="link login transition radius icon-coffee" title="Controlar"
                       href="<?= url("/app"); ?>">Controlar</a>
                <?php else: ?>
                    <a class="link login transition radius icon-sign-in" title="Entrar"
                       href="<?= url("/entrar"); ?>">Entrar</a>
                <?php endif; ?>
            </div>
        </nav>
    </div>
</header>

<!--CONTENT-->
<main class="main_content">
    <?= $v->section("content"); ?>
</main>

<?php if ($v->section("optout")): ?>
    <?= $v->section("optout"); ?>
<?php else: ?>
    <article class="footer_optout">
        <div class="footer_optout_content content">
            <h2>Teste Admissional</h2>
            <p>Apenas para fins de análise de conhecimentos, se eu fosse faer do zero, teríamos mais analises e controles.</p>
        </div>
    </article>
<?php endif; ?>

<!--FOOTER-->

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-53658515-18"></script>
<script src="<?= theme("/assets/scripts.js"); ?>"></script>
<?= $v->section("scripts"); ?>

</body>
</html>