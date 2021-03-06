xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Q n A"
    xml.description "Questions!Questions!Questions!!!"
    xml.link posts_url
    xml.ttl "2"
    for post in @posts
      xml.item do
        xml.title post.content
        xml.description post.name
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end
