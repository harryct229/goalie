module UsersHelper
  def gravatar_for(user, size: 80, wrapper_html: "gravatar-photo", image_only: false)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag_html = image_tag(gravatar_url, alt: user.fullname,
      class: wrapper_html)
    return image_tag_html if image_only
    link_to(image_tag_html, user)
  end
end

