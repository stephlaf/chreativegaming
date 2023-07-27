import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static values = {
    currentUserId: Number,
    gameId: Number
  }

  initialize() {
    // this.reloadPage = this.reloadPage.bind(this)
  }

  connect() {
    // window.addEventListener("onpopstate", this.reloadPage)
    this.deletePendingOrder()
    // console.log(this)
  }

  // reloadPage(event) {
  //   console.log(event);
  // }

  deletePendingOrder() {
  //   console.log('USER ID: ', this.currentUserIdValue);
  //   console.log('GAME ID: ', this.gameIdValue);
    const url = `/rollback_aborted_transaction?userId=${this.currentUserIdValue}&gameId=${this.gameIdValue}`

    fetch(url, {
      headers: { 'Accept': 'application/json', "Cache-Control": "no-cache" }
    })
      .then(response => response.json())
      .then((data) => {
        console.log('DATA IS: ', data);
        // console.log('USER ID: ', this.currentUserIdValue);
        // console.log('GAME ID: ', this.gameIdValue);
        // response.headers["Cache-Control"] = "no-cache"
        // let reload = true
        if(!data.reload) {
          Response.redirect("/games", 200);
        }
      })
  }
}
