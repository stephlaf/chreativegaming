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

const blogLike = () => {
  const hearts = document.querySelectorAll('.blog-like');
  const blogCounts = document.querySelectorAll('.blog-count');

  console.log(blogCounts);
  hearts.forEach((heart) => {
    heart.addEventListener("click", () => {



      let indexSearched;
      blogCounts.forEach((count, index) => {
        if (count.dataset.id === heart.dataset.id) {
          indexSearched = index;
        }
      });


      console.log("what we have to increment or decrement " ,blogCounts[indexSearched])
      fetch(`/blog_posts/${heart.dataset.id}/blog_likes`)
        .then(response => {
          if (response.status === 200) {
          // if heart is empty (has fas class) then add 1
            blogCounts[indexSearched].innerText = parseInt(blogCounts[indexSearched].innerText, 10) + 1

          // otherwise (has far class) remove 1
            blogCounts[indexSearched].innerText = parseInt(blogCounts[indexSearched].innerText, 10) - 1
          }
        })
    })
  })
};

export { askForLogin, blogLike };
