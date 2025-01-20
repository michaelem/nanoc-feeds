require "json"
require "nanoc"

module Nanoc::Feeds::Helpers::Feeds
  include Nanoc::Helpers::Blogging

  def feed(params = {})
    if @rep.name == :json
      json_feed(params)
    else
      atom_feed(params)
    end
  end

  def json_feed(params = {})
    articles = params[:articles]
    articles = articles.first(params[:limit]) if params[:limit]
    title = params[:title] || @config[:title]

    items = articles.map { |article| build_for_article(article, title) }

    {
      version: "https://jsonfeed.org/version/1.1",
      title: title,
      home_page_url: "#{config[:base_url]}",
      feed_url: feed_url,
      items: items
    }.to_json
  end

  def build_for_article(article, title)
    {
      id: "#{config[:base_url]}#{article.identifier.without_exts}",
      url: url_for(article),
      title: article[:title] || title,
      content_text: "#{article.compiled_content}",
      date_published: "#{article[:created_at].rfc3339}"
    }
  end
end
