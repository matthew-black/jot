class Jot < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  def content_preview
    self.content.split[0..3].join(' ').concat('...')
  end

end
