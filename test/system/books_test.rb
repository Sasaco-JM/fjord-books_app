# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)

    visit root_path
    fill_in 'user_email', with: 'alice@example.com'
    fill_in 'user_password', with: 'password'

    click_on 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'book_memo', with: @book.memo
    fill_in 'book_title', with: @book.title
    click_on '登録する'

    assert_text '本が作成されました。'
    click_on '戻る'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集', match: :smart

    fill_in 'book_memo', with: @book.memo
    fill_in 'book_title', with: @book.title
    click_on '更新する'

    assert_text '本が更新されました。'
    click_on '戻る'
  end

  test 'destroying a Book' do
    visit books_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました。'
  end
end
