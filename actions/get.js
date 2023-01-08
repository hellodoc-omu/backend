const { connection } = require('../db/connection');
connection.connect();

const selectAllColumns = (entity, res) => {
  const SQL = `SELECT * FROM ${entity};`;

  connection.query(SQL, (err, result) => {
    if (err) throw err;

    res.json(result);
  });
};

module.exports.getKurumlar = (_, res) => selectAllColumns('Kurum', res);
module.exports.getFakulteler = (_, res) => selectAllColumns('Fakulte', res);
module.exports.getAnaBilimDallari = (_, res) => {
  selectAllColumns('AnaBilimDali', res);
};

module.exports.getUzmanliklar = (_, res) => selectAllColumns('Uzmanlik', res);
module.exports.getKisiler = (_, res) => selectAllColumns('Kisi', res);
module.exports.getDoktorlar = (_, res) => {
  const SQL = `SELECT dNo, kIsim, kSoyisim, kAvatar, kMail, kSifre, kCinsiyet, kOnline, kuIsim, fIsim, abdIsim, uzNo FROM Doktor INNER JOIN Kisi ON Doktor.kNo = Kisi.kNo INNER JOIN Kurum ON Doktor.kuNo = Kurum.kuNo INNER JOIN Fakulte ON Doktor.fNo = Fakulte.fNo INNER JOIN AnaBilimDali ON Doktor.abdNo = AnaBilimDali.abdNo;`;

  connection.query(SQL, (err, result) => {
    if (err) throw err;

    let doktorlar = [...result];

    const saveChanges = (latest) => {
      res.json(
        latest.map((doktor) => {
          delete doktor.uzNo;
          return doktor;
        })
      );
    };

    doktorlar.forEach((doktor, index1) => {
      doktor.uzNo.forEach((uz, index2) => {
        const SQL2 = `SELECT uzIsim FROM Uzmanlik WHERE Uzmanlik.uzNo = ${uz}`;

        connection.query(SQL2, (err2, result2) => {
          if (err2) throw err2;

          const doktorIndex = doktorlar.findIndex((d) => d.dNo == doktor.dNo);

          doktorlar[doktorIndex].uzmanliklar = doktor.uzmanliklar
            ? [...doktorlar[doktorIndex].uzmanliklar, result2[0].uzIsim]
            : [result2[0].uzIsim];

          if (
            index1 == doktorlar.length - 1 &&
            index2 == doktor.uzNo.length - 1
          ) {
            saveChanges(doktorlar);
          }
        });
      });
    });
  });
};

module.exports.getHastalar = (_, res) => {
  const SQL = `SELECT hNo, kIsim, kSoyisim, kAvatar, kMail, kSifre, kCinsiyet, kOnline FROM Hasta INNER JOIN Kisi ON Hasta.kNo = Kisi.kNo;`;

  connection.query(SQL, (err, result) => {
    if (err) throw err;

    res.json(result);
  });
};
module.exports.getYardimlar = (_, res) => selectAllColumns('Yardim', res);
module.exports.getBildirimler = (_, res) => selectAllColumns('Bildirim', res);
module.exports.getMesajlar = (_, res) => selectAllColumns('Mesaj', res);
module.exports.getDegerlendirmeler = (_, res) => {
  selectAllColumns('Degerlendirme', res);
};
