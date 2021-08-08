class VerseTickJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    if verse = Verse.find_by(uuid: uuid)
      verse.tick!
    end
  end
end
