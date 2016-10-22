json.array!(@posts) do |post|
  json.extract! post, :id, :titulo, :subtitulo, :texto
  json.url post_url(post, format: :json)
end
