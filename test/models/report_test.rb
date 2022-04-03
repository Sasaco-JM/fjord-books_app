# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    she = User.create!(email: 'she@example.com', password: 'password')

    me_report = me.reports.create!(title: 'report_title', content: 'report_content')
    assert me_report.editable?(me)
    assert_not me_report.editable?(she)
  end

  test '#created_on' do
    me = User.create!(email: 'me@example.com', password: 'password')

    me_report = me.reports.create!(title: 'report_title', content: 'report_content')
    assert me_report.created_on.to_s
  end
end
