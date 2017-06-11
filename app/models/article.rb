class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings
  
  def tag_list
    tags.join(", ")
  end
  
  def tag_list=(tags_string)
    # The specified string will look something like "tag1, tag2, tag3".
    # Split the specified string into individual tags, remove whitespace, make all tag letters
    # lower case, and remove any duplicates (e.g. "tag1" and "Tag1" should be a single tag)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    # If any of the specified tags don't exist yet, create them and assign them to this article
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end
end
