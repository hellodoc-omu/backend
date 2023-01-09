const { selectAllColumns } = require('../get');

module.exports.getYardimlar = (_, res) => selectAllColumns('Yardim', res);
