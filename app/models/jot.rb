class Jot < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates :content, presence: true

  def content_preview
    self.content.split[0..3].join(' ').concat('...')
  end

  def viewability
    if self.public_post
      "make private"
    else
      "make public"
    end
  end

  def toggle_visibility
    if self.public_post
      self.public_post = false
    else
      self.public_post = true
    end
    self.save
  end

end
