<?php

namespace Source\Core;

/**
 * FSPHP | Class Connect [ Singleton Pattern ]
 *
 * @author Robson V. Leite <cursos@upinside.com.br>
 * @package Source\Core
 */
class Connect
{
    /** @const array */
    private const OPTIONS = [
        \PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8",
        \PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION,
        \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_OBJ,
        \PDO::ATTR_CASE => \PDO::CASE_NATURAL
    ];

    /** @var \PDO */
    private static $instance;

    /**
     * @return \PDO
     */
    public static function getInstance(): ?\PDO
    {
        $host= '192.168.10.2';
$db = 'libratrc';
$user = 'postgres';
$password = 'lb588'; 
        if (empty(self::$instance)) {
            try {
                //self::$instance = new \PDO(
                    $dsn = "pgsql:host=$host;port=5433;dbname=$db;";

                    // make a database connection
                    self::$instance =  new \PDO(
                        $dsn,
                        $user,
                        $password,
                        [\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION]
                );
            } catch (\PDOException $exception) {
                var_dump($exception);
               // redirect("/ops/problemas");
            }
        }

        return self::$instance;
    }

    /**
     * Connect constructor.
     */
    final private function __construct()
    {
    }

    /**
     * Connect clone.
     */
    final private function __clone()
    {
    }
}