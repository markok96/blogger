require "test_helper"

class ArchiveMailerTest < ActionMailer::TestCase
  def setup
    @article = Article.last
  end

  test "article_archived" do
    mail = ArchiveMailer.article_archived(@article)
    assert_equal "Article #{@title} has been archived", mail.subject
    assert_equal [@email], mail.to
    assert_equal ["jonathanpeterson314@gmail.com"], mail.from
    assert_match "Hello <%= @user %>


Your article <%= @title %> has been archived.", mail.body.encoded
  end

end
