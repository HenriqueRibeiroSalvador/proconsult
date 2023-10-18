<?php

namespace Source\App\Admin;


use Source\Models\User;
use Source\Support\Pager;
use Source\Support\Thumb;
use Source\Support\Upload;

/**
 * Class Blog
 * @package Source\App\Admin
 */
class Blog extends Admin
{
    /**
     * Blog constructor.
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param array|null $data
     */
    public function home(?array $data): void
    {
        //search redirect
        if (!empty($data["s"])) {
            $s = str_search($data["s"]);
            echo json_encode(["redirect" => url("/admin/blog/home/{$s}/1")]);
            return;
        }

        $search = null;

        if (!empty($data["search"]) && str_search($data["search"]) != "all") {
            $search = str_search($data["search"]);
        }



        $head = $this->seo->render(
            CONF_SITE_NAME . " | Home",
            CONF_SITE_DESC,
            url("/admin"),
            url("/admin/assets/images/image.jpg"),
            false
        );

        echo $this->view->render("widgets/blog/home", [
            "app" => "home",
            "head" => $head        
        ]);
    }

