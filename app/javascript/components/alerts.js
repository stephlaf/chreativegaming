const showComingSoon = () => {
  const games = document.querySelector('.testing-alert');
  const body = document.querySelector('body');
    games.addEventListener('click', (event) => {
      event.preventDefault();
      const alert =
        `<div class="alert alert-info alert-dismissible" role="alert">
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
            Coming soon! 👾
          </div>`;
      body.insertAdjacentHTML("afterbegin", alert);
    });
};

export { showComingSoon };
