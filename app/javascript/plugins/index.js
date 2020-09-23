import { buildLinks } from './init_autolinker';

document.addEventListener('turbolinks:load', () => {
  buildLinks();
});
