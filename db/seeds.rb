# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# ...existing code...

base_quotes = [
  "Acredite em si mesmo e em tudo o que você é.",
  "O melhor momento para começar é agora.",
  "Sua única limitação é a sua imaginação.",
  "Se desafie, porque ninguém mais fará isso por você.",
  "Grandes conquistas nunca vêm da zona de conforto."
]

base_quotes.each { |c| Quote.find_or_create_by!(content: c) }

# Gera extras com: EXTRA_QUOTES=100 bin/rails db:seed
if 100.to_i > 0
  require "set"
  n = 100.to_i
  seen = Set.new(Quote.pluck(:content))
  created = 0
  while created < n
    content = Inspirational.build
    next if seen.include?(content)
    Quote.create!(content: content)
    seen << content
    created += 1
  end
  puts "Seeds: geradas #{created} frases extras."
end
