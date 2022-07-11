const updateCounter = (numOfChars) => {
  const counter = document.getElementById('counter');
  counter.innerText = `${180 - numOfChars} Chars Left`;
}

const getNumOfChars = (event) => {
  const descField = event.currentTarget;
  descField.setAttribute('maxlength', 180);
  const numOfChars = descField.value.length;

  updateCounter(numOfChars);
};

const showNumOfCharsInGameDescrInAdminPanelNew = () => {
  const descField = document.getElementById('game_description')

  if (descField) {
    const counterElement = document.createElement('p');
    counterElement.setAttribute('id', 'counter');
    counterElement.innerText = '180 Chars Left';

    descField.parentElement.insertBefore(counterElement, descField);
    descField.addEventListener('keyup', getNumOfChars);
  }
}

export { showNumOfCharsInGameDescrInAdminPanelNew };
