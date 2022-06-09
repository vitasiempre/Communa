// app/javascript/channels/chat_channel.js
import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "ChatChannel" }, {
  received(data) {
    this.appendLine(data)
  },

  appendLine(data) {
    const html = this.createLine(data)
    const element = document.querySelector("[data-chat-room='Best Room']")
    element.insertAdjacentHTML("beforeend", html)
  },

  createLine(data) {
    return `
      <article class="chat-line">
        <span class="speaker">${data}</span>
      </article>
    `
  }
})


console.log('Cat')
