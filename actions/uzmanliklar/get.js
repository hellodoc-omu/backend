const { selectAllColumns } = require('../get');

module.exports.getUzmanliklar = (_, res) => selectAllColumns('Uzmanlik', res);
