module ApplicationHelper
  include Pagy::Frontend

  def login?
    current_user.present?
  end

  def default_meta_tags
    {
      site: Settings.system[:title],
      title: Settings.system[:title],
      reverse: true,
      separator: '|',
      description: Settings.system[:description],
      keywords: ['Twitter', '手紙', 'レター'],
      canonical: request.original_url,
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('logo.png') },
        { href: image_url('logo.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/png' },
      ],
      og: {
        site_name: Settings.system[:title],
        title: Settings.system[:title],
        description: Settings.system[:description], 
        type: 'website',
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: ENV['TWITTER_CARD_TYPE'],
        site: "@#{Settings.system[:twitter_site]}",
      },
    }
  end
end
