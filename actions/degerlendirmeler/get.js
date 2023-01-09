const { connection } = require('../../db/connection');

module.exports.getDegerlendirmeler = (_, res) => {
  const SQL = `SELECT deNo, deIcerik, dePuan, deUzNo, 
    Uzmanlik.uzIsim as dUzIsim, Degerlendirme.dNo, k1.kIsim as dIsim, k1.kSoyIsim as dSoyIsim, k1.kOnline as dOnline, 
    Degerlendirme.hNo, k2.kIsim as hIsim, k2.kSoyIsim as hSoyIsim, k2.kOnline as hOnline 
    FROM Degerlendirme INNER JOIN Doktor ON Degerlendirme.dNo = Doktor.dNo INNER JOIN Kisi k1 ON Doktor.kNo = k1.kNo INNER JOIN Hasta ON Degerlendirme.hNo = Hasta.hNo INNER JOIN Kisi k2 ON Hasta.kNo = k2.kNo INNER JOIN Uzmanlik ON Degerlendirme.deUzNo = Uzmanlik.uzNo;`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    const res_data = result.map((degerlendirme) => {
      const { deNo, deIcerik, dePuan } = degerlendirme;
      const { dNo, dIsim, dSoyIsim, dOnline, dUzIsim } = degerlendirme;
      const { hNo, hIsim, hSoyIsim, hOnline } = degerlendirme;

      const doktor = {
        dNo,
        isimSoyisim: `${dIsim} ${dSoyIsim}`,
        ilgiliUzmanlik: dUzIsim,
        online: dOnline,
      };

      const hasta = {
        hNo,
        isimSoyisim: `${hIsim} ${hSoyIsim}`,
        online: hOnline,
      };

      return {
        deNo,
        deIcerik,
        dePuan,
        doktor,
        hasta,
      };
    });

    res.json({
      status: 'success',
      data: res_data,
    });
  });
};
