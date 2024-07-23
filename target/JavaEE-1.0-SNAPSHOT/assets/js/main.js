
let userlistShow = document.querySelectorAll(".userlist__button--click");

// Recoorrer con forEach elementos dentro de menus
userlistShow.forEach(listShow => {
   listShow.addEventListener('click', () => {
       // Al presionar la el elemento se le agrega la clase arrow, si la tiene
       // se la quita.
       listShow.classList.toggle('arrow');
       let height=0;
       // Obtiene el elemento con la clase => .userlist--show
       let menu = listShow.nextElementSibling;
       
       /*
       // La altura de un elemento html
       console.warn(menu.clientHeight);
       // La altura de un elemento para que no se desborde
       console.warn(menu.scrollHeight);*/
        
       if(menu.clientHeight === 0) {
           height = menu.scrollHeight;
       }
       menu.style.height = `${height}px`;
   });
});
