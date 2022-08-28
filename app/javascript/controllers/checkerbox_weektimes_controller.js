import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-weektimes"
export default class extends Controller {
  static targets = [ "child"]
   connect() {
    console.log("hello parent")
  }

 toggleChildren() {
   if (this.childTargets.map(x => x.checked).includes(accord)) {
     this.childTarget.checked = true
     console.log("OUI parent")
   } else {
     this.childTarget.checked = false
     console.log("non parent")
   }
 }

  toggle(e) {
    const id = e.target.dataset.id
    const csrfToken = document.querySelector("[name='csrf-token']").content
    
    console.log(fetch)
    fetch(`/weektimes/${id}/toggle`, {
        method: 'POST', // *GET, POST, PUT, DELETE, etc.
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: {
            'Content-Type': 'application/json',
           'X-CSRF-Token': csrfToken
        },
        body: JSON.stringify({ accord: e.target.checked }) // body data type must match "Content-Type" header
   })
      .then(response => response.json())
  }
 
}