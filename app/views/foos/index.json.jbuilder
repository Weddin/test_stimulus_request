json.data do
  json.array! @foos do |foo|
    json.url foo_url(foo)
    json.name h(link_to foo.name, foo_path(foo), class: "text-blue-600 hover:text-blue-800", data: { turbo: false })
    json.time l(foo.time, format: "%d/%m/%Y %H:%M:%S")
    json.checked foo.checked
    json.price number_to_currency(foo.price)
    json.status foo.status
  end
end
json.pagination do
  json.html paginate(@foos, params: { format: :html }).to_s
  json.info page_entries_info(@foos).to_s
end
