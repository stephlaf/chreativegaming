import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    currentUserId: Number,
    gameId: Number
  }
  connect() {
    this.deletePendingOrder()
  }

  deletePendingOrder() {
  //   console.log('USER ID: ', this.currentUserIdValue);
  //   console.log('GAME ID: ', this.gameIdValue);
    const url = `/rollback_aborted_transaction?userId=${this.currentUserIdValue}&gameId=${this.gameIdValue}`

    fetch(url, {
      headers: { 'Accept': 'application/json' }
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        console.log('USER ID: ', this.currentUserIdValue);
        console.log('GAME ID: ', this.gameIdValue);
        // let reload = true
        // if(data.reload && reload === true) {
        //   window.location.reload();
        //   reload = false
        // }
      })
  }
}
