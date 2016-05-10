# -*- coding: utf-8 -*-
require 'test_helper'
require_relative '../lib/takosan'

class TakosanTest < Test::Unit::TestCase
  def setup
    Takosan.url = "http://irc.example.com:4649"
    Takosan.channel = "#example"
  end

  def test_privmsg
    http = mock('http')
    http.stub_everything
    http.expects(:request)
    Net::HTTP.expects(:new).with('irc.example.com', 4649).returns(http)

    req = mock('req')
    req.stub_everything
    req.expects(:form_data=).with do |params|
      (params['channel'] == '#example') && (params['message'] == 'foo bar buzz')
    end
    Net::HTTP::Post.expects(:new).with('/privmsg').returns(req)

    Takosan.privmsg('foo bar buzz')
  end

  def test_rescue_timeout_error
    http = stub('http')
    http.stub_everything
    http.stubs(:request).raises(TimeoutError, 'timeout error!')
    Net::HTTP.expects(:new).with('irc.example.com', 4649).returns(http)

    req = stub('req')
    req.stub_everything
    Net::HTTP::Post.expects(:new).with('/privmsg').returns(req)

    assert_nothing_raised do
      Takosan.privmsg('foo bar buzz')
    end
  end

  def test_rescue_socket_error
    http = stub('http')
    http.stub_everything
    http.stubs(:request).raises(SocketError, 'connection error!')
    Net::HTTP.expects(:new).with('irc.example.com', 4649).returns(http)

    req = stub('req')
    req.stub_everything
    Net::HTTP::Post.expects(:new).with('/privmsg').returns(req)

    assert_nothing_raised do
      Takosan.privmsg('foo bar buzz')
    end
  end
end
