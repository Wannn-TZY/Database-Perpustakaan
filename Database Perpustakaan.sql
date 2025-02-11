-- Nomer 1: Buatlah database dengan nama db_perpus--
create database db_perpus;
use db_perpus;

-- Nomer 2: Buatlah table buku, siswa dan peminjaman. --
create table Buku (
	idBuku int primary key auto_increment,
    JudulBuku varchar(100),
    Penulis varchar(100),
    Kategori varchar(50),
    Stok int
);

create table Siswa (
	IdSiswa int primary key auto_increment,
    Nama varchar(100),
    Kelas varchar(10)
);

create table Peminjaman (
	IdPeminjaman int primary key auto_increment,
    IdSiswa int,
    IdBuku int,
    TanggalPeminjaman date,
    TanggalPengembalian date, 
    Status enum ('Dipinjamkan', 'Dikembalikan')
);

describe Buku;
describe Siswa;
describe Peminjaman;
-- Nomer 3: Input 5 record di setiap table menggunakan query INSERT, UPDATE, DELETE.--
insert into Buku(JudulBuku, Penulis, Kategori, Stok) 
values ('Algoritma dan Pemrograman', 'Andi Wijaya', 'Teknologi', 5),
	   ('Dasar-dasar Database', 'Budi Santoso', 'Teknologi', 7),
       ('Matematika Diskrit', 'Rina Sari', 'Matematika', 4),
       ('Sejarah Dunia', 'John Smith', 'Sejarah', 3),
       ('Pemrograman Web dengan PHP', 'Eko Prasetyo', 'Teknologi', 8);
       
insert into Siswa(Nama, Kelas)
values ('Andi Saputra','X-RPL'),
	   ('Budi Wijaya','X-TKJ'),
       ('Citra Lestari','XI-RPL'),
       ('Dewi Kurniawan','XI-TKJ'),
       ('Eko Prasetyo','XII-RPL');

insert into Peminjaman(IdSiswa, IdBuku, TanggalPeminjaman, TanggalPengembalian, Status)
Values (11, 2, '2025-02-01', '2025-02-08', 'Dipinjamkan'),
	   (2, 5, '2025-01-28', '2025-02-04', 'Dikembalikan'),
       (3, 8, '2025-02-02', '2025-02-09', 'Dipinjamkan'),
       (4, 10, '2025-01-30', '2025-02-06', 'Dikembalikan'),
       (5, 3, '2025-01-25', '2025-02-01', 'Dikembalikan');
       
select * from Buku;
select * from Siswa;
select * from Peminjaman;

-- Nomer 4:Input 10 record di setiap table menggunakan stored procedure INSERT.-- 
DELIMITER //
create procedure InputBuku()
begin
	insert into Buku(JudulBuku, Penulis, Kategori, Stok) 
	values ('Sistem Operasi', 'Dian Kurniawan', 'Teknologi', 6),
	       ('Jaringan Komputer', 'Ahmad Fauzi', 'Teknologi', 5),
           ('Cerita Rakyat Nusantara', 'Lestari Dewi', 'Sastra', 9),
           ('Bahasa Inggris untuk Pemula', 'Jane Doe', 'Bahasa', 10),
           ('Biologi Dasar', 'Budi Rahman', 'Sains', 7),
           ('Kimia Organik', 'Siti Aminah', 'Sains', 5),
	       ('Teknik Elektro', 'Ridwan Hakim', 'Teknik', 6),
           ('Fisika Modern', 'Albert Einstein', 'Sains', 4),
           ('Manajemen Waktu', 'Steven Covey', 'Pengembangan', 8),
           ('Strategi Belajar Efektif', 'Tony Buzan', 'Pendidikan', 6);
end //

DELIMITER //
create procedure InputSiswa()
begin
	insert into Siswa(Nama, Kelas)
	values ('Farhan Maulana','XII-TKJ'),
	       ('Gita Permata','X-RPL'),
           ('Hadi Sucipto','X-TKJ'),
           ('Intan Permadi','XI-RPL'),
           ('Joko Santoso','XI-TKJ'),
           ('Kartika Sari','XII-RPL'),
           ('Lintang Putri','XII-TKJ'),
	       ('Muhammad Rizky','X-RPL'),
           ('Novi Andriana','XI-TKJ'),
           ('Olivia Hernanda','XI-RPL');
end//

DELIMITER //
create procedure InputPeminjaman()
begin
	insert into Peminjaman(IdSiswa, IdBuku, TanggalPeminjaman, TanggalPengembalian, Status)
	Values (15, 7, '2025-02-01', '2025-02-08', 'Dipinjamkan'),
	       (7, 1, '2025-01-29', '2025-02-05', 'Dikembalikan'),
           (8, 9, '2025-02-03', '2025-02-10', 'Dipinjamkan'),
           (13, 4, '2025-01-27', '2025-02-03', 'Dikembalikan'),
           (10, 11, '2025-02-01', '2025-02-08', 'Dipinjamkan');
