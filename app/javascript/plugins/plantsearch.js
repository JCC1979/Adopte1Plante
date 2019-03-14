const Choices = require('choices.js');
require('choices.js/public/assets/styles/choices.css');

const searchplant = () => {
  const choices = new Choices('#term', {
      items: [],
      choices: [],
      searchEnabled: true,
      searchChoices: true,
      searchResultLimit: 8,
      noResultsText: 'Pas de résultats',
      noChoicesText: 'Entrez la plante de vos rêves',
      itemSelectText: 'Go !',
    }
  ).setValue([]);

  choices.passedElement.element.addEventListener("search", (e) => {
    const s = e.detail.value;
    const url = `/plants.json?term=${s}`;
    if (s.length >= 0) {
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          choices.clearStore();
          choices.setChoices(data, 'textsearch', 'textsearch', false);
        });
    }
  });
};

export { searchplant };