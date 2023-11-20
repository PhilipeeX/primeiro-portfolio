const navSuperior = document.querySelector('.skills-po')
const menu = document.querySelector('.menu-lateral')
navSuperior.addEventListener('click', () => {
    menu.classList.toggle('menu-lateral--ativo')
})