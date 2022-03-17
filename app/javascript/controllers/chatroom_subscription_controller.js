import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { chatroomId: Number }
  static targets = ["messages", "form"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.messagesTarget.insertAdjacentHTML("beforeend", data),
      received: data => this.#insertMessageScrollDownAndResetForm(data),
    } )

    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)

  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }
  #insertMessageScrollDownAndResetForm(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    this.formTarget.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}

// {}
// received: data => this.#insertMessageAndScrollDown(data);
