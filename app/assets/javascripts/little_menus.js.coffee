# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('#add-to-menu').click ->
      $.ajax({
        url: "http://localhost:3000/little_menus.json",
        type: "POST",
        data: { authentication_str: $("#authentication-str").text(), 
        food_id: $("#food-id").text(), number: $("#food-number").val() },
        success:(data) ->
            alert(data.id + "success")
            return false
          error:(data) ->
            return false
      })