import { Controller } from "stimulus"
import { FetchRequest } from "@rails/request.js"

export default class extends Controller {
  static targets = [ "replies", "btn", "form", "text" ]
  static values = { commentId: String }

  connect() {
  }

  openForm() {
    this.formTarget.classList.remove("d-none");
  }

  async createReply() {
    const response = this.sendData();
    const data = await response
    this.insertReply(data)
  }

  async sendData() {
    const request = new FetchRequest("post",
                                    `/comments/${this.commentIdValue}/replies`,
                                    {responseKind: "json",
                                    body: {text: this.textTarget.value}});
    const response = await request.perform();
    if (response.ok) {
      return await response.json
    }
  }

  insertReply(data) {
    this.repliesTarget.insertAdjacentHTML("beforeEnd", `<h5>${data.nickname}</h5><p>${data.reply.text}</p>`)
    this.textTarget.value = ""
    this.formTarget.classList.add("d-none")
  }
}
