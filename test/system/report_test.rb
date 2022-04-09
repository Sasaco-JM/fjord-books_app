# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)

    visit root_path
    fill_in 'user_email', with: 'alice@example.com'
    fill_in 'user_password', with: 'password'

    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url
    assert_selector 'h1', exact_text: '日報'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'report_title', with: @report.title
    fill_in 'report_content', with: @report.content
    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集', match: :smart

    fill_in 'report_title', with: @report.title
    fill_in 'report_content', with: @report.content
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Report' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
