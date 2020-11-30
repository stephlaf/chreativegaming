import { askForLogin } from './bloglikes';

document.addEventListener('turbolinks:load', () => {
  askForLogin();
});
