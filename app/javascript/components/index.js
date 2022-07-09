import { askForLogin, blogLike } from './bloglikes';
import { displayFile } from './customUpload';
import { paginate } from './paginate';
import { showComingSoon } from './alerts';
import { showTabContent } from './tabs';

// import { showNumOfCharsInGameDescrInAdminPanelNew } from '../administrate/game_description_max_char';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  blogLike();
  displayFile();
  paginate();
  // showNumOfCharsInGameDescrInAdminPanelNew();
  // console.log('proutss');
  // Next line commented out for now (2022/06/21) until fit for removal once the games functionalities are completed
  // showComingSoon();
  showTabContent();
});
