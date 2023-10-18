<?php

namespace Source\Models\CafeApp;

use Source\Core\Model;
use Source\Models\User;

/**
 * Class AppCalled
 * @package Source\Models\CafeApp
 */
class AppCalled extends Model
{
    /**
     * AppCalled constructor.
     */
    public function __construct()
    {
        parent::__construct("app_called", ["id"], ["user_id", "description", "status"]);
    }
    /**
     * @return null|User
     */    
    public function User(): ?User
    {
        if ($this->user_id) {
            return (new User())->findByid($this->user_id); 
        }
        return null;
    }     
    

}