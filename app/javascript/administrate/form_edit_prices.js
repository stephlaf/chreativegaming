const setPriceFields = () => {
  return {
    priceField: document.querySelector('#game_price_cents'),
    bronzePrice: document.querySelector('#game_price_bronze_cents'),
    silverPrice: document.querySelector('#game_price_silver_cents'),
    goldPrice: document.querySelector('#game_price_gold_cents'),
    platinumPrice: document.querySelector('#game_price_platinum_cents')
  };
};

const calculateMembershipPrices = (priceFields) => {  
  priceFields.priceField.addEventListener('keyup', () => {
    let price = event.currentTarget.value;
    
    if (/^\d+$/.test(price)) {
      priceFields.bronzePrice.value = (price * 0.9).toFixed(0);
      priceFields.silverPrice.value = (price * 0.8).toFixed(0);
      priceFields.goldPrice.value = (price * 0.7).toFixed(0);
      priceFields.platinumPrice.value = (price * 0.5).toFixed(0);
    }
  });
};

const isGamesNewOrEditUrl = () => {
  const regex = /^\/admin\/games\/(\d+\/edit|new)$/;

  if (regex.test(window.location.pathname)) {
    const priceFields = setPriceFields();
    calculateMembershipPrices(priceFields);
  }
};

export { isGamesNewOrEditUrl };
