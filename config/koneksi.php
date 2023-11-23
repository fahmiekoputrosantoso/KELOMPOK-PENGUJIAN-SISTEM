<?php
//------------------------------::::::::::::::::::::------------------------------\\
// Dibuat oleh Fahmi Eko Putro Santoso || 312010046 \\
//------------------------------::::::::::::::::::::------------------------------\\
$server = "localhost";
$username = "root";
$password = "";
$database = "db-perpustakaan";

$koneksi = mysqli_connect($server, $username, $password, $database);

if (mysqli_connect_errno()) {
    echo "Koneksi database gagal : " . mysqli_connect_error();
}
