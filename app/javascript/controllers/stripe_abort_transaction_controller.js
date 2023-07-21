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
    const url = `/rollback_aborted_transaction?userId=${this.currentUserIdValue}&gameId=${this.gameIdValue}`

    fetch(url, {
      headers: { 'Accept': 'application/json' }
    })
      .then(response => response.json())
      .then((data) => {
        let reload = true
        if(data.reload && reload === true) {
          window.location.reload();
          reload = false
        }
      })
  }
}
