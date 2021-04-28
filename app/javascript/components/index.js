import { askForLogin } from './bloglikes';
import { displayFile } from './customUpload';
import { showComingSoon } from './alerts';
import { showTabContent } from './tabs';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  displayFile();
  showComingSoon();
  showTabContent();
});
