
def authentication_headers(user)
  { 'X-USER-EMAIL' => user.email, 'X-USER-TOKEN' => user.authentication_token }
end
