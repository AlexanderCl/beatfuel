$.ajax
  url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
  dataType: 'script'
  cache: true

window.fbAsyncInit = ->
  FB.init(appId: '542813182473001', status: true, xfbml: true, oauth: true,  cookie: true)

  $('.fb_sign_in').click (e) ->
    e.preventDefault()
    FB.login (response) ->
      window.location = '/auth/facebook/callback' if response.authResponse

  $('.fb_sign_out').click (e) ->
    FB.getLoginStatus (response) ->
      FB.logout() if response.authResponse
    true

