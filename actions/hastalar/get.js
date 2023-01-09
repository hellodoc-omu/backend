const { connection } = require('../../db/connection');

module.exports.getHastalar = (_, res) => {
  const SQL = `SELECT hNo, kIsim, kSoyIsim, kAvatar, kMail, kSifre, kCinsiyet, kOnline FROM Hasta INNER JOIN Kisi ON Hasta.kNo = Kisi.kNo;`;

  connection.query(SQL, (err, result) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    res.json({
      status: 'success',
      data: result,
    });
  });
};