end//

call InputBuku();
call InputSiswa();
call InputPeminjaman();
select * from Buku;
select * from Siswa;
select * from Peminjaman;

-- Nomer 5:Buatlah stored procedure UPDATE, DELETE di setiap table--
	-- Tabel Buku--
DELIMITER // 
create procedure UpdateBuku(
	In PidBuku int,
	In StokBuku int
)
begin 
	update Buku set Stok = StokBuku where IdBuku = PidBuku;
end//

DELIMITER //
create procedure HapusBuku (
	In PIdBuku int
)
begin
	delete from Buku where IdBuku = PIdBuku;
end//

call UpdateBuku(4,4);
call HapusBuku(13);
	-- Tabel Siswa--
DELIMITER // 
create procedure UpdateSiswa(
	In PidSiswa int,
	In PKelas varchar(10)
)
begin 
	update Siswa set Kelas = PKelas where IdSiswa = PidSiswa;
end//

DELIMITER //
create procedure HapusSiswa (
	In PIdSiswa int
)
begin
	delete from Siswa where IdSiswa = PIdSiswa;
end//

call UpdateSiswa('XI RPL 2', 1);
call HapusSiswa(15);

select * from Siswa;
-- Tabel Peminjaman--
DELIMITER // 
create procedure UpdatePeminjaman (
	In PIdPeminjaman int,
    In PTanggalPeminjaman date
)
begin
	update peminjaman set TanggalPeminjaman = PTanggalPeminjaman where IdPeminjaman = PIdPeminjaman;
end//

DELIMITER //
create procedure HapusPeminjaman (
	In PIdPeminjaman int
)
begin
	delete from peminjaman where IdPeminjaman = PIdPeminjaman ; 
end //

call UpdatePeminjaman(1, '2025-02-02');
call HapusPeminjaman(10):

-- Nomer 6 : Buatlah stored procedure untuk menampilkan seluruh record di setiap table --
-- Tabel Buku--
DELIMITER // 
create procedure LihatBuku()
begin
	select * from buku;
end //

call LihatBuku();
-- Tabel Siswa--
DELIMITER // 
create procedure LihatSiswa()
begin 
	select * from siswa;
end //

call LihatSiswa();
-- Tabel Peminjaman--
DELIMITER // 
create procedure LihatPeminjaman()
begin
	select * from peminjaman;
end // 

call LihatPeminjaman();

-- Nomer 7: Stok buku pada saat dipinjam berkurang secara otamatis.--
DELIMITER // 
create trigger AfterInsertPeminjaman
after insert on peminjaman
for each row
begin
	if new.status = 'Dipinjamkan' then 
		update buku set stok = stok - 1 where IdBuku = new.IdBuku;
	end if;
end // 

-- Nomer 8 : Stok buku pada saat dikembalikan bertambah secara otomatis. --
DELIMITER // 
create trigger AfterUpdatePeminjaman
after update on peminjaman
for each row 
begin
	if new.status = 'DiKembalikan' then 
		update buku set stok = stok+1 where IdBuku = new.IdBuku;
        end if;
end //

-- Nomer 9:Buatlah stored procedure untuk mengembalikan buku dan gunakan tanggal pengembalian sesuai dengan tanggal saat mengembalikan (CURRENT DATE).-- 

DELIMITER // 
create procedure ReturnBuku (
	In PIdPeminjaman int
)
begin
	update peminjaman set TanggalPengembalian = current_date, status = 'Dikembalikan'
    where IdPeminjaman = PIdPeminjaman;
end //

-- Nomer 10: Buatlah stored procedure untuk menampilkan daftar siswa yang pernah meminjam buku--

DELIMITER //
create procedure TampilPeminjamBuku()
begin 
	select distinct siswa.* from siswa join peminjaman on siswa.IdSiswa = peminjaman.IdSiswa;
end //
 
-- Nomer 11 : Buatlah stored procedure untuk menampilkan semua siswa, termasuk yang tidak pernah meminjam buku.--

DELIMITER //
create procedure LihatSemuaSiswa()
begin 
	select siswa .*, ifnull(peminjaman.IdPeminjaman, 'Belum Pernah Meminjam') as status
    from siswa left join peminjaman on siswa.IdSiswa = peminjaman.IdSiswa;
end //

-- Nomer 12: Buatlah stored procedure untuk menampilkan semua buku, termasuk yang belum pernah dipinjam.--

DELIMITER // 
create procedure LihatSemuaBuku()
begin
	select buku.*, ifnull(peminjaman.IdPeminjaman, 'Belum Perjah Dipinjam') as status
    from buku left join peminjaman on buku.IdBuku = peminjaman.IdBuku;
end//