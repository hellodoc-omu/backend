const { selectAllColumns } = require('../get');

module.exports.getFakulteler = (_, res) => selectAllColumns('Fakulte', res);
