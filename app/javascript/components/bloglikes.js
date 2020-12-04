const askForLogin = () => {
  const likeLinks = document.querySelectorAll('.unLoggedBlogLikeAttempt');
  if (likeLinks.length > 0) {
    likeLinks.forEach((link) => {
      link.addEventListener('click', () => {
        window.alert("Please login!")
      });
    });
  }
};

export { askForLogin };
