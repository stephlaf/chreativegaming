const showComingSoon = () => {
  const games = document.querySelector('.games-alert');
  const body = document.querySelector('body');
  if (games) {
    games.addEventListener('click', (event) => {
      event.preventDefault();
      const alert =
        `<div class="alert alert-info alert-dismissible custom-alert" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            <span class="flash-text-positioning">Coming soon! 👾</span>
          </div>`;
      body.insertAdjacentHTML("afterbegin", alert);
    });
  }
};

export { showComingSoon };
