const displayFile = () => {

  const upload = document.getElementById("upload-btn");
  const hiddenButton = document.getElementById("blog_post_blog_image");
  const fileDisplay = document.getElementById("file-display");
  // const hiddenPath = document.getElementById("blog_post_blog_image")

  if (upload) {
    upload.addEventListener("click", () => {
      hiddenButton.click();
    })

    hiddenButton.onchange = () => {

      const cleanPath = hiddenButton.value.replace(/^.*\\/, "");
      fileDisplay.classList.add("input-rounded-dashed");
      fileDisplay.innerText = cleanPath;
    }
  }
}

export { displayFile }
