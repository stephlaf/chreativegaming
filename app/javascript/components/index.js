import { askForLogin } from './bloglikes';
import { showComingSoon } from './alerts';
import { showTabContent } from './tabs';
import { displayFile } from './customUpload';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  showComingSoon();
  showTabContent();
  displayFile();
});
