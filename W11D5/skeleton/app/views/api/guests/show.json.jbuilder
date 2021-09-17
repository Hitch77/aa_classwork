json.extract! @guest, :id, :name, :age, :favorite_color

json.gifts do
    @guest.gifts.each do |gift|
        json.set! gift.id do
            json.extract! gift, :id
            json.person gift.guest.name
        end
    end
end

