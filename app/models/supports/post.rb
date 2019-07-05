# frozen_string_literal: true

class Supports::Post
  attr_reader :post

  def initialize(post)
    @post ||= post
  end
end
