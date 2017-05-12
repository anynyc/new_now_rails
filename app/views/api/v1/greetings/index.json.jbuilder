json.greeting do
  json.id @greeting.id.to_s
  json.title @greeting.title
  json.edition @greeting.edition
end
