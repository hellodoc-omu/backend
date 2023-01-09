const { selectAllColumns } = require('../get');

module.exports.getKisiler = (_, res) => selectAllColumns('Kisi', res);
