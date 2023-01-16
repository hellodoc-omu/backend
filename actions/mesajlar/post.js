const { connection } = require('../../db/connection');
const moment = require('moment');

connection.connect();

module.exports.mesajGonder = (req, res) => {
  const { icerik, resim, dosya, gonderen, dNo, dUzNo, hNo } = req.body;
  const tarih = moment(Date.now()).format('YYYY-MM-DD HH:mm:ss');

  const SQL = `INSERT INTO Mesaj (mIcerik, mResim, mDosya, mTarih, mGonderen, dNo, dUzNo, hNo) VALUES 
    ('${icerik}', ${resim || null}, ${
    dosya || null
  }, '${tarih}', '${gonderen}' , ${dNo}, ${dUzNo}, ${hNo});`;

  connection.query(SQL, (err) => {
    if (err) {
      res.status(400).json({
        status: 'error',
        error: err,
      });

      return;
    }

    result = {
      status: 'success',
      data: {
        ...req.body,
        tarih,
      },
    };

    res.json(result);
  });
};
