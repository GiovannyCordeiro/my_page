import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  copy(event) {
    event.preventDefault()
    const currentLocation = window.location.href.split('/').pop();
    const pathClipboard = `www.giovannydev.com.br/my_annotations/${currentLocation}`
    navigator.clipboard.writeText(pathClipboard)

    // const div = "<div id='copy_clipboard' class='copy_clipboard'>URL Copiada!</div>"
    const newElement = document.createElement('div')
    newElement.id = "copy_clipboard"
    newElement.className = "copy_clipboard"
    newElement.textContent = "URL Copiada!"
    const shareAnnot = document.getElementById("share-spec-annot")
    shareAnnot.appendChild(newElement)
    setTimeout(this.removeElement, 1400)
  }

  removeElement(){
    document.getElementById('copy_clipboard').remove()
  }
}