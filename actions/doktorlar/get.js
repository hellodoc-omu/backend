const { connection } = require('../../db/connection');

const getKosulluDoktorlar = (res, kosul) => {
  const { dNo, uzNo, abdNo } = kosul;

  const SQL = `SELECT dNo, kIsim, kSoyIsim, kAvatar, kMail, kSifre, kCinsiyet, kOnline, kuIsim, fIsim, abdIsim, uzNo FROM Doktor 
  INNER JOIN Kisi ON Doktor.kNo = Kisi.kNo ${dNo != null ? `AND Doktor.dNo=${dNo} ` : ''}
  INNER JOIN Kurum ON Doktor.kuNo = Kurum.kuNo 
  INNER JOIN Fakulte ON Doktor.fNo = Fakulte.fNo 
  INNER JOIN AnaBilimDali ON Doktor.abdNo = AnaBilimDali.abdNo ${abdNo != null ? `AND Doktor.abdNo=${abdNo} ` : ''};`;

  console.log(SQL);

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    let doktorlar = [...result];

    const saveChanges = (latest) => {
      res.json({
        status: 'success',
        data: latest.map((doktor) => {
          delete doktor.uzNo;
          return doktor;
        }),
      });
    };



    doktorlar.forEach((doktor, index1) => {
      if (uzNo) {
        doktor.uzNo = doktor.uzNo.filter(uz => uz == uzNo);
      }

      if (doktor.uzNo.length < 1) {
        saveChanges(doktorlar.uzIsim);
        return;
      }

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
}

module.exports.getDoktorlar = (req, res) => {
  const { abdNo, uzNo, dNo } = req.query;

  const isAbdFiltered = abdNo;
  const isUzFiltered = uzNo;
  const isDFiltered = dNo;

  const isFiltered = isAbdFiltered || isUzFiltered || isDFiltered;
  let kosul = {};

  if (isFiltered) {
    const filtreler = Object.keys(req.query);
    filtreler.forEach(filtre => {
      const aranan = req.query[filtre];

      if (aranan && aranan != '') {
        kosul[filtre] = aranan;
      }
    });
  }

  getKosulluDoktorlar(res, kosul);
};
