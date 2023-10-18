<?php $v->layout("_theme"); ?>


<div class="app_formbox app_widget">
    <header class="app_sidebar_user app_widget_title">
            PERFIL DO USUÁRIO
    </header>
    <form class="app_form" action="<?= url("/app/profile"); ?>" method="post">
        <input type="hidden" name="update" value="true"/>

        <div class="label_group">
            <label>
                <span class="field icon-user">Nome:</span>
                <input class="radius" type="text" name="first_name" required
                       value="<?= $user->first_name; ?>"/>
            </label>

            <label>
                <span class="field icon-user-plus">Sobrenome:</span>
                <input class="radius" type="text" name="last_name" required
                       value="<?= $user->last_name; ?>"/>
            </label>
        </div>

        <div class="label_group">

            <label>
                <span class="field icon-briefcase">CPF:</span>
                <input class="radius mask-doc" type="text" name="document" placeholder="Apenas números" required
                       value="<?= $user->document; ?>"/>
            </label>

            <label>
                <span class="field icon-envelope">E-mail:</span>
                <input class="radius" type="email" name="email" placeholder="Seu e-mail de acesso" readonly
                    value="<?= $user->email; ?>"/>
            </label>
        </div>

        <div class="label_check">
            <p class="field icon-exchange">Tipo:</p>
            <label class="check"
                   data-checkbox="true">
                <input type="radio" name="tipo" value="client" checked> Cliente
            </label>

            <label data-checkbox="true">
                <input type="radio" name="tipo" value="collaborator"> Colaborador
            </label>
        </div>

        <div class="label_group">
            <label>
                <span class="field icon-unlock-alt">Senha:</span>
                <input class="radius" type="password" name="password" placeholder="Sua senha de acesso"/>
            </label>

            <label>
                <span class="field icon-unlock-alt">Repetir Senha:</span>
                <input class="radius" type="password" name="password_re" placeholder="Sua senha de acesso"/>
            </label>
        </div>

        <div class="al-center">
            <div class="app_formbox_actions">
                <button class="btn btn_inline radius transition icon-pencil-square-o">Atualizar</button>
            </div>
        </div>
    </form>
</div>