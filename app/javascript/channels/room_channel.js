import consumer from "./consumer"

$(function() {
  const chatChannel = consumer.subscriptions.create({ channel: 'RoomChannel', room: 'room_channel' }, {
    connected() {
      console.log("hello")
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      console.log(data)
      return $('#messages').append(data['message']);
    },

    speak: function(message, room_id) {
      $(messages).animate({scrollTop: $(messages)[0].scrollHeight})
      return this.perform('speak', {
        message: message,
        room_id: room_id
      });
    }
  });


  $(document).on('keypress', '[data-behavior~=room_speaker]', function(event) {
    if (event.keyCode === 13) {
      chatChannel.speak(event.target.value, $("#room_id").val());
      event.target.value = '';
      return event.preventDefault();
    }
  });
});