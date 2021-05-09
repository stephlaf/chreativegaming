// Select links with paginate ID
// when clicked
// Prevent default
// Keep Member's feed tab active


const paginate = () => {

  const params = window.location.search;
  const target = document.getElementById("the-good-place");

  if (params.includes("page")) {
    target.scrollIntoView({behavior: "smooth"});
  };
}

export { paginate };
