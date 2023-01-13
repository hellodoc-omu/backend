const { connection } = require('../../db/connection');
const { getKosullar } = require('../../utilities/utilities');

const getKosulluMesajlar = (res, kosul) => {
  const { dNo, hNo, group } = kosul;

  const SQL = `SELECT mNo, mIcerik, mResim, mDosya, mTarih, mGonderen, Mesaj.dNo, k1.kAvatar as dAvatar, k1.kIsim as dIsim, k1.kSoyIsim as dSoyIsim, k1.kOnline as dOnline, Uzmanlik.uzIsim as dUzIsim, Mesaj.hNo, k2.kAvatar as hAvatar, k2.kIsim as hIsim, k2.kSoyIsim as hSoyIsim, k2.kOnline as hOnline FROM Mesaj INNER JOIN Doktor ON Mesaj.dNo = Doktor.dNo ${
    dNo != undefined ? `AND Mesaj.dNo=${dNo}` : ''
  } INNER JOIN Kisi k1 ON Doktor.kNo = k1.kNo INNER JOIN Hasta ON Mesaj.hNo = Hasta.hNo INNER JOIN Kisi k2 ON Hasta.kNo = k2.kNo ${
    hNo != undefined ? `AND Mesaj.hNo=${hNo}` : ''
  } INNER JOIN Uzmanlik ON Mesaj.dUzNo = Uzmanlik.uzNo;`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    const res_data = result.map((mesaj) => {
      const { mNo, mIcerik, mResim, mDosya, mTarih, mGonderen } = mesaj;
      const { dNo, dAvatar, dIsim, dSoyIsim, dOnline, dUzIsim } = mesaj;
      const { hNo, hAvatar, hIsim, hSoyIsim, hOnline } = mesaj;

      const doktor = {
        no: dNo,
        avatar: dAvatar,
        isimSoyisim: `${dIsim} ${dSoyIsim}`,
        ilgiliUzmanlik: dUzIsim,
        online: dOnline,
      };

      const hasta = {
        no: hNo,
        avatar: hAvatar,
        isimSoyisim: `${hIsim} ${hSoyIsim}`,
        online: hOnline,
      };

      return {
        mNo,
        mIcerik,
        mResim,
        mDosya,
        mTarih,
        mGonderen,
        doktor,
        hasta,
      };
    });

    res.json({
      status: 'success',
      data_size: Object.keys(res_data).length,
      data: res_data,
    });
  });
};

module.exports.getMesajlar = (req, res) => {
  const kosul = getKosullar(req.query);

  getKosulluMesajlar(res, kosul);
};

module.exports.getMesajByID = (req, res) => {
  getKosulluMesajlar(res, `mNo = ${req.params.id}`);
};
