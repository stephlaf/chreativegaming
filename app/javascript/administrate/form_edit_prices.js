const setPriceFields = () => {
};

const calculateMembershipPrices = () => {  
  const priceField = document.querySelector('#game_price_cents');
  const bronzePrice = document.querySelector('#game_price_bronze_cents');
  const silverPrice = document.querySelector('#game_price_silver_cents');
  const goldPrice = document.querySelector('#game_price_gold_cents');
  const platinumPrice = document.querySelector('#game_price_platinum_cents');
  
  priceField.addEventListener('keyup', () => {

    let price = event.currentTarget.value;
    console.log(bronzePrice.value);
    if (/^\d+$/.test(price)) {
      bronzePrice.value = (price * 0.9).toFixed(0);
      silverPrice.value = (price * 0.8).toFixed(0);
      goldPrice.value = (price * 0.7).toFixed(0);
      platinumPrice.value = (price * 0.5).toFixed(0);
    }
  });
};

const test = () => {
  if (/^\/admin\/games\/(\d+\/edit|new)$/.test(window.location.pathname)) {
    console.log(window.location.pathname);
    // setPriceFields();
    calculateMembershipPrices();

  } else {
    console.log('not in right place');
  }
};

export { calculateMembershipPrices, test };
// export { calculateMembershipPrices, test };
