const showComingSoon = () => {
  const games = document.querySelector('.games-alert');
  const body = document.querySelector('body');
  if (games) {
    games.addEventListener('click', (event) => {
      event.preventDefault();
      event.currentTarget.classList.add('disable-link');
      event.currentTarget.blur();

      const alert =
        `<div id="gameAlert" class="alert alert-info alert-dismissible custom-alert" role="alert">
            <button id="closeButton" type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <span class="flash-text-positioning">Coming soon! 👾</span>
          </div>`;

      body.insertAdjacentHTML("afterbegin", alert);

      // Target newly inserted alert and close it after 2 secs
      const alertDiv = document.getElementById('gameAlert')
      setTimeout(() => {
        alertDiv.remove();
      }, 2000);
    });
  }
};

export { showComingSoon };
