/* ----------------------------------------------- */
/* CREATION TABLES + INSERTION DATA */
/* ----------------------------------------------- */

CREATE TABLE admin (
  IdAdmin int(11) NOT NULL,
  Username varchar(20) NOT NULL,
  Password varchar(125) NOT NULL,
  NamaLengkap varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO admin (IdAdmin, Username, Password, NamaLengkap) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator');

/* --- */

CREATE TABLE bis (
  PlatNomor char(11) NOT NULL,
  IdBisJenis int(11) NOT NULL,
  NamaBis varchar(30) NOT NULL,
  Harga double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE bisjenis (
  IdBisJenis int(11) NOT NULL,
  NamaJenis varchar(15) DEFAULT NULL,
  Kapasitas int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE jadwal (
  IdJadwal int(11) NOT NULL,
  IdRute int(11) NOT NULL,
  PlatNomor char(11) NOT NULL,
  Waktu time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE kursi (
  IdKursi int(11) NOT NULL,
  PlatNomor char(11) NOT NULL,
  NoKursi int(11) NOT NULL,
  StatusKursi enum('Bisa Dipakai','Belum Bisa Dipakai') NOT NULL DEFAULT 'Bisa Dipakai'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE pembayaran (
  IdPemesanan int(11) NOT NULL,
  TotalBayar int(7) NOT NULL,
  Status enum('Lunas','Belum Lunas') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE pemesan (
  NoIdentitas char(16) NOT NULL,
  NamaPemesan varchar(30) NOT NULL,
  Umur char(2) NOT NULL,
  JenisKelamin enum('L','P') NOT NULL,
  NoTelepon char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE pemesanan (
  IdPemesanan int(11) NOT NULL,
  NoIdentitas char(16) NOT NULL,
  IdJadwal int(11) NOT NULL,
  IdAdmin int(11) NOT NULL,
  JumlahPenumpang int(11) NOT NULL,
  TanggalPesan date NOT NULL,
  TanggalBerangkat date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE pemesanan_kursi (
  IdPemesananKursi int(11) NOT NULL,
  IdPemesanan int(11) NOT NULL,
  IdKursi int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* --- */

CREATE TABLE rute (
  IdRute int(11) NOT NULL,
  Asal varchar(20) NOT NULL,
  Tujuan varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* ----------------------------------------------- */
/* KEYS (PRIMARY, INDEX) TABLES */
/* ----------------------------------------------- */

ALTER TABLE admin
  ADD PRIMARY KEY (IdAdmin);

ALTER TABLE bis
  ADD PRIMARY KEY (PlatNomor),
  ADD KEY IdBisJenis (IdBisJenis);

ALTER TABLE bisjenis
  ADD PRIMARY KEY (IdBisJenis);

ALTER TABLE jadwal
  ADD PRIMARY KEY (IdJadwal),
  ADD KEY IdRute (IdRute),
  ADD KEY PlatNomor (PlatNomor);

ALTER TABLE kursi
  ADD PRIMARY KEY (IdKursi),
  ADD KEY PlatNomor (PlatNomor);

ALTER TABLE pembayaran
  ADD KEY IdPemesanan (IdPemesanan);

ALTER TABLE pemesan
  ADD PRIMARY KEY (NoIdentitas);

ALTER TABLE pemesanan
  ADD PRIMARY KEY (IdPemesanan),
  ADD KEY IdAdmin (IdAdmin),
  ADD KEY IdJadwal (IdJadwal),
  ADD KEY NoIdentitas (NoIdentitas);

ALTER TABLE pemesanan_kursi
  ADD PRIMARY KEY (IdPemesananKursi),
  ADD KEY IdPemesanan (IdPemesanan),
  ADD KEY IdKursi (IdKursi);

ALTER TABLE rute
  ADD PRIMARY KEY (IdRute);

/* ----------------------------------------------- */
/* AUTO INCREMENT TABLES */
/* ----------------------------------------------- */

ALTER TABLE admin
  MODIFY IdAdmin int(11) NOT NULL AUTO_INCREMENT;
  
ALTER TABLE bisjenis
  MODIFY IdBisJenis int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE jadwal
  MODIFY IdJadwal int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE kursi
  MODIFY IdKursi int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE pemesanan
  MODIFY IdPemesanan int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE pemesanan_kursi
  MODIFY IdPemesananKursi int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE rute
  MODIFY IdRute int(11) NOT NULL AUTO_INCREMENT;

/* ----------------------------------------------- */
/* FOREIGN KEY (CONSTRAINT, RELATION) */
/* ----------------------------------------------- */

ALTER TABLE bis
  ADD FOREIGN KEY (IdBisJenis) REFERENCES bisjenis (IdBisJenis);

ALTER TABLE jadwal
  ADD FOREIGN KEY (IdRute) REFERENCES rute (IdRute),
  ADD FOREIGN KEY (PlatNomor) REFERENCES bis (PlatNomor);

ALTER TABLE kursi
  ADD FOREIGN KEY (PlatNomor) REFERENCES bis (PlatNomor);

ALTER TABLE pembayaran
  ADD FOREIGN KEY (IdPemesanan) REFERENCES pemesanan (IdPemesanan);

ALTER TABLE pemesanan
  ADD FOREIGN KEY (IdAdmin) REFERENCES admin (IdAdmin),
  ADD FOREIGN KEY (IdJadwal) REFERENCES jadwal (IdJadwal),
  ADD FOREIGN KEY (NoIdentitas) REFERENCES pemesan (NoIdentitas);

ALTER TABLE pemesanan_kursi
  ADD FOREIGN KEY (IdPemesanan) REFERENCES pemesanan (IdPemesanan);