const dotenv = require('dotenv');
dotenv.config();

module.exports.auth = (req, res, next) => {
  const validate1 = req.headers.api_key === process.env.API_KEY;
  const validate2 = req.headers.api_token === process.env.API_TOKEN;
  const result = validate1 && validate2;

  if (!result) {
    res.status(401).json({
      status: 'error',
      error: 'Buraya erişiminiz yok!',
    });
  } else {
    next();
  }
};
