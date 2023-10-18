<?php

namespace Source\App;

use Source\Core\Controller;
use Source\Core\Session;
use Source\Models\Auth;
use Source\Models\CafeApp\AppCalled;
use Source\Models\CafeApp\AppCallProgress;
use Source\Models\Post;
use Source\Models\Report\Access;
use Source\Models\User;

/**
 * Class App
 * @package Source\App
 */
class App extends Controller
{
    /** @var User */
    private $user;

    /**
     * App constructor.
     */
    public function __construct()
    {
        parent::__construct(__DIR__ . "/../../themes/" . CONF_VIEW_APP . "/");

        if (!$this->user = Auth::user()) {
            $this->message->warning("Efetue login para acessar o APP.")->flash();
            redirect("/entrar");
        }

        (new Access())->report();
       // (new Online())->report();


        //UNCONFIRMED EMAIL
        if ($this->user->status != "confirmed") {
            $session = new Session();
            if (!$session->has("appconfirmed")) {
                $this->message->info("IMPORTANTE: Acesse seu e-mail para confirmar seu cadastro e ativar todos os recursos.")->flash();
                $session->set("appconfirmed", true);
                (new Auth())->register($this->user);
            }
        }
    }

 
    /**
     * APP HOME
     */
    public function home(): void
    {
        $head = $this->seo->render(
            "Olá {$this->user->first_name}. Vamos controlar? - " . CONF_SITE_NAME,
            CONF_SITE_DESC,
            url(),
            theme("/assets/images/share.jpg"),
            false
        );
        echo $this->view->render("profile", [
            "head" => $head,
            "user" => $this->user
        ]);
    }

    /**
     * @param array $data
     * @throws \Exception
     */
    public function support(array $data): void
    {
        $Userid = User()->id; 
        $User = (new User())->findById($Userid);
        //var_dump($Userid);
        if ($User->tipo <> 'C' )
        {
            $error = $this->message->error("Ooops!  {$this->user->first_name}. Colaboradores nao podem abrir Chamados..")->render();
            $head = $this->seo->render(
                "Olá {$this->user->first_name}. Podemos Ajudar? - " . CONF_SITE_NAME,
                CONF_SITE_DESC,
                url(),
                theme("/assets/images/share.jpg"),
                false
            );
            echo $this->view->render("support", [
                "head" => $head,
                "error" => $error,
                "user" => $this->user
            ]);
                return;
        }
        if (!empty($data["create"])) {
            $Called = (new AppCalled());
            $Called->user_id = $data["user_id"];
            $Called->description = $data["description"];
            $Called->status = 'A';

            if (!$Called->save()) {
                var_dump($Called);
                $json["message"] = $Called->message()->render();
                echo json_encode($json);
                return;
            }

            $json["message"] = $this->message->success("Pronto {$this->user->first_name}. Seu chamado foi aberto com sucesso!")->render();
            echo json_encode($json);
            return;
        }

        $head = $this->seo->render(
            "Olá {$this->user->first_name}. Podemos Ajudar? - " . CONF_SITE_NAME,
            CONF_SITE_DESC,
            url(),
            theme("/assets/images/share.jpg"),
            false
        );
        $error = "";
        echo $this->view->render("support", [
            "head" => $head,
            "error" => $error,
            "user" => $this->user
        ]);

    }    /**
    * @param array|null $data
    */
   public function callprogress(?array $data): void
   {
        $Userid = User()->id; 
        $User = (new User())->findById($Userid);
        //var_dump($User->id);

        $head = $this->seo->render(
           "Chamados Abertos - " . CONF_SITE_NAME,
           CONF_SITE_DESC,
           url(),
           theme("/assets/images/share.jpg"),
           false
        );
        if (User()->tipo == 'F') $calleds = (new AppCalled())->find("id > 0")->fetch(true); 
        if (User()->tipo == 'C') $calleds = (new AppCalled())->find("user_id = :uid",
        "&uid={$User->id}")->fetch(true); 
        
        echo $this->view->render("chamados", [
           "user" => $this->user,
           "head" => $head,           
           "user" => $User,
           "type" => "income",
           "chamados" => $calleds 
        ]);
   }

