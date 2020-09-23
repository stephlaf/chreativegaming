import Autolinker from 'autolinker';

const hideGifLinks = () => {
  const allLinks = document.querySelectorAll('.textToAutoLink a');
  const regex = /\bhttp.+\.gif\b/;
  
  allLinks.forEach((link) => {
    if (link.innerText.match(regex)) {
      link.hidden = true;
    }
  });
};

const autoLink = (content) => {
  var autolinker = new Autolinker( {
      urls : {
          schemeMatches : true,
          wwwMatches    : true,
          tldMatches    : true
      },
      email       : true,
      phone       : true,
      mention     : false,
      hashtag     : false,

      stripPrefix : false,
      stripTrailingSlash : true,
      newWindow   : true,

      truncate : {
          length   : 0,
          location : 'end'
      },

      className : ''
  } );

  content.innerHTML = autolinker.link( content.innerText );
};

const buildLinks = () => {
  const allBlogContents = document.querySelectorAll('.textToAutoLink');
  
  allBlogContents.forEach((content) => {
    autoLink(content);
  });
  
  hideGifLinks();
};

export { buildLinks };
