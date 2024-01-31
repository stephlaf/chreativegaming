import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper';
import { Navigation } from 'swiper/modules';


export default class extends Controller {
  connect() {
    const swiper = new Swiper(".mySwiper", {
      modules: [Navigation],
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });
  }
}
