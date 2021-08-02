class VerseWord < ApplicationRecord
  belongs_to :verse

  def self.hidden
    where(visible: false)
  end

  def self.invisible
    hidden
  end

  def self.visible
    where(visible: true)
  end
end
