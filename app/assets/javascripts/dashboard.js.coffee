$ ->

#operation with order sum
  change_sum =  ->
    sum = 0
    $.each $('.corse_check_box:checked'), (e) ->
      sum += parseInt($(this).attr('price'))
    $('.sum').text(sum)
    $('#order_sum').val(sum)

  $(document).on 'click', '.corse_check_box', ->
    change_sum()
    $('#order_not_order').attr('checked', false)

  $(document).on 'click', '#order_not_order', ->
    if $('#order_not_order:checked').length > 0
      $('.corse_check_box:checked').attr('checked', false)
      change_sum()


