module SnslinkHelper

  # Twitter投稿へのリンク
  def link_to_twitter(url, msg = '', hashtags = '')
    link_to Settings.system[:twitter][:share_url] + "?url=#{url}&text=#{msg}&hashtags=#{hashtags}", class: "btn", style: "font-size: 2rem;color:#1DA1F2;", target: "_blank", rel: "noopener" do
      icon 'fab', 'twitter-square'
    end
  end

  # Line投稿へのリンク
  def link_to_line(url, msg = '', hashtags = '')
    msg = add_hashtag_to_msg(msg, hashtags)
    link_to Settings.system[:line][:share_url] + "?url=#{url}&text=#{msg}", class: "btn", style: "font-size: 2rem;color:#00B900;", target: "_blank", rel: "noopener" do
      icon 'fab', 'line'
    end
  end

  # Facebook投稿へのリンク
  def link_to_facebook(url, msg = '', hashtags = '')
    msg = add_hashtag_to_msg(msg, hashtags)
    link_to Settings.system[:facebook][:share_url] + "?u=#{url}", class: "btn", style: "font-size: 2rem;color:#3C5A99;", target: "_blank", rel: "noopener" do
      icon 'fab', 'facebook-square'
    end
  end

  # メール送信へのリンク
  def link_to_mail(url, title, msg = '', hashtags = '')
    msg = add_hashtag_to_msg(msg, hashtags)
    msg = "#{msg}%0a#{url}"
    link_to Settings.system[:mail][:share_url] + "?subject=#{title}&body=#{msg}", class: "btn", style: "font-size: 2rem;color:red;", target: "_blank", rel: "noopener" do
      icon 'fas', 'envelope-square'
    end
  end

  private

    def add_hashtag_to_msg(msg, hashtags)
      hashtagArray = hashtags.split(',')
      hashtagArray.each do |hashtag|
        msg = msg + "%23#{hashtag} "
      end

      msg
    end

end