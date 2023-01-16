module.exports.getKosullar = (query) => {
  const kosul = {};
  if (!query) return kosul;

  const filtreler = Object.keys(query);

  filtreler.forEach((filtre) => {
    const aranan = query[filtre];

    if (aranan && aranan != '') {
      kosul[filtre] = aranan;
    }
  });

  return kosul;
};
