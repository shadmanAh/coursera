// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery";
import * as bootstrap from "bootstrap";
import "trix"
import "@rails/actiontext"
// import "trix/dist/trix"
import "chartkick"
import "Chart.bundle"

import "./controllers/jquery-ui"

$( function(){                               // document).on('turbolinks:load',
  $('.lesson-sortable').sortable({
    cursor: "grabbing",
    cursorAt: { left: 10 },
    placeholder: "ui-state-highlight",
    update: function(e, ui){
      let item = ui.item;
      let item_data = item.data();
      let params = {_method: 'put'};
      params[item_data.modelName] = { row_order_position: item.index() }
      $.ajax({
        type: 'POST',
        url: item_data.updateUrl,
        dataType: 'json',
        data: params
      });
    },
    stop: function(e, ui){
      console.log("stop called when finishing sort of cards")
    }
  });
});

$( function() {
  $( ".sortable" ).sortable();
} );