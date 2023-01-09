const { connection } = require('../../db/connection');
connection.connect();

const moment = require('moment');

module.exports.mesajGonder = (req, res) => {
  const { icerik, resim, dosya, dNo, dUzNo, hNo } = req.body;
  const tarih = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

  const SQL = `INSERT INTO Mesaj (mIcerik, mResim, mDosya, mTarih, dNo, dUzNo, hNo) VALUES 
    ('${icerik}', ${resim || null}, ${
    dosya || null
  }, '${tarih}', ${dNo}, ${dUzNo}, ${hNo});`;

  connection.query(SQL, (err) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    result = {
      status: 200,
      data: {
        ...req.body,
        tarih,
      },
    };

    res.status(result.status).json(result);
  });
};
