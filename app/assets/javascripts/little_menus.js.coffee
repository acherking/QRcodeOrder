# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
    $('#add-to-menu').click ->
      $.ajax({
        url: "/little_menus.json",
        type: "POST",
        data: {food_id: $("#food-id").text(), number: $("#food-number").val() },
        success:(data) ->
            return false
          error:(data) ->
            return false
      })

# 刷新
$ ->
  $('#shuaxin').on 'click', (event) ->
    location.reload()
    return
  return

