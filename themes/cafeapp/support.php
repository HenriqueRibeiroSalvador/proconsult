<?php $v->layout("_theme"); ?>

<?php if ($error): ?>
            <div><?= $error; ?></div>
<?php endif ?>

<div class="app_formbox app_widget">

    <form class="app_form" action="<?= url("/app/support"); ?>" method="post">
    <input type="hidden" name="create" value="true"/>
    <input type="hidden" name="user_id" value="<?= $user->id;?>"/>
        <label>
                <span class="field icon-user">Cliente:</span>
                <input class="radius" type="text" name="first_name" required
                       value="<?= user()->fullName(); ?>"/>
            </label>

        <label>
                <span class="field icon-life-ring">O que precisa?</span>
                <select name="subject" required>
                    <option value="Pedido de suporte">&ofcir; Preciso de suporte</option>
                </select>
            </label>

            <label>
                <span class="field icon-comments-o">Descrever sua necessidade:</span>
                <textarea class="radius" name="description" rows="4" required></textarea>
            </label>

            <button class="btn radius transition icon-paper-plane-o">Enviar Agora</button>
    </form>
</div>