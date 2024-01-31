import { Controller } from "@hotwired/stimulus"
import Swiper from 'swiper';
import { Navigation, Thumbs } from 'swiper/modules';


export default class extends Controller {
  connect() {
    const galleryThumbs = new Swiper(".gallery-thumbs", {
      spaceBetween: 10,
      slidesPerView: 4,
      freeMode: true,
      watchSlidesProgress: true,
    });

    const galleryTop = new Swiper(".gallery-top", {
      spaceBetween: 10,
      modules: [Navigation, Thumbs],
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      thumbs: {
        swiper: galleryThumbs,
      },
    });
  }
}
