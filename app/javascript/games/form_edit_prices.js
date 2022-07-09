const priceField = document.querySelector('#game_price_cents');
const bronzePrice = document.querySelector('#bronze');
const silverPrice = document.querySelector('#silver');
const goldPrice = document.querySelector('#gold');
const platinumPrice = document.querySelector('#platinum');

const calculateMembershipPrices = () => {
  priceField.addEventListener('keyup', () => {
    let price = event.currentTarget.value;
    if (/^\d+$/.test(price)) {
      bronzePrice.innerText = (price * 0.9).toFixed(0);
      silverPrice.innerText = (price * 0.8).toFixed(0);
      goldPrice.innerText = (price * 0.7).toFixed(0);
      platinumPrice.innerText = (price * 0.5).toFixed(0);
    }
  });
};

export { calculateMembershipPrices };
