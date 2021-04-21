import { askForLogin } from './bloglikes';
import { showComingSoon } from './alerts';
import { showTabContent } from './tabs';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  showComingSoon();
  showTabContent();
});
