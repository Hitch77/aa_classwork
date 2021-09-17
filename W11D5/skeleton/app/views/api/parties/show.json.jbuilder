json.extract! @party, :name, :location

json.guests do
    @party.guests.each do |guest|
        json.set! guest.id do
            json.extract! guest, :id
            json.name guest.name
        end
    end
end


# json.gifts do
#     @guest.gifts.each do |gift|
#         json.set! gift.id do
#             json.extract! gift, :id
#             json.person gift.guest.name
#         end
#     end
# end
