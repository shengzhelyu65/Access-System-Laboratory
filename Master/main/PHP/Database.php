<?php

/**
 * connect the database
 */
class Database
{
    const DSN = 'mysql:dbname=access6;host=127.0.0.1';
    const USERNAME = 'Yuhao';
    const PASSWORD = 'mayuhao213';

    private  PDO $connection;
    private  static Database $instance;

    private function __construct()
    {
        $this->connection = new PDO(self::DSN,self::USERNAME,self::PASSWORD);

    }
    /**
     * @return PD0
     */
    public static function getConnection():PDO
    {
        if(!isset(self::$instance))
        {
            self::$instance= new Database();

        }
        //echo 'connection successful !!';
        return self::$instance->connection;
    }
}

