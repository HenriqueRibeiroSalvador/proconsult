<?php

namespace Source\Models\CafeApp;

use Source\Core\Model;
use Source\Models\User;

/**
 * Class AppCallProgress
 * @package Source\Models\CafeApp
 */
class AppCallProgress extends Model
{
    /**
     * AppCallProgress constructor.
     */
    public function __construct()
    {
        parent::__construct("app_call_progress", ["id"], ["called_id", "description","user_id"]);
    }
}