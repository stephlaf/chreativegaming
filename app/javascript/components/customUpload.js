// $(document).ready ->

//   # ------------------------------------------------------
//   # pretty-fy the upload field
//   # ------------------------------------------------------
//   $realInputField = $('#real_file')

//   # drop just the filename in the display field
//   $realInputField.change ->
//     $('#file-display').val $(@).val().replace(/^.*[\\\/]/, '')

//   # trigger the real input field click to bring up the file selection dialog
//   $('#upload-btn').click ->
//     $realInputField.click()



const displayFile = () => {

  const upload = document.getElementById("upload-btn");
  const hiddenButton = document.getElementById("blog_post_blog_image");
  const fileDisplay = document.getElementById("file-display");
  // const hiddenPath = document.getElementById("blog_post_blog_image")

  upload.addEventListener("click", () => {
    hiddenButton.click();
  })

  hiddenButton.onchange = () => {

    const cleanPath = hiddenButton.value.replace(/^.*\\/, "");
    fileDisplay.classList.add("input-rounded-dashed");
    fileDisplay.innerText = cleanPath;
  }
}

export { displayFile }
