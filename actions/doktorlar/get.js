const { connection } = require('../../db/connection');

module.exports.getDoktorlar = (_, res) => {
  const SQL = `SELECT dNo, kIsim, kSoyIsim, kAvatar, kMail, kSifre, kCinsiyet, kOnline, kuIsim, fIsim, abdIsim, uzNo FROM Doktor INNER JOIN Kisi ON Doktor.kNo = Kisi.kNo INNER JOIN Kurum ON Doktor.kuNo = Kurum.kuNo INNER JOIN Fakulte ON Doktor.fNo = Fakulte.fNo INNER JOIN AnaBilimDali ON Doktor.abdNo = AnaBilimDali.abdNo;`;

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