    /**
     * @param array $data
     */
    public function callresponse(array $data): void
    {
        if (!empty($data["create"])) {
           // var_dump($data);
            $Calledid = $data["called"];
            $Called = (new AppCalled())->findById("$Calledid");

            $Callprogress = (new AppCallProgress());//
            $Callprogress->called_id = $Calledid;
            $Callprogress->description = $data["response"];
            $Callprogress->user_id = User()->id;

            if (!$Callprogress->save()) {
                $json["message"] = $Callprogress->message()->before("Ooops! ")->after(" {$this->user->first_name}.")->render();
                echo json_encode($json);
                return;
            }
            if ($data["acao"] == 'open')  $Called->status = "T";
            if ($data["acao"] == 'close') $Called->status = "E";

            if (!$Called->save()) {
                $json["message"] = $Called->message()->render();
                echo json_encode($json);
                return;
            }

            $json["message"] = $this->message->success("Pronto {$this->user->first_name}, a atualização do chamado efetuada com sucesso!")->render();
            echo json_encode($json);
            return;
        }

        $head = $this->seo->render(
            "Andamento do Chamado - " . CONF_SITE_NAME,
            CONF_SITE_DESC,
            url(),
            theme("/assets/images/share.jpg"),
            false
        );
        $Calledid = $data["chamado"];
        $Called = (new AppCalled())->findById("$Calledid");
        $Callprogress = (new AppCallProgress)->find("called_id = :id","&id={$Calledid}")->fetch(true);

        if (!$Called) {
            $this->message->error("Ooops! Você tentou acessar uma fatura que não existe")->flash();
            redirect("/app");
        }

        echo $this->view->render("chamado", [
            "head" => $head,
            "called" => $Called,  
            "Callprogress" => $Callprogress        
        ]);
    }


    /**
     * @param array|null $data
     * @throws \Exception
     */
    public function profile(?array $data): void
    {
        if (!empty($data["update"])) {
            $document  = preg_replace("/[^0-9]/", "", $data["document"]);
            $user = (new User())->findByDocument($document);
            if (!empty($user)) 
            {
                $json["message"] = $this->message->warning(
                    "CPF já Cadastrado!")->render();
                echo json_encode($json);
                return;
            }

            $user = (new User())->findById($this->user->id);
            $user->first_name = $data["first_name"];
            $user->last_name = $data["last_name"];
            $user->document = preg_replace("/[^0-9]/", "", $data["document"]);
            if ($data["tipo"] == 'client') $user->tipo = "C";
            if ($data["tipo"] == 'collaborator') $user->tipo = "F";

            if (!empty($data["password"])) {
                if (empty($data["password_re"]) || $data["password"] != $data["password_re"]) {
                    $json["message"] = $this->message->warning("Para alterar sua senha, informa e repita a nova senha!")->render();
                    echo json_encode($json);
                    return;
                }

                $user->password = $data["password"];
            }

            if (!$user->save()) {
                var_dump($user);
                $json["message"] = $user->message()->render();
                echo json_encode($json);
                return;
            }

            $json["message"] = $this->message->success("Pronto {$this->user->first_name}. Seus dados foram atualizados com sucesso!")->render();
            echo json_encode($json);
            return;
        }

        $head = $this->seo->render(
            "Meu perfil - " . CONF_SITE_NAME,
            CONF_SITE_DESC,
            url(),
            theme("/assets/images/share.jpg"),
            false
        );

        echo $this->view->render("profile", [
            "head" => $head,
            "user" => $this->user,
            "photo" => ($this->user->photo() ? image($this->user->photo, 360, 360) :
                theme("/assets/images/avatar.jpg", CONF_VIEW_APP))
        ]);
    }

    /**
     * APP LOGOUT
     */
    public function logout(): void
    {
        $this->message->info("Você saiu com sucesso " . Auth::user()->first_name . ". Volte logo :)")->flash();

        Auth::logout();
        redirect("/entrar");
    }
}