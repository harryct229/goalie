class OpenGroup < Group
  def open?
    true
  end

  def self.search_group(keyword)
    OpenGroup.where("name like ?", "%#{keyword}%").all
  end
end
