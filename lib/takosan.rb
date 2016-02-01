# -*- coding: utf-8 -*-
require 'net/http'
require 'uri'
require 'pathname'
require 'active_support/all'

module Takosan
  mattr_accessor :url, :channel, :name, :icon

  module_function

  def privmsg(message)
    request('/privmsg', { 'channel' => @@channel, 'message' => message, 'name' => @@name, 'icon' => @@icon })
  end

  def uri_for(path = nil)
    uri = URI.parse("#{@@url}/#{path}")
    uri.path = Pathname.new(uri.path).cleanpath.to_s
    uri
  end

  def request(path, params)
    begin
      uri = uri_for(path)

      http = Net::HTTP.new(uri.host, uri.port)
      http.open_timeout = http.read_timeout = 10

      req = Net::HTTP::Post.new(uri.path)
      req.form_data = params

      http.request(req)
    rescue StandardError, TimeoutError => e
      logger.warn("#{e.class} #{e.message}")
    end
  end

  def logger
    @@_logger ||= Rails.logger
  end
end
