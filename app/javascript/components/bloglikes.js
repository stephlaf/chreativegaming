const askForLogin = () => {
  const likeLinks = document.querySelectorAll('.unLoggedBlogLikeAttempt');
  if (likeLinks.length > 0) {
    likeLinks.forEach((link) => {
      link.addEventListener('click', () => {
        window.location.href= 'users/sign_in'
      });
    });
  }
};

const blogLike = () => {
  const hearts = document.querySelectorAll('.blog-like');
  const blogCounts = document.querySelectorAll('.blog-count');

  if (hearts) {
    hearts.forEach((heart, index) => {
      heart.addEventListener("click", (e) => {
        e.preventDefault()

        fetch(`/blog_posts/${heart.dataset.id}/blog_likes`)
          .then(response => {
            if (response.status === 200) {
              const oldCountLike = parseInt(blogCounts[index].innerText, 10)
              if (heart.classList.contains("far")) {
                // console.log("not 🧡, make it liked...")
                blogCounts[index].innerText = oldCountLike + 1
                heart.classList.replace("far", "fas");
                // console.log("...Done");
              } else {
                // console.log("🧡, make it disliked...")
                blogCounts[index].innerText = oldCountLike - 1
                heart.classList.replace("fas", "far");
                // console.log("...Done");
              }
            }
          })
      })
    })
  };
};

export { askForLogin, blogLike };
