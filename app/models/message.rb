class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }
  after_create_commit { MessageBroadcastJob.perform_later self }
  belongs_to :room
en