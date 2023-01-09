const { connection } = require('../../db/connection');

module.exports.getBildirimler = (_, res) => {
  const SQL = `SELECT bNo, bIcerik, Bildirim.dNo, k1.kIsim as dIsim, k1.kSoyIsim as dSoyIsim, k1.kOnline as dOnline, Bildirim.hNo, k2.kIsim as hIsim, k2.kSoyIsim as hSoyIsim, k2.kOnline as hOnline FROM Bildirim
    INNER JOIN Doktor ON Bildirim.dNo = Doktor.dNo INNER JOIN Kisi k1 ON Doktor.kNo = k1.kNo 
    INNER JOIN Hasta ON Bildirim.hNo = Hasta.hNo INNER JOIN Kisi k2 ON Hasta.kNo = k2.kNo;`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    const res_data = result.map((bildirim) => {
      const doktor = {
        dNo: bildirim.dNo,
        isimSoyisim: `${bildirim.dIsim} ${bildirim.dSoyIsim}`,
        online: bildirim.dOnline,
      };

      const hasta = {
        hNo: bildirim.hNo,
        isimSoyisim: `${bildirim.hIsim} ${bildirim.hSoyIsim}`,
        online: bildirim.hOnline,
      };

      return {
        bNo: bildirim.bNo,
        bIcerik: bildirim.bIcerik,
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
