json.array!(@gifts) do |gift|
    json.guest_id gift.guest_id
    json.title gift.title
    json.description gift.description
end