/*!
 * https://himakan.net/tool/sns_button_js
 * MIT license
 */
( function ( d, location ) {

  "use strict";

  var
    origin = location.origin,

    pure_location = location.href.replace( /\?.*$/, '' ),

    site_title = d.title,

    sns_all = {
      twitter: {
        api_path:     'https://twitter.com/intent/tweet?',
        title_param:  'text',
        url_param:    'url',
        title_encode: true,
        url_encode:   false,
        display:      'Twitter'
      },
      facebook: {
        api_path:     'https://www.facebook.com/share.php?',
        title_param:  'title',
        url_param:    'u',
        title_encode: false,
        url_encode:   true,
        display:      'Facebook'
      },
      google: {
        api_path:     'https://plus.google.com/share?',
        url_param:    'url',
        title_encode: false,
        url_encode:   false,
        display:      'Google+'
      },
      hatena: {
        api_path:     'https://b.hatena.ne.jp/add?',
        title_param:  'title',
        url_param:    'url',
        title_encode: true,
        url_encode:   false,
        display:      'はてブ'
      },
      pocket: {
        api_path:     'https://getpocket.com/edit?',
        title_param:  'title',
        url_param:    'url',
        title_encode: false,
        url_encode:   true,
        display:      'Pocket'
      },
      line: {
        api_path:     'https://line.me/R/msg/text/?',
        title_encode: false,
        url_encode:   false,
        url_param:    '',
        display:      'LINE'
      },
      slack: {
        api_path:     'http://slackbutton.herokuapp.com/post/new/?',
        url_param:    'url',
        title_encode: false,
        url_encode:   true,
        display:      'Slack'
      },
      mixi: {
        api_path:     'https://mixi.jp/recent_voice.pl?',
        url_param:    'status',
        title_encode: false,
        url_encode:   false,
        display:      'mixi'
      },
      chatwork: {
        api_path:     'https://www.chatwork.com/packages/share/new.php?',
        title_param:  'title',
        url_param:    'url',
        title_encode: true,
        url_encode:   true,
        display:      'ChatWork'
      },
      evernote: {
        api_path:     'https://www.evernote.com/noteit.action?',
        title_param:  'title',
        url_param:    'url',
        title_encode: false,
        url_encode:   false,
        display:      'Evernote'
      },
      feedly: {
        api_path:     'https://feedly.com/i/subscription/feed/' + origin + '/feed',
        title_encode: false,
        url_encode:   false,
        display:      'Feedly'
      },
      linkedin: {
        api_path:     'https://www.linkedin.com/cws/share?',
        url_param:    'url',
        title_encode: true,
        url_encode:   true,
        display:      'LinkedIn'
      },
      skype: {
        api_path:     'https://web.skype.com/share?',
        url_param:    'url',
        title_encode: false,
        url_encode:   true,
        display:      'Skype'
      },
      tumblr: {
        api_path:     'https://www.tumblr.com/widgets/share/tool?',
        title_param:  'caption',
        url_param:    'url',
        title_encode: true,
        url_encode:   true,
        display:      'Tumblr'
      },
      rss: {
        api_path:     origin + '/feed',
        title_encode: false,
        url_encode:   false,
        display:      'rss'
      }
    },

    _a_tag_generator = function ( title, href ) {
      var
        a = d.createElement( 'a' );

      a.setAttribute( 'href', href );
      a.setAttribute( 'target', '_blank' );
      a.innerHTML = title;

      return a;
    },

    _href_generator = function ( sns ) {
      var
        title = sns.title_encode ? encodeURIComponent( site_title )    : site_title,
        url   = sns.url_encode   ? encodeURIComponent( pure_location ) : pure_location,
        href  = sns.api_path,
        params = '';

      params += sns.title_param ? sns.title_param + '=' + title : '';
      params += '' !== params   ? '&' : '';
      params += sns.url_param ? sns.url_param + '=' + url : ( '' === sns.url_param ? url : '' );

      return href + params;
    },

    _set_a_tag = function ( selector, sns ) {
      var
        href = _href_generator( sns ),
        a_tag = _a_tag_generator( sns.display, href );

      selector.append( a_tag );
    },

    _init = function () {
      var
        sns_prefix = 'sns_button_', selectors, i;

      for ( i in  sns_all ) {
        selectors = d.getElementsByClassName( sns_prefix + i );

        Array.prototype.forEach.call( selectors, function( selector ) {
          _set_a_tag( selector, sns_all[ i ] );
        });
      }
    };

  _init();
})( document, window.location );
