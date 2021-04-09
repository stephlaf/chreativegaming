import { askForLogin } from './bloglikes';
import { showComingSoon } from './alerts';
import { printTab } from './homefeed';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  showComingSoon();
  // printTab();
  // console.log(tabs)
});
