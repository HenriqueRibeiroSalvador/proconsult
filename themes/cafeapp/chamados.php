<?php $v->layout("_theme"); ?>

<div class="app_launch_header">
    <header class="app_header">
        RELAÇÃO DE CHAMADOS
    </header>

</div>

<section class="app_launch_box">
    <?php if (!$chamados): ?>
            <div class="message info icon-info">Ainda não existem chamados abertos</div>
    <?php else: ?>
        <div class="app_launch_item header">
        <p class="desc">Descrição</p>
        <p class="date">Abertura</p>
        </div>
        <?php foreach ($chamados as $chamado): ?>
            <article class="app_launch_item">
                <p class="desc app_invoice_link transition">
                    <a title="<?= $chamado->description; ?>"
                       href="<?= url("/app/resposta/{$chamado->id}"); ?>"><?= str_limit_words($chamado->description,
                            3, "&nbsp;<span class='icon-info icon-notext'></span>") ?></a>
                </p>
                <p class="date"><?= $chamado->created_at; ?></p>
            </article>
        <?php endforeach; ?>

    <?php endif; ?>
</section>
