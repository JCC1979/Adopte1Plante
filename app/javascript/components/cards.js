const hover = () => {

const cards = document.querySelectorAll('.card')
console.log(cards)

cards.forEach((card) => {
  card.addEventListener(('mouseenter'), (event) => {
    const footer = card.querySelector('.card-footerz')
    footer.classList.remove('hidden')
    footer.classList.remove('slideOutDown')
    footer.classList.add('slideInUp')
    console.log(footer)
  })
  card.addEventListener(('mouseleave'), (event) => {
    const footer = card.querySelector('.card-footerz')
    footer.classList.remove('slideInUp')
    footer.classList.add('slideOutDown')
})
})

};

export { hover };