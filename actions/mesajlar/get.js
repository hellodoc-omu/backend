const { connection } = require('../../db/connection');

module.exports.getMesajlar = (_, res) => {
  const SQL = `SELECT mNo, mIcerik, mResim, mDosya, mTarih, 
    Mesaj.dNo, k1.kIsim as dIsim, k1.kSoyIsim as dSoyIsim, k1.kOnline as dOnline, uzIsim as dUzIsim, 
    Mesaj.hNo, k2.kIsim as hIsim, k2.kSoyIsim as hSoyIsim, k2.kOnline as hOnline 
    FROM Mesaj INNER JOIN Doktor ON Mesaj.dNo = Doktor.dNo INNER JOIN Kisi k1 ON Doktor.kNo = k1.kNo INNER JOIN Hasta ON Mesaj.hNo = Hasta.hNo INNER JOIN Kisi k2 ON Hasta.kNo = k2.kNo INNER JOIN Uzmanlik ON Mesaj.dUzNo = Uzmanlik.uzNo;`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    const res_data = result.map((mesaj) => {
      const { mNo, mIcerik, mResim, mDosya, mTarih } = mesaj;
      const { dNo, dIsim, dSoyIsim, dOnline, dUzIsim } = mesaj;
      const { hNo, hIsim, hSoyIsim, hOnline } = mesaj;

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
        mNo,
        mIcerik,
        mResim,
        mDosya,
        mTarih,
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
