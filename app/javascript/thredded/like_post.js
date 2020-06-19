const likesLinks = document.querySelectorAll('.likes-link');
const token = $('meta[name="csrf-token"]').attr('content');

const updateDisplay = (data) => {
  const linkText = document.querySelector(`[data-id='post-${data.post.id}']`);
  linkText.innerText = data.linkText;
  const likesCount = document.querySelector(`[data-count='count-${data.post.id}']`);
  likesCount.innerText = `${data.count} Like${data.count === 1 ? '' : 's'}`;
};

const updateLikes = (postId) => {
  fetch(`/${postId}/likes`, {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    method: 'POST',
    headers: {
      'X-Requested-With': 'XMLHttpRequest',
      'X-CSRF-Token': token
    },
    body: 'test',
    credentials: 'same-origin'
  })
    .then(response => response.json())
    .then(data => updateDisplay(data));
};

const extractPostId = (event) => {
  event.preventDefault();
  const dataId = event.currentTarget.dataset.id;
  const postIdStr = dataId.match(/^(post-)(\d+)$/)[2];
  const postId = Number.parseInt(postIdStr, 10);
  updateLikes(postId);
};

const likePost = () => {
  likesLinks.forEach((likeLink) => {
    likeLink.addEventListener('click', extractPostId);
  });
};

export { likePost };
