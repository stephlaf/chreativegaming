import Autolinker from 'autolinker';

const trimDisplayedLinks = (link) => {
  const regex = /^(?<scheme>https:\/\/|http:\/\/).+/;
  const matchLink = link.innerText.match(regex);
  let newLinkText;

  if (matchLink) {
    newLinkText = link.innerText.replace(matchLink.groups.scheme, '');
    newLinkText = newLinkText.slice(0, 16) + '...';
  } else {
    newLinkText = link.innerText.slice(0, 16) + '...';
  }

  link.innerText = newLinkText;
};

const hideGifLinks = () => {
  const allLinks = document.querySelectorAll('.textToAutoLink a');
  const regex = /\bhttp.+\.gif\b/;

  allLinks.forEach((link) => {
    if (link.innerText.match(regex)) {
      link.hidden = true;
    } else {
      trimDisplayedLinks(link);
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
