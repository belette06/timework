import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="checkbox-select-parent"
export default class extends Controller {
  static targets = ["parent", "child"]
  connect() {
    console.log("hello")
    // set all to false on page refresh
  //  this.childTargets.map(x => x.checked = false)
   // this.parentTarget.checked = false
  }

  toggleChildren(e) {
  
    if (this.parentTarget.checked) {   
      this.childTargets.map(x => x.checked = true)
       this.childTargets.forEach((child) => {
       child.checked = true 
    }) 
} else {
      this.childTargets.map(x => x.checked = false)
      console.log("non children")
    }
  }

  toggleParent() {
  
    if (this.childTargets.map(x => x.checked).includes(accord)) {
      this.parentTarget.checked = true
      console.log("OUI parent")
    } else {
      this.parentTarget.checked = false
      console.log("non parent")
    }
  }

  toggle(e) {
    const id = e.target.dataset.id
    const csrfToken = document.querySelector("[name='csrf-token']").content
    
    console.log(fetch)
    fetch(`/worktimes/${id}/toggle`, {
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

upper(e) {
  console.log("OUeppp children")
  console.log(e.target)
  console.log("OUeppp children")
  const id = e.target.dataset.id
  const csrfToken = document.querySelector("[name='csrf-token']").content
  
  console.log(fetch)
  fetch(`/weektimes/${id}/upper`, {
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
    .then(data => {
       alert(data.message)
   })
}

 
}