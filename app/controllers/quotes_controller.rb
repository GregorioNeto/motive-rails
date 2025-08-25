# frozen_string_literal: true

class QuotesController < ApplicationController
  def index
    render inertia: "Quotes", props: {
      quotes: Quote.all.as_json,
      random_quote: Quote.order("RANDOM()").first
    }
  end
end
