const { connection } = require('../../db/connection');
const { getKosullar } = require('../../utilities/utilities');

const getKosulluMesajlar = (res, kosul) => {
  const { mNo, dNo, hNo, desc } = kosul;

  const selectedData = `m1.mNo, m1.mIcerik, m1.mResim, m1.mDosya, m1.mTarih, m1.mGonderen, m1.dNo, m1.dUzNo, k1.kAvatar as dAvatar, k1.kIsim as dIsim, k1.kSoyIsim as dSoyIsim, k1.kOnline as dOnline, Uzmanlik.uzIsim as dUzIsim, m1.hNo, k2.kAvatar as hAvatar, k2.kIsim as hIsim, k2.kSoyIsim as hSoyIsim, k2.kOnline as hOnline`;

  const SQL = `SELECT ${selectedData} FROM Mesaj m1 INNER JOIN Doktor ON m1.dNo = Doktor.dNo ${
    dNo != undefined ? `AND m1.dNo=${dNo}` : ''
  } ${
    mNo != undefined ? `AND m1.mNo=${mNo}` : ''
  } INNER JOIN Kisi k1 ON Doktor.kNo = k1.kNo INNER JOIN Hasta ON m1.hNo = Hasta.hNo INNER JOIN Kisi k2 ON Hasta.kNo = k2.kNo ${
    hNo != undefined ? `AND m1.hNo=${hNo}` : ''
  } INNER JOIN Uzmanlik ON m1.dUzNo = Uzmanlik.uzNo ${
    desc != undefined ? desc : ''
  };`;

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
      const { dNo, dAvatar, dIsim, dSoyIsim, dOnline, dUzNo, dUzIsim } = mesaj;
      const { hNo, hAvatar, hIsim, hSoyIsim, hOnline } = mesaj;

      const doktor = {
        no: dNo,
        avatar: dAvatar,
        isimSoyisim: `${dIsim} ${dSoyIsim}`,
        dUzNo,
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

  kosul.desc = 'ORDER BY m1.mTarih DESC';

  getKosulluMesajlar(res, kosul);
};

module.exports.getMesajlarim = (req, res) => {
  const kosul = getKosullar(req.query);

  getKosulluMesajlar(res, kosul);
};

module.exports.getMesajByID = (req, res) => {
  const kosul = { mNo: req.params.id };

  getKosulluMesajlar(res, kosul);
};
