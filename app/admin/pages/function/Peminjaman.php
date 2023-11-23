<?php
session_start();
//------------------------------::::::::::::::::::::------------------------------\\
// Dibuat oleh FA Team di PT. Pacifica Raya Technology \\
//------------------------------::::::::::::::::::::------------------------------\\
include "../../../../config/koneksi.php";

if ($_GET['aksi'] == "pinjam") {

    if ($_POST['judulBuku'] == NULL) {
        $_SESSION['gagal'] = "Peminjaman buku gagal, Kamu belum memilih buku yang akan dipinjam !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    } elseif ($_POST['kondisiBukuSaatDipinjam'] == NULL) {
        $_SESSION['gagal'] = "Peminjaman buku gagal, Kamu belum memilih kondisi buku yang akan dipinjam !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    } else {

        include "Pemberitahuan.php";

        if (isset($yourArray['nama_anggota'])) {
            // Access the "nama_anggota" key
            $namaAnggota = $yourArray['nama_anggota'];
        } else {
            // Handle the case when the key is not defined
            $namaAnggota = "Default Value"; // Set a default value or handle the error as needed
        }
        $namaAnggota = $_POST['nama_anggota'];
        $ttl = $_POST['tanggallahir'];
        $gender = $_POST['kelamin'];
        $judul_buku = $_POST['judulBuku'];
        $tanggal_peminjaman = $_POST['tanggalPeminjaman'];
        $kondisi_buku_saat_dipinjam = $_POST['kondisiBukuSaatDipinjam'];

        $query = mysqli_query($koneksi, "SELECT * FROM peminjaman WHERE nama_anggota = '$namaAnggota' AND tanggallahir = '$ttl' AND kelamin = '$gender' AND judul_buku = '$judul_buku' AND tanggal_pengembalian = ''");
        $cek = mysqli_num_rows($query);

        if ($cek > 0) {
            $_SESSION['gagal'] = "Peminjaman buku gagal, Kamu telah meminjam buku ini sebelumnya !";
            header("location: " . $_SERVER['HTTP_REFERER']);
        } else {
            $sql = "INSERT INTO peminjaman(nama_anggota,tanggallahir,kelamin,judul_buku,tanggal_peminjaman,kondisi_buku_saat_dipinjam)
            VALUES('" . $namaAnggota . "','" . $ttl . "','" . $gender . "','" . $judul_buku . "','" . $tanggal_peminjaman . "','" . $kondisi_buku_saat_dipinjam . "')";
            $sql .= mysqli_query($koneksi, $sql);            

            if ($sql) {
                $_SESSION['berhasil'] = "Peminjaman buku berhasil !";
                header("location: " . $_SERVER['HTTP_REFERER']);
            } else {
                $_SESSION['gagal'] = "Terjadi masalah dalam pengiriman data peminjaman !";
                header("location: " . $_SERVER['HTTP_REFERER']);
            }
        }
    }
} elseif ($_GET['aksi'] == "pengembalian") {

    include "Pemberitahuan.php";

    if ($_POST['kondisiBukuSaatDikembalikan'] == "Baik") {
        $denda = "Tidak ada";
    } elseif ($_POST['kondisiBukuSaatDikembalikan'] == "Rusak") {
        $denda = "Rp 20.000";
    } elseif ($_POST['kondisiBukuSaatDikembalikan'] == "Hilang") {
        $denda = "Rp 50.000";
    }

    $namaAnggota = $_POST['nama_anggota'];
    $judul_buku = $_POST['judulBuku'];
    $tanggal_pengembalian = $_POST['tanggalPengembalian'];
    $kondisiBukuSaatDikembalikan = $_POST['kondisiBukuSaatDikembalikan'];

    $ambil_id = mysqli_query($koneksi, "SELECT * FROM peminjaman WHERE nama_anggota = '$namaAnggota' AND judul_buku = '$judul_buku'");
    $row = mysqli_fetch_assoc($ambil_id);

    $id_peminjaman = $row['id_peminjaman'];

    $query = "UPDATE peminjaman SET tanggal_pengembalian = '$tanggal_pengembalian', kondisi_buku_saat_dikembalikan = '$kondisiBukuSaatDikembalikan', denda = '$denda'";

    $query .= "WHERE id_peminjaman = $id_peminjaman";

    $sql = mysqli_query($koneksi, $query);

    if ($sql) {       

        $_SESSION['berhasil'] = "Pengembalian buku berhasil !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    } else {
        $_SESSION['gagal'] = "Pengembalian buku gagal !";
        header("location: " . $_SERVER['HTTP_REFERER']);
    }
}
function UpdateDataPeminjaman()
{
    include "../../../../config/koneksi.php";

    $nama_lama = $_SESSION['nama_anggota'];
    $namaAnggota = $_POST['fullname'];

    // Mencari nama dalam database berdasarkan session nama lengkap
    $query1 = mysqli_query($koneksi, "SELECT * FROM user WHERE fullname = '$nama_lama'");
    $row = mysqli_fetch_assoc($query1);

    // membuat variable dari hasil query1
    $nama_lama = $row['fullname'];

    // Fungsi update nama anggota pada table peminjaman
    $query = "UPDATE peminjaman SET fullname = '$namaAnggota'";
    $query .= "WHERE fullname = '$nama_lama'";

    $sql = mysqli_query($koneksi, $query);
}
