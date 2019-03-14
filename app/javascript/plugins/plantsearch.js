const Choices = require('choices.js/public/assets/scripts/choices');
require('choices.js/public/assets/styles/choices.css');

const choices = new Choices('#term', {
  items: [],
  choices: [],
  searchEnabled: true,
  searchChoices: true,
  searchResultLimit: 8,
  noResultsText: 'Pas de résultats',
}).setValue([]);


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