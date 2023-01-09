const { selectAllColumns } = require('../get');

module.exports.getAnaBilimDallari = (_, res) => {
  selectAllColumns('AnaBilimDali', res);
};
