import { askForLogin } from './bloglikes';
import { printTab } from './homefeed';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
  printTab();
  // console.log(tabs)
});
