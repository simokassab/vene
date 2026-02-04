# frozen_string_literal: true

class ProcessedWebhook < ApplicationRecord
  WEBHOOK_TYPES = %w[montypay].freeze

  validates :webhook_id, presence: true
  validates :webhook_type, presence: true, inclusion: { in: WEBHOOK_TYPES }
  validates :processed_at, presence: true

  # Check if a webhook was already processed
  # @param webhook_id [String] The unique ID from the payment provider
  # @param webhook_type [String] The type of webhook (e.g., "montypay")
  # @return [Boolean]
  def self.processed?(webhook_id, webhook_type: "montypay")
    exists?(webhook_id: webhook_id, webhook_type: webhook_type)
  end

  # Record a processed webhook with race condition handling
  # @param webhook_id [String] The unique ID from the payment provider
  # @param webhook_type [String] The type of webhook
  # @param order_id [String, nil] The associated order ID
  # @param payload [Hash] The webhook payload for debugging
  # @return [ProcessedWebhook, false] The record if created, false if duplicate
  def self.record!(webhook_id, webhook_type: "montypay", order_id: nil, payload: {})
    create!(
      webhook_id: webhook_id,
      webhook_type: webhook_type,
      order_id: order_id,
      payload: payload,
      processed_at: Time.current
    )
  rescue ActiveRecord::RecordNotUnique
    # Race condition: another process already recorded this webhook
    false
  end
end
