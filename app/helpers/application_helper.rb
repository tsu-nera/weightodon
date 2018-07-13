module ApplicationHelper
  def default_meta_tags
    {
        site: 'WeightoDon',
        title: 'スマートな体重記録Webサイト',
        reverse: true,
        charset: 'utf-8',
        description: '体重を記録するWebサービス。完全匿名なTwitterクローン、Mastodonと連携。スマート体重計やスマートスピーカーとの連携。',
        keywords: '体重, 記録, Webサービス, Mastodon, マストドン, スマート体重計, Nokia, Fitbit, 体重グラフ, スマートスピーカー, Google Home, Alexa',
        canonical: request.original_url,
        separator: '|',
        icon: [
            { href: image_url('favicon.ico') }
        ],
     }
  end
end