require "test_helper"

class ArchiveMailerTest < ActionMailer::TestCase
  test "article_archived" do
    mail = ArchiveMailer.article_archived
    assert_equal "Article archived", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
