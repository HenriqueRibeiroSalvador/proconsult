<?php $v->layout("_theme"); ?>

<div class="app_formbox app_widget">
    <form class="app_form" action="<?= url("/app/response/{$called->id}"); ?>" method="post">
        <input type="hidden" name="create" value="true"/>

        <label>
            <span class="field icon-leanpub">Descrição:</span>
            <input class="radius" type="text" name="description" value="<?= $called->description; ?>" required/>
        </label>
        <label>
            <span class="field icon-comments-o">Responder ao Chamado:</span>
            <textarea class="radius" name="response" rows="4" required></textarea>
        </label>
        <div class="label_check">
            <p class="field icon-exchange">Encerrar  o Chamado:</p>
            <label class="check"
                   data-checkbox="true">
                <input type="radio" name="acao" value="open" checked> Sim
            </label>

            <label data-checkbox="true">
                <input type="radio" name="acao" value="close"> Não
            </label>
        </div>

        <div class="al-center">
            <div class="app_formbox_actions">
                <button class="btn btn_inline radius transition icon-pencil-square-o">Atualizar</button>
                <a class="btn_back transition radius icon-sign-in" href="<?= url_back(); ?>" title="Voltar">Voltar</a>
            </div>
        </div>
    </form>
</div>
<section class="app_launch_box">
        <?php if (!$Callprogress): ?>
                <div class="message info icon-info">Ainda não existem respostas para este chamado</div>
        <?php else: ?>
            <div class="app_launch_item header">
            <p class="desc">Descrição</p>
            <p class="date">Abertura</p>
            </div>
            <?php foreach ($Callprogress as $Callprogres): ?>
                <article class="app_launch_item">
                    <p class="desc app_invoice_link transition">
                        <a title="<?= $Callprogres->description; ?>"
                        href="<?= url("/app/resposta/{$Callprogress->id}"); ?>"><?= str_limit_words($Callprogres->description,
                                3, "&nbsp;<span class='icon-info icon-notext'></span>") ?></a>
                    </p>
                    <p class="date"><?= $Callprogres->created_at; ?></p>
                </article>
            <?php endforeach; ?>

        <?php endif; ?>
    </section>