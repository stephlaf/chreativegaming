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
  // Next line commented out for now (2022/06/21) until fit for removal once the games functionalities are completed
  // showComingSoon();
  showTabContent();
});
