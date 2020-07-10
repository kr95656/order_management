class Form::Item < Item
  REGISTRABLE_ATTRIBUTES = %i(
    name
    price
    size_id
    weight_id
    shipping_prefecture_id
    tax
    shipping_day_id
    processing_id(1i) processing_id(2i) processing_id(3i)
    expiration_date_id(1i) expiration_date_id(2i) expiration_date_id(3i)
  )
end