import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper';

export default class extends Controller {
  connect() {
    const swiper = new Swiper(".mySwiper", {
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
