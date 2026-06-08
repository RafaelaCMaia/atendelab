<?php

$host = "localhost";
$porta = "3007";    
$banco = "atendelab";
$usuario = "root";
$senha = "";

    try {
        $pdo = new PDO(
            "mysql:host=$host;port=$porta;dbname=$banco;charset=utf8",
            $usuario,
            $senha
        );
    
    echo "conexão realizada com sucesso!";
    } catch (PD0Exception $e) {
        echo "Erro: " . $e->getMessage();
    }
