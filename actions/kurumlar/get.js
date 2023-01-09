const { selectAllColumns } = require('../get');

module.exports.getKurumlar = (_, res) => selectAllColumns('Kurum', res);
