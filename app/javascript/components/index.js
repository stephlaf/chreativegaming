import { askForLogin, blogLike } from './bloglikes';
import { displayFile } from './customUpload';
import { paginate } from './paginate';
import { showComingSoon } from './alerts';
import { showTabContent } from './tabs';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  blogLike();
  displayFile();
  paginate();
  showComingSoon();
  showTabContent();
});
